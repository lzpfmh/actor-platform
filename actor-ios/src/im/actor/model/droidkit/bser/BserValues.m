//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/droidkit/bser/BserValues.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/IncorrectTypeException.h"
#include "im/actor/model/droidkit/bser/UnknownFieldException.h"
#include "im/actor/model/droidkit/bser/util/SparseArray.h"
#include "im/actor/model/util/DataInput.h"
#include "java/io/IOException.h"
#include "java/io/UnsupportedEncodingException.h"
#include "java/lang/Byte.h"
#include "java/lang/Double.h"
#include "java/lang/Integer.h"
#include "java/lang/Long.h"
#include "java/lang/NumberFormatException.h"
#include "java/lang/RuntimeException.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

@interface BSBserValues () {
 @public
  ImActorModelDroidkitBserUtilSparseArray *fields_;
}
@end

J2OBJC_FIELD_SETTER(BSBserValues, fields_, ImActorModelDroidkitBserUtilSparseArray *)

@implementation BSBserValues

- (instancetype)initWithImActorModelDroidkitBserUtilSparseArray:(ImActorModelDroidkitBserUtilSparseArray *)fields {
  if (self = [super init]) {
    self->fields_ = fields;
  }
  return self;
}

- (jint)optIntWithInt:(jint)id_ {
  return [self getIntWithInt:id_ withInt:0];
}

- (jint)getIntWithInt:(jint)id_ {
  if (![((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    @throw [[BSUnknownFieldException alloc] initWithNSString:JreStrcat("$I", @"Unable to find field #", id_)];
  }
  return [self getIntWithInt:id_ withInt:0];
}

- (jint)getIntWithInt:(jint)id_
              withInt:(jint)defValue {
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id obj = [fields_ getWithInt:id_];
    if ([obj isKindOfClass:[JavaLangByte class]]) {
      return [((JavaLangByte *) nil_chk((JavaLangByte *) check_class_cast(obj, [JavaLangByte class]))) charValue];
    }
    else if ([obj isKindOfClass:[JavaLangInteger class]]) {
      return [((JavaLangInteger *) nil_chk((JavaLangInteger *) check_class_cast(obj, [JavaLangInteger class]))) intValue];
    }
    else if ([obj isKindOfClass:[JavaLangLong class]]) {
      return (jint) [((JavaLangLong *) nil_chk((JavaLangLong *) check_class_cast(obj, [JavaLangLong class]))) longLongValue];
    }
    else if ([obj isKindOfClass:[NSString class]]) {
      NSString *s = (NSString *) check_class_cast(obj, [NSString class]);
      @try {
        return JavaLangInteger_parseIntWithNSString_(s);
      }
      @catch (JavaLangNumberFormatException *e) {
        [((JavaLangNumberFormatException *) nil_chk(e)) printStackTrace];
      }
    }
    @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: int, got ", [[nil_chk(obj) getClass] getSimpleName])];
  }
  return defValue;
}

- (jlong)optLongWithInt:(jint)id_ {
  return [self getLongWithInt:id_ withLong:0];
}

- (jlong)getLongWithInt:(jint)id_ {
  if (![((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    @throw [[BSUnknownFieldException alloc] initWithNSString:JreStrcat("$I", @"Unable to find field #", id_)];
  }
  return [self getLongWithInt:id_ withLong:0];
}

- (jlong)getLongWithInt:(jint)id_
               withLong:(jlong)defValue {
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id obj = [fields_ getWithInt:id_];
    if ([obj isKindOfClass:[JavaLangByte class]]) {
      return [((JavaLangByte *) nil_chk((JavaLangByte *) check_class_cast(obj, [JavaLangByte class]))) charValue];
    }
    else if ([obj isKindOfClass:[JavaLangInteger class]]) {
      return [((JavaLangInteger *) nil_chk((JavaLangInteger *) check_class_cast(obj, [JavaLangInteger class]))) intValue];
    }
    else if ([obj isKindOfClass:[JavaLangLong class]]) {
      return [((JavaLangLong *) nil_chk((JavaLangLong *) check_class_cast(obj, [JavaLangLong class]))) longLongValue];
    }
    else if ([obj isKindOfClass:[NSString class]]) {
      NSString *s = (NSString *) check_class_cast(obj, [NSString class]);
      @try {
        return JavaLangLong_parseLongWithNSString_(s);
      }
      @catch (JavaLangNumberFormatException *e) {
        [((JavaLangNumberFormatException *) nil_chk(e)) printStackTrace];
      }
    }
    @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: long, got ", [[nil_chk(obj) getClass] getSimpleName])];
  }
  return defValue;
}

- (NSString *)optStringWithInt:(jint)id_ {
  return [self getStringWithInt:id_ withNSString:nil];
}

- (NSString *)getStringWithInt:(jint)id_ {
  if (![((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    @throw [[BSUnknownFieldException alloc] initWithNSString:JreStrcat("$I", @"Unable to find field #", id_)];
  }
  return [self getStringWithInt:id_ withNSString:nil];
}

- (NSString *)getStringWithInt:(jint)id_
                  withNSString:(NSString *)defValue {
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id res = [fields_ getWithInt:id_];
    if ([res isKindOfClass:[IOSByteArray class]]) {
      @try {
        return [NSString stringWithBytes:(IOSByteArray *) check_class_cast(res, [IOSByteArray class]) charsetName:@"UTF-8"];
      }
      @catch (JavaIoUnsupportedEncodingException *e) {
        @throw [[JavaLangRuntimeException alloc] initWithJavaLangThrowable:e];
      }
    }
    return JreStrcat("@", res);
  }
  return defValue;
}

- (IOSByteArray *)optBytesWithInt:(jint)id_ {
  return [self getBytesWithInt:id_ withByteArray:nil];
}

- (IOSByteArray *)getBytesWithInt:(jint)id_ {
  if (![((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    @throw [[BSUnknownFieldException alloc] initWithNSString:JreStrcat("$I", @"Unable to find field #", id_)];
  }
  return [self getBytesWithInt:id_ withByteArray:nil];
}

- (IOSByteArray *)getBytesWithInt:(jint)id_
                    withByteArray:(IOSByteArray *)defValue {
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id obj = [fields_ getWithInt:id_];
    if ([obj isKindOfClass:[IOSByteArray class]]) {
      return (IOSByteArray *) check_class_cast(obj, [IOSByteArray class]);
    }
    @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: byte[], got ", [[nil_chk(obj) getClass] getSimpleName])];
  }
  return defValue;
}

- (jdouble)optDoubleWithInt:(jint)id_ {
  return [self getDoubleWithInt:id_ withDouble:0];
}

- (jdouble)getDoubleWithInt:(jint)id_ {
  if (![((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    @throw [[BSUnknownFieldException alloc] initWithNSString:JreStrcat("$I", @"Unable to find field #", id_)];
  }
  return [self getDoubleWithInt:id_ withDouble:0];
}

- (jdouble)getDoubleWithInt:(jint)id_
                 withDouble:(jdouble)defValue {
  jlong res = [self getLongWithInt:id_ withLong:JavaLangDouble_doubleToLongBitsWithDouble_(defValue)];
  return JavaLangDouble_longBitsToDoubleWithLong_(res);
}

- (jboolean)optBoolWithInt:(jint)id_ {
  return [self getBoolWithInt:id_ withBoolean:NO];
}

- (jboolean)getBoolWithInt:(jint)id_ {
  if (![((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    @throw [[BSUnknownFieldException alloc] initWithNSString:JreStrcat("$I", @"Unable to find field #", id_)];
  }
  return [self getBoolWithInt:id_ withBoolean:NO];
}

- (jboolean)getBoolWithInt:(jint)id_
               withBoolean:(jboolean)defValue {
  jlong res = [self getLongWithInt:id_ withLong:defValue ? 1 : 0];
  return res != 0;
}

- (id)getObjWithInt:(jint)id_
   withBSBserObject:(BSBserObject *)obj {
  IOSByteArray *data = [self getBytesWithInt:id_];
  if (data == nil) {
    @throw [[BSUnknownFieldException alloc] initWithNSString:JreStrcat("$I", @"Unable to find field #", id_)];
  }
  return ((BSBserObject *) BSBser_parseWithBSBserObject_withAMDataInput_(obj, [[AMDataInput alloc] initWithByteArray:data withInt:0 withInt:((IOSByteArray *) nil_chk(data))->size_]));
}

- (id)optObjWithInt:(jint)id_
   withBSBserObject:(BSBserObject *)obj {
  IOSByteArray *data = [self optBytesWithInt:id_];
  if (data == nil) {
    return nil;
  }
  return ((BSBserObject *) BSBser_parseWithBSBserObject_withAMDataInput_(obj, [[AMDataInput alloc] initWithByteArray:data withInt:0 withInt:((IOSByteArray *) nil_chk(data))->size_]));
}

- (id<JavaUtilList>)getRepeatedIntWithInt:(jint)id_ {
  JavaUtilArrayList *res = [[JavaUtilArrayList alloc] init];
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id val = [fields_ getWithInt:id_];
    if ([val isKindOfClass:[JavaLangLong class]]) {
      [res addWithId:JavaLangInteger_valueOfWithInt_((jint) [((JavaLangLong *) nil_chk((JavaLangLong *) check_class_cast(val, [JavaLangLong class]))) longLongValue])];
    }
    else if ([val isKindOfClass:[JavaLangInteger class]]) {
      [res addWithId:(JavaLangInteger *) check_class_cast(val, [JavaLangInteger class])];
    }
    else if ([JavaUtilList_class_() isInstance:val]) {
      id<JavaUtilList> rep = (id<JavaUtilList>) check_protocol_cast(val, @protocol(JavaUtilList));
      for (id __strong val2 in nil_chk(rep)) {
        if ([val2 isKindOfClass:[JavaLangLong class]]) {
          [res addWithId:JavaLangInteger_valueOfWithInt_((jint) [((JavaLangLong *) nil_chk((JavaLangLong *) check_class_cast(val2, [JavaLangLong class]))) longLongValue])];
        }
        else if ([val2 isKindOfClass:[JavaLangInteger class]]) {
          [res addWithId:(JavaLangInteger *) check_class_cast(val2, [JavaLangInteger class])];
        }
        else {
          @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: int, got ", [[nil_chk(val2) getClass] getSimpleName])];
        }
      }
    }
    else {
      @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: int, got ", [[nil_chk(val) getClass] getSimpleName])];
    }
  }
  return res;
}

- (id<JavaUtilList>)getRepeatedLongWithInt:(jint)id_ {
  JavaUtilArrayList *res = [[JavaUtilArrayList alloc] init];
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id val = [fields_ getWithInt:id_];
    if ([val isKindOfClass:[JavaLangLong class]]) {
      [res addWithId:(JavaLangLong *) check_class_cast(val, [JavaLangLong class])];
    }
    else if ([val isKindOfClass:[JavaLangInteger class]]) {
      [res addWithId:JavaLangLong_valueOfWithLong_((jlong) [((JavaLangInteger *) nil_chk((JavaLangInteger *) check_class_cast(val, [JavaLangInteger class]))) intValue])];
    }
    else if ([JavaUtilList_class_() isInstance:val]) {
      id<JavaUtilList> rep = (id<JavaUtilList>) check_protocol_cast(val, @protocol(JavaUtilList));
      for (id __strong val2 in nil_chk(rep)) {
        if ([val2 isKindOfClass:[JavaLangLong class]]) {
          [res addWithId:(JavaLangLong *) check_class_cast(val2, [JavaLangLong class])];
        }
        else if ([val2 isKindOfClass:[JavaLangInteger class]]) {
          [res addWithId:JavaLangLong_valueOfWithLong_((jlong) [((JavaLangInteger *) nil_chk((JavaLangInteger *) check_class_cast(val2, [JavaLangInteger class]))) intValue])];
        }
        else {
          @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: long, got ", [[nil_chk(val2) getClass] getSimpleName])];
        }
      }
    }
    else {
      @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: long, got ", [[nil_chk(val) getClass] getSimpleName])];
    }
  }
  return res;
}

- (id<JavaUtilList>)getRepeatedStringWithInt:(jint)id_ {
  JavaUtilArrayList *res = [[JavaUtilArrayList alloc] init];
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id val = [fields_ getWithInt:id_];
    if ([val isKindOfClass:[JavaLangLong class]]) {
      [res addWithId:JreStrcat("@", val)];
    }
    else if ([val isKindOfClass:[JavaLangInteger class]]) {
      [res addWithId:JreStrcat("@", val)];
    }
    else if ([val isKindOfClass:[IOSByteArray class]]) {
      [res addWithId:[NSString stringWithBytes:(IOSByteArray *) check_class_cast(val, [IOSByteArray class])]];
    }
    else if ([JavaUtilList_class_() isInstance:val]) {
      id<JavaUtilList> rep = (id<JavaUtilList>) check_protocol_cast(val, @protocol(JavaUtilList));
      for (id __strong val2 in nil_chk(rep)) {
        if ([val2 isKindOfClass:[JavaLangLong class]]) {
          [res addWithId:JreStrcat("@", val2)];
        }
        else if ([val2 isKindOfClass:[JavaLangInteger class]]) {
          [res addWithId:JreStrcat("@", val2)];
        }
        else if ([val2 isKindOfClass:[IOSByteArray class]]) {
          @try {
            [res addWithId:[NSString stringWithBytes:(IOSByteArray *) check_class_cast(val2, [IOSByteArray class]) charsetName:@"UTF-8"]];
          }
          @catch (JavaIoUnsupportedEncodingException *e) {
            @throw [[JavaLangRuntimeException alloc] initWithJavaLangThrowable:e];
          }
        }
        else {
          @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: byte[], got ", [[nil_chk(val2) getClass] getSimpleName])];
        }
      }
    }
    else {
      @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: byte[], got ", [[nil_chk(val) getClass] getSimpleName])];
    }
  }
  return res;
}

- (id<JavaUtilList>)getRepeatedBytesWithInt:(jint)id_ {
  JavaUtilArrayList *res = [[JavaUtilArrayList alloc] init];
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id val = [fields_ getWithInt:id_];
    if ([val isKindOfClass:[IOSByteArray class]]) {
      [res addWithId:(IOSByteArray *) check_class_cast(val, [IOSByteArray class])];
    }
    else if ([JavaUtilList_class_() isInstance:val]) {
      id<JavaUtilList> rep = (id<JavaUtilList>) check_protocol_cast(val, @protocol(JavaUtilList));
      for (id __strong val2 in nil_chk(rep)) {
        if ([val2 isKindOfClass:[IOSByteArray class]]) {
          [res addWithId:(IOSByteArray *) check_class_cast(val2, [IOSByteArray class])];
        }
        else {
          @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: byte[], got ", [[nil_chk(val2) getClass] getSimpleName])];
        }
      }
    }
    else {
      @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: byte[], got ", [[nil_chk(val) getClass] getSimpleName])];
    }
  }
  return res;
}

- (jint)getRepeatedCountWithInt:(jint)id_ {
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id val = [fields_ getWithInt:id_];
    if ([JavaUtilList_class_() isInstance:val]) {
      return [((id<JavaUtilList>) nil_chk(((id<JavaUtilList>) check_protocol_cast(val, @protocol(JavaUtilList))))) size];
    }
    else {
      return 1;
    }
  }
  return 0;
}

- (id<JavaUtilList>)getRepeatedObjWithInt:(jint)id_
                         withJavaUtilList:(id<JavaUtilList>)objs {
  JavaUtilArrayList *res = [[JavaUtilArrayList alloc] init];
  if ([((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(fields_)) containsKeyWithInt:id_]) {
    id val = [fields_ getWithInt:id_];
    if ([val isKindOfClass:[IOSByteArray class]]) {
      IOSByteArray *b = (IOSByteArray *) check_class_cast(val, [IOSByteArray class]);
      [res addWithId:BSBser_parseWithBSBserObject_withAMDataInput_([((id<JavaUtilList>) nil_chk(objs)) removeWithInt:0], [[AMDataInput alloc] initWithByteArray:b withInt:0 withInt:((IOSByteArray *) nil_chk(b))->size_])];
    }
    else if ([JavaUtilList_class_() isInstance:val]) {
      id<JavaUtilList> rep = (id<JavaUtilList>) check_protocol_cast(val, @protocol(JavaUtilList));
      for (id __strong val2 in nil_chk(rep)) {
        if ([val2 isKindOfClass:[IOSByteArray class]]) {
          IOSByteArray *b = (IOSByteArray *) check_class_cast(val2, [IOSByteArray class]);
          [res addWithId:BSBser_parseWithBSBserObject_withAMDataInput_([((id<JavaUtilList>) nil_chk(objs)) removeWithInt:0], [[AMDataInput alloc] initWithByteArray:b withInt:0 withInt:((IOSByteArray *) nil_chk(b))->size_])];
        }
        else {
          @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: byte[], got ", [[nil_chk(val2) getClass] getSimpleName])];
        }
      }
    }
    else {
      @throw [[BSIncorrectTypeException alloc] initWithNSString:JreStrcat("$$", @"Expected type: byte[], got ", [[nil_chk(val) getClass] getSimpleName])];
    }
  }
  return res;
}

- (void)copyAllFieldsTo:(BSBserValues *)other {
  [super copyAllFieldsTo:other];
  other->fields_ = fields_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(BSBserValues)
