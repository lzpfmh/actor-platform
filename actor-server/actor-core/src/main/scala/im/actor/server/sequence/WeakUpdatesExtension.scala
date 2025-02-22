package im.actor.server.sequence

import akka.actor._
import akka.pattern.ask
import akka.util.Timeout
import im.actor.api.rpc.Update
import im.actor.api.rpc.peers.{ ApiPeer, ApiPeerType }
import im.actor.server.persist
import slick.dbio._

import scala.concurrent.Future
import scala.concurrent.duration._

sealed trait WeakUpdatesExtension extends Extension

class WeakUpdatesExtensionImpl(system: ActorSystem) extends WeakUpdatesExtension {
  import WeakUpdatesManager._
  import system.dispatcher
  implicit val timeout: Timeout = Timeout(20.seconds)

  private val region = WeakUpdatesManagerRegion.startRegion()(system)

  def broadcastUserWeakUpdate(userId: Int, update: Update, reduceKey: Option[String]): DBIO[Unit] = {
    val header = update.header
    val serializedData = update.toByteArray
    val msg = PushUpdate(header, serializedData, reduceKey)

    for (authIds ← persist.AuthId.findIdByUserId(userId)) yield {
      authIds foreach { authId ⇒
        region.ref ! Envelope(authId, msg)
      }
    }
  }

  def pushUpdate(authId: Long, update: Update, reduceKey: Option[String]): Unit = {
    val header = update.header
    val serializedData = update.toByteArray
    region.ref ! Envelope(authId, PushUpdate(header, serializedData, reduceKey))
  }

  def reduceKey(updateHeader: Int, peer: ApiPeer): String = s"${updateHeader}-${peer.`type`.id}-${peer.id}"
  def reduceKeyUser(updateHeader: Int, userId: Int): String = s"${updateHeader}-${ApiPeerType.Private.id}-${userId}"
  def reduceKeyGroup(updateHeader: Int, groupId: Int): String = s"${updateHeader}-${ApiPeerType.Group.id}-${groupId}"

  private[sequence] def subscribe(authId: Long, consumer: ActorRef): Future[Unit] =
    region.ref.ask(Envelope(authId, Subscribe(consumer))).mapTo[SubscribeAck].map(_ ⇒ ())

}

object WeakUpdatesExtension extends ExtensionId[WeakUpdatesExtensionImpl] with ExtensionIdProvider {
  override def lookup = WeakUpdatesExtension
  override def createExtension(system: ExtendedActorSystem) = new WeakUpdatesExtensionImpl(system)
}