package im.actor.server.api.rpc.service.groups

import akka.actor.ActorSystem
import im.actor.api.rpc.PeerHelpers._
import im.actor.api.rpc._
import im.actor.api.rpc.files.ApiFileLocation
import im.actor.api.rpc.groups._
import im.actor.api.rpc.misc.ResponseSeqDate
import im.actor.api.rpc.peers.{ ApiGroupOutPeer, ApiUserOutPeer }
import im.actor.server.ApiConversions._
import im.actor.server.acl.ACLUtils.accessToken
import im.actor.server.db.DbExtension
import im.actor.server.file.{ FileErrors, FileStorageAdapter, ImageUtils, S3StorageExtension }
import im.actor.server.group.{ GroupCommands, GroupErrors, GroupExtension }
import im.actor.server.presences.GroupPresenceExtension
import im.actor.server.sequence.{ SeqState, SeqStateDate }
import im.actor.server.user.UserExtension
import im.actor.server.{ models, persist }
import im.actor.util.misc.IdUtils
import slick.dbio.DBIO
import slick.driver.PostgresDriver.api._

import scala.concurrent.forkjoin.ThreadLocalRandom
import scala.concurrent.{ ExecutionContext, Future }

final class GroupsServiceImpl(groupInviteConfig: GroupInviteConfig)(implicit actorSystem: ActorSystem) extends GroupsService {

  import FileHelpers._
  import GroupCommands._
  import IdUtils._
  import ImageUtils._

  override implicit val ec: ExecutionContext = actorSystem.dispatcher

  private val db: Database = DbExtension(actorSystem).db
  private val groupExt = GroupExtension(actorSystem)
  private val userExt = UserExtension(actorSystem)
  private implicit val fsAdapter: FileStorageAdapter = S3StorageExtension(actorSystem).s3StorageAdapter
  private val groupPresenceExt = GroupPresenceExtension(actorSystem)

  override def jhandleEditGroupAvatar(groupOutPeer: ApiGroupOutPeer, randomId: Long, fileLocation: ApiFileLocation, clientData: ClientData): Future[HandlerResult[ResponseEditGroupAvatar]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withOwnGroupMember(groupOutPeer, client.userId) { fullGroup ⇒
        withFileLocation(fileLocation, AvatarSizeLimit) {
          scaleAvatar(fileLocation.fileId, ThreadLocalRandom.current()) flatMap {
            case Right(avatar) ⇒
              for {
                UpdateAvatarAck(avatar, SeqStateDate(seq, state, date)) ← DBIO.from(groupExt.updateAvatar(fullGroup.id, client.userId, client.authId, Some(avatar), randomId))
              } yield Ok(ResponseEditGroupAvatar(
                avatar.get,
                seq,
                state.toByteArray,
                date
              ))
            case Left(e) ⇒
              throw FileErrors.LocationInvalid
          }
        }
      }
    }

    db.run(toDBIOAction(authorizedAction)) recover {
      case FileErrors.LocationInvalid ⇒ Error(Errors.LocationInvalid)
    }
  }

  override def jhandleRemoveGroupAvatar(groupOutPeer: ApiGroupOutPeer, randomId: Long, clientData: ClientData): Future[HandlerResult[ResponseSeqDate]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withOwnGroupMember(groupOutPeer, client.userId) { fullGroup ⇒
        for {
          UpdateAvatarAck(avatar, SeqStateDate(seq, state, date)) ← DBIO.from(groupExt.updateAvatar(fullGroup.id, client.userId, client.authId, None, randomId))
        } yield Ok(ResponseSeqDate(
          seq,
          state.toByteArray,
          date
        ))
      }
    }

    db.run(toDBIOAction(authorizedAction))
  }

  override def jhandleKickUser(groupOutPeer: ApiGroupOutPeer, randomId: Long, userOutPeer: ApiUserOutPeer, clientData: ClientData): Future[HandlerResult[ResponseSeqDate]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withKickableGroupMember(groupOutPeer, userOutPeer) { fullGroup ⇒ //maybe move to group peer manager
        for {
          //todo: get rid of DBIO.from
          SeqStateDate(seq, state, date) ← DBIO.from(groupExt.kickUser(fullGroup.id, userOutPeer.userId, randomId))
        } yield {
          groupPresenceExt.notifyGroupUserRemoved(fullGroup.id, userOutPeer.userId)
          Ok(ResponseSeqDate(seq, state.toByteArray, date))
        }
      }
    }
    db.run(toDBIOAction(authorizedAction))
  }

  override def jhandleLeaveGroup(groupOutPeer: ApiGroupOutPeer, randomId: Long, clientData: ClientData): Future[HandlerResult[ResponseSeqDate]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withOwnGroupMember(groupOutPeer, client.userId) { fullGroup ⇒
        for {
          SeqStateDate(seq, state, date) ← DBIO.from(groupExt.leaveGroup(fullGroup.id, randomId))
        } yield {
          groupPresenceExt.notifyGroupUserRemoved(fullGroup.id, client.userId)
          Ok(ResponseSeqDate(seq, state.toByteArray, date))
        }
      }
    }
    db.run(toDBIOAction(authorizedAction))
  }

  override def jhandleCreateGroup(randomId: Long, title: String, users: Vector[ApiUserOutPeer], clientData: ClientData): Future[HandlerResult[ResponseCreateGroup]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withUserOutPeers(users) {
        withValidGroupTitle(title) { validTitle ⇒
          val groupId = nextIntId(ThreadLocalRandom.current())
          val userIds = users.map(_.userId).toSet
          val groupUserIds = userIds + client.userId

          val f = for (res ← groupExt.create(groupId, title, randomId, userIds)) yield {
            Ok(ResponseCreateGroup(
              groupPeer = ApiGroupOutPeer(groupId, res.accessHash),
              seq = res.seqstate.seq,
              state = res.seqstate.state.toByteArray,
              users = groupUserIds.toVector,
              date = res.date
            ))
          }

          DBIO.from(f)
        }
      }
    }

    db.run(toDBIOAction(authorizedAction))
  }

  override def jhandleInviteUser(groupOutPeer: ApiGroupOutPeer, randomId: Long, userOutPeer: ApiUserOutPeer, clientData: ClientData): Future[HandlerResult[ResponseSeqDate]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withOwnGroupMember(groupOutPeer, client.userId) { fullGroup ⇒
        withUserOutPeer(userOutPeer) {
          for {
            res ← DBIO.from(groupExt.inviteToGroup(fullGroup.id, userOutPeer.userId, randomId))
          } yield {
            groupPresenceExt.notifyGroupUserAdded(fullGroup.id, userOutPeer.userId)
            Ok(ResponseSeqDate(res.seq, res.state.toByteArray, res.date))
          }
        }
      }
    }

    db.run(toDBIOAction(authorizedAction)) recover {
      case GroupErrors.UserAlreadyInvited ⇒ Error(GroupRpcErrors.UserAlreadyInvited)
    }
  }

  override def jhandleEditGroupTitle(groupOutPeer: ApiGroupOutPeer, randomId: Long, title: String, clientData: ClientData): Future[HandlerResult[ResponseSeqDate]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withOwnGroupMember(groupOutPeer, client.userId) { fullGroup ⇒
        for {
          SeqStateDate(seq, state, date) ← DBIO.from(groupExt.updateTitle(fullGroup.id, client.userId, client.authId, title, randomId))
        } yield Ok(ResponseSeqDate(seq, state.toByteArray, date))
      }
    }

    db.run(toDBIOAction(authorizedAction map (_.transactionally)))
  }

  override def jhandleGetGroupInviteUrl(groupPeer: ApiGroupOutPeer, clientData: ClientData): Future[HandlerResult[ResponseInviteUrl]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withOwnGroupMember(groupPeer, client.userId) { fullGroup ⇒
        for {
          token ← persist.GroupInviteToken.find(fullGroup.id, client.userId).headOption.flatMap {
            case Some(invToken) ⇒ DBIO.successful(invToken.token)
            case None ⇒
              val token = accessToken(ThreadLocalRandom.current())
              val inviteToken = models.GroupInviteToken(fullGroup.id, client.userId, token)
              for (_ ← persist.GroupInviteToken.create(inviteToken)) yield token
          }
        } yield Ok(ResponseInviteUrl(genInviteUrl(groupInviteConfig.baseUrl, token)))
      }
    }
    db.run(toDBIOAction(authorizedAction))
  }

  override def jhandleJoinGroup(url: String, clientData: ClientData): Future[HandlerResult[ResponseJoinGroup]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withValidInviteToken(groupInviteConfig.baseUrl, url) { (fullGroup, token) ⇒
        val group = models.Group.fromFull(fullGroup)

        val join = groupExt.joinGroup(
          groupId = group.id,
          joiningUserId = client.userId,
          joiningUserAuthId = client.authId,
          invitingUserId = token.creatorId
        )
        for {
          (seqstatedate, userIds, randomId) ← DBIO.from(join)
          userStructs ← DBIO.from(Future.sequence(userIds.map(userExt.getApiStruct(_, client.userId, client.authId))))
          groupStruct ← DBIO.from(groupExt.getApiStruct(group.id, client.userId))
        } yield Ok(ResponseJoinGroup(groupStruct, seqstatedate.seq, seqstatedate.state.toByteArray, seqstatedate.date, userStructs.toVector, randomId))
      }
    }
    db.run(toDBIOAction(authorizedAction)) recover {
      case GroupErrors.UserAlreadyInvited ⇒ Error(GroupRpcErrors.UserAlreadyInvited)
    }
  }

  override def jhandleEnterGroup(peer: ApiGroupOutPeer, clientData: ClientData): Future[HandlerResult[ResponseEnterGroup]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withPublicGroup(peer) { fullGroup ⇒
        persist.GroupUser.find(fullGroup.id, client.userId) flatMap {
          case Some(_) ⇒ DBIO.successful(Error(GroupRpcErrors.UserAlreadyInvited))
          case None ⇒
            val group = models.Group.fromFull(fullGroup)
            for {
              (seqstatedate, userIds, randomId) ← DBIO.from(groupExt.joinGroup(group.id, client.userId, client.authId, fullGroup.creatorUserId))
              userStructs ← DBIO.from(Future.sequence(userIds.map(userExt.getApiStruct(_, client.userId, client.authId))))
              groupStruct ← DBIO.from(groupExt.getApiStruct(group.id, client.userId))
            } yield Ok(ResponseEnterGroup(groupStruct, userStructs.toVector, randomId, seqstatedate.seq, seqstatedate.state.toByteArray, seqstatedate.date))
        }
      }
    }

    db.run(toDBIOAction(authorizedAction)) recover {
      case GroupErrors.UserAlreadyInvited ⇒ Error(GroupRpcErrors.UserAlreadyInvited)
    }
  }

  override def jhandleRevokeInviteUrl(groupPeer: ApiGroupOutPeer, clientData: ClientData): Future[HandlerResult[ResponseInviteUrl]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      withOwnGroupMember(groupPeer, client.userId) { fullGroup ⇒
        val token = accessToken(ThreadLocalRandom.current())
        val inviteToken = models.GroupInviteToken(fullGroup.id, client.userId, token)

        for {
          _ ← persist.GroupInviteToken.revoke(fullGroup.id, client.userId)
          _ ← persist.GroupInviteToken.create(inviteToken)
        } yield Ok(ResponseInviteUrl(genInviteUrl(groupInviteConfig.baseUrl, token)))
      }
    }
    db.run(toDBIOAction(authorizedAction))
  }

  /**
   * all members of group can edit group topic
   */
  def jhandleEditGroupTopic(groupPeer: ApiGroupOutPeer, randomId: Long, topic: Option[String], clientData: ClientData): Future[HandlerResult[ResponseSeqDate]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      for {
        SeqStateDate(seq, state, date) ← DBIO.from(groupExt.updateTopic(groupPeer.groupId, client.userId, client.authId, topic, randomId))
      } yield Ok(ResponseSeqDate(seq, state.toByteArray, date))
    }
    db.run(toDBIOAction(authorizedAction map (_.transactionally))) recover {
      case GroupErrors.NotAMember   ⇒ Error(CommonErrors.forbidden("User is not a group member."))
      case GroupErrors.TopicTooLong ⇒ Error(GroupRpcErrors.TopicTooLong)
    }
  }

  /**
   * only admin can change group's about
   */
  def jhandleEditGroupAbout(groupPeer: ApiGroupOutPeer, randomId: Long, about: Option[String], clientData: ClientData): Future[HandlerResult[ResponseSeqDate]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      for {
        SeqStateDate(seq, state, date) ← DBIO.from(groupExt.updateAbout(groupPeer.groupId, client.userId, client.authId, about, randomId))
      } yield Ok(ResponseSeqDate(seq, state.toByteArray, date))
    }
    db.run(toDBIOAction(authorizedAction map (_.transactionally))) recover {
      case GroupErrors.NotAdmin     ⇒ Error(CommonErrors.forbidden("Only admin can perform this action."))
      case GroupErrors.AboutTooLong ⇒ Error(GroupRpcErrors.AboutTooLong)
    }
  }

  /**
   * only admin can give another group member admin rights
   * if this user id already admin - `GroupErrors.UserAlreadyAdmin` will be returned
   * it could be many admins in one group
   */
  def jhandleMakeUserAdmin(groupPeer: ApiGroupOutPeer, userPeer: ApiUserOutPeer, clientData: ClientData): Future[HandlerResult[ResponseMakeUserAdmin]] = {
    val authorizedAction = requireAuth(clientData).map { implicit client ⇒
      for {
        (members, SeqState(seq, state)) ← DBIO.from(groupExt.makeUserAdmin(groupPeer.groupId, client.userId, client.authId, userPeer.userId))
      } yield Ok(ResponseMakeUserAdmin(members, seq, state.toByteArray))
    }
    db.run(toDBIOAction(authorizedAction map (_.transactionally))) recover {
      case GroupErrors.NotAMember       ⇒ Error(CommonErrors.forbidden("User is not a group member."))
      case GroupErrors.NotAdmin         ⇒ Error(CommonErrors.forbidden("Only admin can perform this action."))
      case GroupErrors.UserAlreadyAdmin ⇒ Error(GroupRpcErrors.UserAlreadyAdmin)
    }

  }

}
