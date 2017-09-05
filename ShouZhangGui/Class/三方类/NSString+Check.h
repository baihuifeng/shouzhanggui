//
//  NSString+Check.h
//  JunlongcaiNews
//
//  Created by sixiaodong on 14-2-28.
//  Copyright (c) 2014年 qiyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)
+ (BOOL) validateUserName:(NSString *)name;
+ (BOOL) validatePassWord:(NSString *)passWord;
+ (BOOL) isMobileNumber:(NSString *)mobileNum;
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

+ (BOOL) isNumber:(NSString *)num;
//判断是否是汉子，数字和字符
+ (BOOL) validateCutomerName:(NSString *)name length:(NSUInteger)length;
//判断是数字
+ (BOOL)validateFigure:(NSString *)string length:(NSUInteger)length;
//判断是英文
+ (BOOL)validateEnglish:(NSString *)string length:(NSUInteger)length;

+ (BOOL)validateEnglishWithFigure:(NSString *)string length:(NSUInteger)length;
@end
