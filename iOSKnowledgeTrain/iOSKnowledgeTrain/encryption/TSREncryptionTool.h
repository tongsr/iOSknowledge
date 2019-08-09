//
//  TSREncryptionTool.h
//  iOSKnowledgeTrain
//
//  Created by work on 2019/8/9.
//  Copyright © 2019 work. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSREncryptionTool : NSObject
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
// return raw data
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;
// return raw data
+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;

// decrypt base64 encoded string, convert result to string(not base64 encoded)
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;


+(NSString *)do3DESEncryptionStr:(NSString *)originalStr WithWorkKey:(NSString *)workKey;
+(NSString*)do3DESDecryptionStr:(NSString *)encryptStr WithWorkKey:(NSString *)workKey;

@end

NS_ASSUME_NONNULL_END
