//
//  NSStringVerify.h
//  RegisterModule
//
//  Created by 吴月 on 14-12-8.
//  Copyright (c) 2014年 chenTengFei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSStringVerify : NSObject

/*邮箱验证 MODIFIED BY HELENSONG*/
-(BOOL)isValidateEmail:(NSString *)email;

/*手机号码验证 MODIFIED BY HELENSONG*/
-(BOOL) isValidateMobile:(NSString *)mobile;

/*手机号码验证 MODIFIED BY HELENSONG*/
//- (BOOL)isMobileNumber:(NSString *)mobileNum;

+ (instancetype)sharedInstance;
@end
