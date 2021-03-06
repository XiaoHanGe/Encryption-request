//
//  SecurityUtil.h
//  Smile
//
//  Created by 周 敏 on 12-11-24.
//  Copyright (c) 2012年 BOX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecurityUtil : NSObject 

#pragma mark - base64
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;
+ (NSData*)decodeBase64String2Data:(NSString * )input;
+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSData*)encodeBase64Data2Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;

#pragma mark - AES加密
//将string转成带密码的data
+ (NSData*)encryptAESData:(NSString*)string;

+ (NSData*)encryptAESData2:(NSData*)data;

//将带密码的data转成string
+ (NSString*)decryptAESData:(NSData*)data;

+ (NSData*)decryptAESData2Data:(NSData*)data;



@end
