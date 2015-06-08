//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/avatar/OwnAvatarChangeActor.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Avatar.h"
#include "im/actor/model/api/FileLocation.h"
#include "im/actor/model/api/base/SeqUpdate.h"
#include "im/actor/model/api/rpc/RequestEditAvatar.h"
#include "im/actor/model/api/rpc/RequestRemoveAvatar.h"
#include "im/actor/model/api/rpc/ResponseEditAvatar.h"
#include "im/actor/model/api/rpc/ResponseSeq.h"
#include "im/actor/model/api/updates/UpdateUserAvatarChanged.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/entity/FileReference.h"
#include "im/actor/model/modules/Files.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Profile.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/avatar/OwnAvatarChangeActor.h"
#include "im/actor/model/modules/file/UploadManager.h"
#include "im/actor/model/modules/updates/internal/ExecuteAfter.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "im/actor/model/modules/utils/RandomUtils.h"
#include "im/actor/model/mvvm/ValueModel.h"
#include "im/actor/model/network/RpcCallback.h"
#include "im/actor/model/network/RpcException.h"
#include "im/actor/model/viewmodel/AvatarUploadState.h"
#include "im/actor/model/viewmodel/OwnAvatarVM.h"
#include "java/lang/Runnable.h"

@interface ImActorModelModulesAvatarOwnAvatarChangeActor () {
 @public
  jlong currentChangeTask_;
}

@end

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar () {
 @public
  NSString *descriptor_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar, descriptor_, NSString *)

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged () {
 @public
  jlong rid_;
}

@end

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_$1 : NSObject < AMRpcCallback > {
 @public
  ImActorModelModulesAvatarOwnAvatarChangeActor *this$0_;
  jlong val$rid_;
}

- (void)onResult:(APResponseEditAvatar *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor:(ImActorModelModulesAvatarOwnAvatarChangeActor *)outer$
                                                             withLong:(jlong)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesAvatarOwnAvatarChangeActor_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_$1, this$0_, ImActorModelModulesAvatarOwnAvatarChangeActor *)

__attribute__((unused)) static void ImActorModelModulesAvatarOwnAvatarChangeActor_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *self, ImActorModelModulesAvatarOwnAvatarChangeActor *outer$, jlong capture$0);

__attribute__((unused)) static ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *new_ImActorModelModulesAvatarOwnAvatarChangeActor_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(ImActorModelModulesAvatarOwnAvatarChangeActor *outer$, jlong capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesAvatarOwnAvatarChangeActor_$1)

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 : NSObject < JavaLangRunnable > {
 @public
  ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *this$0_;
}

- (void)run;

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1:(ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1, this$0_, ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *)

__attribute__((unused)) static void ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1_(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 *self, ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *outer$);

__attribute__((unused)) static ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 *new_ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1_(ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1)

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_$2 : NSObject < AMRpcCallback > {
 @public
  ImActorModelModulesAvatarOwnAvatarChangeActor *this$0_;
  jlong val$currentRid_;
}

- (void)onResult:(APResponseSeq *)response;

- (void)onError:(AMRpcException *)e;

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor:(ImActorModelModulesAvatarOwnAvatarChangeActor *)outer$
                                                             withLong:(jlong)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesAvatarOwnAvatarChangeActor_$2)

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_$2, this$0_, ImActorModelModulesAvatarOwnAvatarChangeActor *)

__attribute__((unused)) static void ImActorModelModulesAvatarOwnAvatarChangeActor_$2_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *self, ImActorModelModulesAvatarOwnAvatarChangeActor *outer$, jlong capture$0);

__attribute__((unused)) static ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *new_ImActorModelModulesAvatarOwnAvatarChangeActor_$2_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(ImActorModelModulesAvatarOwnAvatarChangeActor *outer$, jlong capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesAvatarOwnAvatarChangeActor_$2)

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 : NSObject < JavaLangRunnable > {
 @public
  ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *this$0_;
}

- (void)run;

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2:(ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1)

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1, this$0_, ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *)

__attribute__((unused)) static void ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2_(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 *self, ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *outer$);

__attribute__((unused)) static ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 *new_ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2_(ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  ImActorModelModulesAvatarOwnAvatarChangeActor_initWithImActorModelModulesModules_(self, modules);
  return self;
}

- (void)changeAvatarWithNSString:(NSString *)descriptor {
  if (currentChangeTask_ != 0) {
    [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) cancelUploadWithLong:currentChangeTask_];
    currentChangeTask_ = 0;
  }
  currentChangeTask_ = ImActorModelModulesUtilsRandomUtils_nextRid();
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(descriptor, YES)];
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) requestUploadWithLong:currentChangeTask_ withNSString:descriptor withNSString:@"avatar.jpg" withDKActorRef:[self self__]];
}

- (void)uploadCompletedWithLong:(jlong)rid
            withAMFileReference:(AMFileReference *)fileReference {
  if (rid != currentChangeTask_) {
    return;
  }
  [self requestWithAPRequest:new_APRequestEditAvatar_initWithAPFileLocation_(new_APFileLocation_initWithLong_withLong_([((AMFileReference *) nil_chk(fileReference)) getFileId], [fileReference getAccessHash])) withAMRpcCallback:new_ImActorModelModulesAvatarOwnAvatarChangeActor_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(self, rid)];
}

- (void)avatarChangedWithLong:(jlong)rid {
  if (rid != currentChangeTask_) {
    return;
  }
  currentChangeTask_ = 0;
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, NO)];
}

- (void)uploadErrorWithLong:(jlong)rid {
  if (rid != currentChangeTask_) {
    return;
  }
  currentChangeTask_ = 0;
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, NO)];
}

- (void)removeAvatar {
  if (currentChangeTask_ != 0) {
    [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) cancelUploadWithLong:currentChangeTask_];
    currentChangeTask_ = 0;
  }
  currentChangeTask_ = ImActorModelModulesUtilsRandomUtils_nextRid();
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, YES)];
  jlong currentRid = currentChangeTask_;
  [self requestWithAPRequest:new_APRequestRemoveAvatar_init() withAMRpcCallback:new_ImActorModelModulesAvatarOwnAvatarChangeActor_$2_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(self, currentRid)];
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar class]]) {
    ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *changeAvatar = (ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *) check_class_cast(message, [ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar class]);
    [self changeAvatarWithNSString:[((ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *) nil_chk(changeAvatar)) getDescriptor]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesFileUploadManager_UploadCompleted class]]) {
    ImActorModelModulesFileUploadManager_UploadCompleted *uploadCompleted = (ImActorModelModulesFileUploadManager_UploadCompleted *) check_class_cast(message, [ImActorModelModulesFileUploadManager_UploadCompleted class]);
    [self uploadCompletedWithLong:[((ImActorModelModulesFileUploadManager_UploadCompleted *) nil_chk(uploadCompleted)) getRid] withAMFileReference:[uploadCompleted getFileReference]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesFileUploadManager_UploadError class]]) {
    ImActorModelModulesFileUploadManager_UploadError *uploadError = (ImActorModelModulesFileUploadManager_UploadError *) check_class_cast(message, [ImActorModelModulesFileUploadManager_UploadError class]);
    [self uploadErrorWithLong:[((ImActorModelModulesFileUploadManager_UploadError *) nil_chk(uploadError)) getRid]];
  }
  else if ([message isKindOfClass:[ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar class]]) {
    [self removeAvatar];
  }
  else if ([message isKindOfClass:[ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged class]]) {
    [self avatarChangedWithLong:[((ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged *) nil_chk(((ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged *) check_class_cast(message, [ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged class])))) getRid]];
  }
  else {
    [self dropWithId:message];
  }
}

@end

void ImActorModelModulesAvatarOwnAvatarChangeActor_initWithImActorModelModulesModules_(ImActorModelModulesAvatarOwnAvatarChangeActor *self, ImActorModelModulesModules *modules) {
  (void) ImActorModelModulesUtilsModuleActor_initWithImActorModelModulesModules_(self, modules);
  self->currentChangeTask_ = 0;
}

ImActorModelModulesAvatarOwnAvatarChangeActor *new_ImActorModelModulesAvatarOwnAvatarChangeActor_initWithImActorModelModulesModules_(ImActorModelModulesModules *modules) {
  ImActorModelModulesAvatarOwnAvatarChangeActor *self = [ImActorModelModulesAvatarOwnAvatarChangeActor alloc];
  ImActorModelModulesAvatarOwnAvatarChangeActor_initWithImActorModelModulesModules_(self, modules);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar

- (instancetype)initWithNSString:(NSString *)descriptor {
  ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar_initWithNSString_(self, descriptor);
  return self;
}

- (NSString *)getDescriptor {
  return descriptor_;
}

@end

void ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar_initWithNSString_(ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *self, NSString *descriptor) {
  (void) NSObject_init(self);
  self->descriptor_ = descriptor;
}

ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *new_ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar_initWithNSString_(NSString *descriptor) {
  ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *self = [ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar alloc];
  ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar_initWithNSString_(self, descriptor);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar

- (instancetype)init {
  ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar_init(self);
  return self;
}

@end

void ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar_init(ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar *self) {
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar *new_ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar_init() {
  ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar *self = [ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar alloc];
  ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged

- (instancetype)initWithLong:(jlong)rid {
  ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged_initWithLong_(self, rid);
  return self;
}

- (jlong)getRid {
  return rid_;
}

@end

void ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged_initWithLong_(ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged *self, jlong rid) {
  (void) NSObject_init(self);
  self->rid_ = rid;
}

ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged *new_ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged_initWithLong_(jlong rid) {
  ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged *self = [ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged alloc];
  ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged_initWithLong_(self, rid);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_$1

- (void)onResult:(APResponseEditAvatar *)response {
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:new_ImActorModelApiBaseSeqUpdate_initWithInt_withByteArray_withInt_withByteArray_([((APResponseEditAvatar *) nil_chk(response)) getSeq], [response getState], APUpdateUserAvatarChanged_HEADER, [new_APUpdateUserAvatarChanged_initWithInt_withAPAvatar_([this$0_ myUid], [response getAvatar]) toByteArray])];
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:new_ImActorModelModulesUpdatesInternalExecuteAfter_initWithInt_withJavaLangRunnable_([response getSeq], new_ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1_(self))];
}

- (void)onError:(AMRpcException *)e {
  if (val$rid_ != this$0_->currentChangeTask_) {
    return;
  }
  this$0_->currentChangeTask_ = 0;
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([this$0_ modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, NO)];
}

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor:(ImActorModelModulesAvatarOwnAvatarChangeActor *)outer$
                                                             withLong:(jlong)capture$0 {
  ImActorModelModulesAvatarOwnAvatarChangeActor_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(self, outer$, capture$0);
  return self;
}

@end

void ImActorModelModulesAvatarOwnAvatarChangeActor_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *self, ImActorModelModulesAvatarOwnAvatarChangeActor *outer$, jlong capture$0) {
  self->this$0_ = outer$;
  self->val$rid_ = capture$0;
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *new_ImActorModelModulesAvatarOwnAvatarChangeActor_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(ImActorModelModulesAvatarOwnAvatarChangeActor *outer$, jlong capture$0) {
  ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *self = [ImActorModelModulesAvatarOwnAvatarChangeActor_$1 alloc];
  ImActorModelModulesAvatarOwnAvatarChangeActor_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_$1)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1

- (void)run {
  [((DKActorRef *) nil_chk([this$0_->this$0_ self__])) sendWithId:new_ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged_initWithLong_(this$0_->val$rid_)];
}

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1:(ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *)outer$ {
  ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1_(self, outer$);
  return self;
}

@end

void ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1_(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 *self, ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *outer$) {
  self->this$0_ = outer$;
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 *new_ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1_(ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *outer$) {
  ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 *self = [ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 alloc];
  ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_$2

- (void)onResult:(APResponseSeq *)response {
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:new_ImActorModelApiBaseSeqUpdate_initWithInt_withByteArray_withInt_withByteArray_([((APResponseSeq *) nil_chk(response)) getSeq], [response getState], APUpdateUserAvatarChanged_HEADER, [new_APUpdateUserAvatarChanged_initWithInt_withAPAvatar_([this$0_ myUid], nil) toByteArray])];
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:new_ImActorModelModulesUpdatesInternalExecuteAfter_initWithInt_withJavaLangRunnable_([response getSeq], new_ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2_(self))];
}

- (void)onError:(AMRpcException *)e {
  if (val$currentRid_ != this$0_->currentChangeTask_) {
    return;
  }
  this$0_->currentChangeTask_ = 0;
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([this$0_ modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithValue:new_AMAvatarUploadState_initWithNSString_withBoolean_(nil, NO)];
}

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor:(ImActorModelModulesAvatarOwnAvatarChangeActor *)outer$
                                                             withLong:(jlong)capture$0 {
  ImActorModelModulesAvatarOwnAvatarChangeActor_$2_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(self, outer$, capture$0);
  return self;
}

@end

void ImActorModelModulesAvatarOwnAvatarChangeActor_$2_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *self, ImActorModelModulesAvatarOwnAvatarChangeActor *outer$, jlong capture$0) {
  self->this$0_ = outer$;
  self->val$currentRid_ = capture$0;
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *new_ImActorModelModulesAvatarOwnAvatarChangeActor_$2_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(ImActorModelModulesAvatarOwnAvatarChangeActor *outer$, jlong capture$0) {
  ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *self = [ImActorModelModulesAvatarOwnAvatarChangeActor_$2 alloc];
  ImActorModelModulesAvatarOwnAvatarChangeActor_$2_initWithImActorModelModulesAvatarOwnAvatarChangeActor_withLong_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_$2)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1

- (void)run {
  [((DKActorRef *) nil_chk([this$0_->this$0_ self__])) sendWithId:new_ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged_initWithLong_(this$0_->val$currentRid_)];
}

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2:(ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *)outer$ {
  ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2_(self, outer$);
  return self;
}

@end

void ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2_(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 *self, ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *outer$) {
  self->this$0_ = outer$;
  (void) NSObject_init(self);
}

ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 *new_ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2_(ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *outer$) {
  ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 *self = [ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 alloc];
  ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1_initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1)
