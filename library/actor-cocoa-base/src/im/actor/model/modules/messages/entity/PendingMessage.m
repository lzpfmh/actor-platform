//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/messages/entity/PendingMessage.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/entity/content/AbsContent.h"
#include "im/actor/model/modules/messages/entity/PendingMessage.h"
#include "java/io/IOException.h"

@interface ImActorModelModulesMessagesEntityPendingMessage () {
 @public
  AMPeer *peer_;
  jlong rid_;
  AMAbsContent *content_;
  jboolean isError__;
}

- (instancetype)init;

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesEntityPendingMessage, peer_, AMPeer *)
J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesEntityPendingMessage, content_, AMAbsContent *)

__attribute__((unused)) static void ImActorModelModulesMessagesEntityPendingMessage_init(ImActorModelModulesMessagesEntityPendingMessage *self);

__attribute__((unused)) static ImActorModelModulesMessagesEntityPendingMessage *new_ImActorModelModulesMessagesEntityPendingMessage_init() NS_RETURNS_RETAINED;

@implementation ImActorModelModulesMessagesEntityPendingMessage

+ (ImActorModelModulesMessagesEntityPendingMessage *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelModulesMessagesEntityPendingMessage_fromBytesWithByteArray_(data);
}

- (instancetype)initWithAMPeer:(AMPeer *)peer
                      withLong:(jlong)rid
              withAMAbsContent:(AMAbsContent *)content {
  ImActorModelModulesMessagesEntityPendingMessage_initWithAMPeer_withLong_withAMAbsContent_(self, peer, rid, content);
  return self;
}

- (instancetype)init {
  ImActorModelModulesMessagesEntityPendingMessage_init(self);
  return self;
}

- (AMPeer *)getPeer {
  return peer_;
}

- (AMAbsContent *)getContent {
  return content_;
}

- (jlong)getRid {
  return rid_;
}

- (jboolean)isError {
  return isError__;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  peer_ = AMPeer_fromUniqueIdWithLong_([((BSBserValues *) nil_chk(values)) getLongWithInt:1]);
  rid_ = [values getLongWithInt:2];
  content_ = AMAbsContent_parseWithByteArray_([values getBytesWithInt:3]);
  isError__ = [values getBoolWithInt:4 withBoolean:NO];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:1 withLong:[((AMPeer *) nil_chk(peer_)) getUnuqueId]];
  [writer writeLongWithInt:2 withLong:rid_];
  [writer writeBytesWithInt:3 withByteArray:AMAbsContent_serializeWithAMAbsContent_(content_)];
  [writer writeBoolWithInt:4 withBoolean:isError__];
}

@end

ImActorModelModulesMessagesEntityPendingMessage *ImActorModelModulesMessagesEntityPendingMessage_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelModulesMessagesEntityPendingMessage_initialize();
  return ((ImActorModelModulesMessagesEntityPendingMessage *) BSBser_parseWithBSBserObject_withByteArray_(new_ImActorModelModulesMessagesEntityPendingMessage_init(), data));
}

void ImActorModelModulesMessagesEntityPendingMessage_initWithAMPeer_withLong_withAMAbsContent_(ImActorModelModulesMessagesEntityPendingMessage *self, AMPeer *peer, jlong rid, AMAbsContent *content) {
  (void) BSBserObject_init(self);
  self->peer_ = peer;
  self->rid_ = rid;
  self->content_ = content;
}

ImActorModelModulesMessagesEntityPendingMessage *new_ImActorModelModulesMessagesEntityPendingMessage_initWithAMPeer_withLong_withAMAbsContent_(AMPeer *peer, jlong rid, AMAbsContent *content) {
  ImActorModelModulesMessagesEntityPendingMessage *self = [ImActorModelModulesMessagesEntityPendingMessage alloc];
  ImActorModelModulesMessagesEntityPendingMessage_initWithAMPeer_withLong_withAMAbsContent_(self, peer, rid, content);
  return self;
}

void ImActorModelModulesMessagesEntityPendingMessage_init(ImActorModelModulesMessagesEntityPendingMessage *self) {
  (void) BSBserObject_init(self);
}

ImActorModelModulesMessagesEntityPendingMessage *new_ImActorModelModulesMessagesEntityPendingMessage_init() {
  ImActorModelModulesMessagesEntityPendingMessage *self = [ImActorModelModulesMessagesEntityPendingMessage alloc];
  ImActorModelModulesMessagesEntityPendingMessage_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesEntityPendingMessage)
