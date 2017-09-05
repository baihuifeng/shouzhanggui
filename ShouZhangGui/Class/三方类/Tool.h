//
//  Tool.h
//  HomeHealth
//
//  Created by newuser on 17/1/4.
//  Copyright © 2017年 ChiJian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

+(instancetype)instance;

+ (void)showHUDWithText:(NSString *)text;

+ (void)showHUDWithText:(NSString *)text callback:(void(^)(void))callback;


//菊花 
+(void)showLoadingOnView:(UIView *)view;

//主要是为了解决在找不到vc.view的时候方便使用
+(void)showLoadingOnWindowCustomFrame:(CGRect)frame;

+(void)showLoadingOnWindow;

+(void)hideLoading;

//本地打电话
+ (void)callPhone:(NSString *)phoneNum;

//[MBProgressHUD showHUDAddedTo:self.view animated:NO];[MBProgressHUD hideHUDForView:self.view animated:NO];
+ (void)showHUDAddedTo:(UIView *)view animated:(BOOL)animated;
+ (void)hideHUDForView:(UIView *)view animated:(BOOL)animated;
@end
