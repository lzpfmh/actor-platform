//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/updates/UpdateGroupMembersUpdate.java
//

#ifndef _APUpdateGroupMembersUpdate_H_
#define _APUpdateGroupMembersUpdate_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Update.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;
@protocol JavaUtilList;

#define APUpdateGroupMembersUpdate_HEADER 44

@interface APUpdateGroupMembersUpdate : APUpdate

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithInt:(jint)groupId
           withJavaUtilList:(id<JavaUtilList>)members;

+ (APUpdateGroupMembersUpdate *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jint)getGroupId;

- (jint)getHeaderKey;

- (id<JavaUtilList>)getMembers;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APUpdateGroupMembersUpdate)

J2OBJC_STATIC_FIELD_GETTER(APUpdateGroupMembersUpdate, HEADER, jint)

FOUNDATION_EXPORT APUpdateGroupMembersUpdate *APUpdateGroupMembersUpdate_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APUpdateGroupMembersUpdate_initWithInt_withJavaUtilList_(APUpdateGroupMembersUpdate *self, jint groupId, id<JavaUtilList> members);

FOUNDATION_EXPORT APUpdateGroupMembersUpdate *new_APUpdateGroupMembersUpdate_initWithInt_withJavaUtilList_(jint groupId, id<JavaUtilList> members) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APUpdateGroupMembersUpdate_init(APUpdateGroupMembersUpdate *self);

FOUNDATION_EXPORT APUpdateGroupMembersUpdate *new_APUpdateGroupMembersUpdate_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APUpdateGroupMembersUpdate)

typedef APUpdateGroupMembersUpdate ImActorModelApiUpdatesUpdateGroupMembersUpdate;

#endif // _APUpdateGroupMembersUpdate_H_
