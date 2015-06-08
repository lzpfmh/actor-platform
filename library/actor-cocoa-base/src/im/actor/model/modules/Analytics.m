//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/Analytics.java
//


#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/AnalyticsProvider.h"
#include "im/actor/model/Configuration.h"
#include "im/actor/model/entity/Peer.h"
#include "im/actor/model/entity/PeerType.h"
#include "im/actor/model/modules/Analytics.h"
#include "im/actor/model/modules/BaseModule.h"
#include "im/actor/model/modules/Modules.h"
#include "java/lang/Long.h"
#include "java/util/HashMap.h"

@interface ImActorModelModulesAnalytics () {
 @public
  id<AMAnalyticsProvider> analyticsProvider_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAnalytics, analyticsProvider_, id<AMAnalyticsProvider>)

@implementation ImActorModelModulesAnalytics

- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  ImActorModelModulesAnalytics_initWithImActorModelModulesModules_(self, modules);
  return self;
}

- (void)onLoggedOutWithNSString:(NSString *)deviceId {
  if (analyticsProvider_ != nil) {
    [analyticsProvider_ onLoggedOutWithDeviceId:deviceId];
  }
}

- (void)onLoggedInWithNSString:(NSString *)deviceId
                       withInt:(jint)uid
         withJavaLangLongArray:(IOSObjectArray *)phoneNumbers
                  withNSString:(NSString *)userName {
  if (analyticsProvider_ != nil) {
    [analyticsProvider_ onLoggedInWithDeviceId:deviceId withUid:uid withPhoneNumber:[((JavaLangLong *) nil_chk(IOSObjectArray_Get(nil_chk(phoneNumbers), 0))) longLongValue] withUserName:userName];
  }
}

- (void)onLoggedInPerformedWithNSString:(NSString *)deviceId
                                withInt:(jint)uid
                  withJavaLangLongArray:(IOSObjectArray *)phoneNumber
                           withNSString:(NSString *)userName {
  if (analyticsProvider_ != nil) {
    [analyticsProvider_ onLoggedInPerformedWithDeviceId:deviceId withUid:uid withPhoneNumber:[((JavaLangLong *) nil_chk(IOSObjectArray_Get(nil_chk(phoneNumber), 0))) longLongValue] withUserName:userName];
  }
}

- (void)trackMainScreensOpen {
  [self trackWithNSString:@"Main Screen Open"];
}

- (void)trackMainScreensClosed {
  [self trackWithNSString:@"Main Screen Closed"];
}

- (void)trackOwnProfileOpen {
  [self trackWithNSString:@"Own Profile Open"];
}

- (void)trackOwnProfileClosed {
  [self trackWithNSString:@"Own Profile Closed"];
}

- (void)trackDialogsOpen {
  [self trackWithNSString:@"Dialogs Open"];
}

- (void)trackDialogsClosed {
  [self trackWithNSString:@"Dialogs Closed"];
}

- (void)trackContactsOpen {
  [self trackWithNSString:@"Contacts Open"];
}

- (void)trackTextSendWithAMPeer:(AMPeer *)peer {
  [self trackWithNSString:@"Text Send" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Type", [((AMPeerTypeEnum *) nil_chk([((AMPeer *) nil_chk(peer)) getPeerType])) description], @"Id", JreStrcat("I", [peer getPeerId]) } count:4 type:NSString_class_()]];
}

- (void)trackPhotoSendWithAMPeer:(AMPeer *)peer {
  [self trackWithNSString:@"Photo Send" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Type", [((AMPeerTypeEnum *) nil_chk([((AMPeer *) nil_chk(peer)) getPeerType])) description], @"Id", JreStrcat("I", [peer getPeerId]) } count:4 type:NSString_class_()]];
}

- (void)trackVideoSendWithAMPeer:(AMPeer *)peer {
  [self trackWithNSString:@"Video Send" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Type", [((AMPeerTypeEnum *) nil_chk([((AMPeer *) nil_chk(peer)) getPeerType])) description], @"Id", JreStrcat("I", [peer getPeerId]) } count:4 type:NSString_class_()]];
}

- (void)trackDocumentSendWithAMPeer:(AMPeer *)peer {
  [self trackWithNSString:@"Document Send" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Type", [((AMPeerTypeEnum *) nil_chk([((AMPeer *) nil_chk(peer)) getPeerType])) description], @"Id", JreStrcat("I", [peer getPeerId]) } count:4 type:NSString_class_()]];
}

- (void)trackContactsClosed {
  [self trackWithNSString:@"Contacts Closed"];
}

- (void)trackChatOpenWithAMPeer:(AMPeer *)peer {
  [self trackWithNSString:@"Chat Open" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Type", [((AMPeerTypeEnum *) nil_chk([((AMPeer *) nil_chk(peer)) getPeerType])) description], @"Id", JreStrcat("I", [peer getPeerId]) } count:4 type:NSString_class_()]];
}

- (void)trackChatClosedWithAMPeer:(AMPeer *)peer {
  [self trackWithNSString:@"Chat Closed" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Type", [((AMPeerTypeEnum *) nil_chk([((AMPeer *) nil_chk(peer)) getPeerType])) description], @"Id", JreStrcat("I", [peer getPeerId]) } count:4 type:NSString_class_()]];
}

- (void)trackProfileOpenWithInt:(jint)uid {
  [self trackWithNSString:@"Profile Open" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Id", JreStrcat("I", uid) } count:2 type:NSString_class_()]];
}

- (void)trackProfileClosedWithInt:(jint)uid {
  [self trackWithNSString:@"Profile Closed" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Id", JreStrcat("I", uid) } count:2 type:NSString_class_()]];
}

- (void)trackInvitePressed {
  [self trackWithNSString:@"Invite pressed"];
}

- (void)trackAddContactPressed {
  [self trackWithNSString:@"Add contact pressed"];
}

- (void)trackAppVisible {
  [self trackWithNSString:@"App Visible"];
}

- (void)trackAppHidden {
  [self trackWithNSString:@"App Hidden"];
}

- (void)trackAuthPhoneOpen {
  [self trackWithNSString:@"Auth: Phone Opened"];
}

- (void)trackAuthCountryOpen {
  [self trackWithNSString:@"Auth: Phone Country Opened"];
}

- (void)trackAuthCountryClosed {
  [self trackWithNSString:@"Auth: Phone Country Closed"];
}

- (void)trackAuthCountryPickedWithNSString:(NSString *)country {
  [self trackWithNSString:@"Auth: Phone Country Picked" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Country", country } count:2 type:NSString_class_()]];
}

- (void)trackAuthPhoneTypeWithNSString:(NSString *)newValue {
  [self trackWithNSString:@"Auth: Phone Typed" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Value", newValue } count:2 type:NSString_class_()]];
}

- (void)trackAuthPhoneInfoOpen {
  [self trackWithNSString:@"Auth: Phone Info Opened"];
}

- (void)trackCodeRequest {
  [self trackWithNSString:@"Auth: Press code request"];
}

- (void)trackCodeRequestWithLong:(jlong)phone {
  [self trackWithNSString:@"Auth: Code request" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Phone", JreStrcat("J", phone) } count:2 type:NSString_class_()]];
}

- (void)trackAuthCodeOpen {
  [self trackWithNSString:@"Auth: Code Opened"];
}

- (void)trackAuthCodeClosed {
  [self trackWithNSString:@"Auth: Code Closed"];
}

- (void)trackAuthCodeTypeWithNSString:(NSString *)newValue {
  [self trackWithNSString:@"Auth: Code Typed" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Value", newValue } count:2 type:NSString_class_()]];
}

- (void)trackAuthCodeWrongNumber {
  [self trackWithNSString:@"Auth: Wrong number pressed"];
}

- (void)trackAuthCodeWrongNumberCancel {
  [self trackWithNSString:@"Auth: Wrong number cancel"];
}

- (void)trackAuthCodeWrongNumberChange {
  [self trackWithNSString:@"Auth: Wrong number change number"];
}

- (void)trackAuthSignupOpen {
  [self trackWithNSString:@"Auth: Signup Opened"];
}

- (void)trackAuthSignupClosed {
  [self trackWithNSString:@"Auth: Signup Closed"];
}

- (void)trackAuthSignupClosedNameTypeWithNSString:(NSString *)newValue {
  [self trackWithNSString:@"Auth: Name Typed" withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Value", newValue } count:2 type:NSString_class_()]];
}

- (void)trackAuthSignupPressedAvatar {
  [self trackWithNSString:@"Auth: Picking avatar"];
}

- (void)trackAuthSignupAvatarPicked {
  [self trackWithNSString:@"Auth: Avatar picked"];
}

- (void)trackAuthSignupAvatarDeleted {
  [self trackWithNSString:@"Auth: Avatar deleted"];
}

- (void)trackAuthSignupAvatarCanelled {
  [self trackWithNSString:@"Auth: Avatar cancelled"];
}

- (void)trackAuthSuccess {
  [self trackWithNSString:@"Auth: Completed"];
}

- (void)trackBackPressed {
  [self trackWithNSString:@"Auth: Back pressed"];
}

- (void)trackUpPressed {
  [self trackWithNSString:@"Auth: Up pressed"];
}

- (void)trackActionErrorWithNSString:(NSString *)action
                        withNSString:(NSString *)tag
                        withNSString:(NSString *)message {
  [self trackWithNSString:JreStrcat("$$", action, @" error") withNSStringArray:[IOSObjectArray newArrayWithObjects:(id[]){ @"Tag", tag, @"Message", message } count:4 type:NSString_class_()]];
}

- (void)trackActionSuccessWithNSString:(NSString *)action {
  [self trackWithNSString:JreStrcat("$$", action, @" success")];
}

- (void)trackActionTryAgainWithNSString:(NSString *)action {
  [self trackWithNSString:JreStrcat("$$", action, @" try again")];
}

- (void)trackActionCancelWithNSString:(NSString *)action {
  [self trackWithNSString:JreStrcat("$$", action, @" cancel")];
}

- (void)trackWithNSString:(NSString *)event {
  if (analyticsProvider_ != nil) {
    [analyticsProvider_ trackEvent:event];
  }
}

- (void)trackWithNSString:(NSString *)event
        withNSStringArray:(IOSObjectArray *)args {
  if (analyticsProvider_ != nil) {
    JavaUtilHashMap *params = new_JavaUtilHashMap_init();
    for (jint i = 0; i < ((IOSObjectArray *) nil_chk(args))->size_; i += 2) {
      (void) [params putWithId:IOSObjectArray_Get(args, i) withId:IOSObjectArray_Get(args, i + 1)];
    }
    [analyticsProvider_ trackEvent:event withArgs:params];
  }
}

@end

void ImActorModelModulesAnalytics_initWithImActorModelModulesModules_(ImActorModelModulesAnalytics *self, ImActorModelModulesModules *modules) {
  (void) ImActorModelModulesBaseModule_initWithImActorModelModulesModules_(self, modules);
  self->analyticsProvider_ = [((AMConfiguration *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules)) getConfiguration])) getAnalyticsProvider];
}

ImActorModelModulesAnalytics *new_ImActorModelModulesAnalytics_initWithImActorModelModulesModules_(ImActorModelModulesModules *modules) {
  ImActorModelModulesAnalytics *self = [ImActorModelModulesAnalytics alloc];
  ImActorModelModulesAnalytics_initWithImActorModelModulesModules_(self, modules);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAnalytics)
