//
//  HHTabbarViewController.h
//  HomeHealth
//
//  Created by zhangwei on 16/12/28.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHTabbarViewController : UITabBarController
@property (nonatomic , copy) void(^RefreshingVCBlock)();
@end
