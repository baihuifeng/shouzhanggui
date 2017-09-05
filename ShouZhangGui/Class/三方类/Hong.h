//
//  Hong.h
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/9/5.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#ifndef Hong_h
#define Hong_h

#define ManagerUrl @"http://47.92.117.38/index.php/Client/"


#define OLDVERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define TOKEN @"gezi"

#pragma -mark "账号管理 登录 注册 找回密码"

//发送短信接口
#define GetCode [NSString stringWithFormat:@"%@Sms/index?",ManagerUrl]
//注册
#define GetRegister [NSString stringWithFormat:@"%@Newindex/register?",ManagerUrl]
//登录
#define GetLoginUrl [NSString stringWithFormat:@"%@Newindex/index?",ManagerUrl]



#endif /* Hong_h */
