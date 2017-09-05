//
//  HHTabbarViewController.m
//  HomeHealth
//
//  Created by zhangwei on 16/12/28.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import "HHTabbarViewController.h"
#import "HHNavigationViewController.h"
#import "HHTababr.h"

#import "GeneralDefine.h"

#import "SZGOrderViewController.h"
#import "SZGShopViewController.h"
#import "SZGMoneyViewController.h"
#import "SZGMineViewController.h"

@interface HHTabbarViewController ()<UITabBarControllerDelegate>

@property (nonatomic , strong) UIViewController * lastSelectedController;
@end

@implementation HHTabbarViewController

+ (void)initialize {
    // 通过appearance统一设置所有的UIBarBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法，都可以用appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = KThemeColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self setupChildVc:[SZGOrderViewController new] title:@"订单" image:@"tab_home_icon" selectedImage:@"tab_home_icon_ed"];
//
    [self setupChildVc:[SZGShopViewController new] title:@"店铺" image:@"tab_kebiao_cion" selectedImage:@"tab_kebiao_icon_ed"];
//
//    [self setupChildVc:[LZOrderViewController new] title:@"订单中心" image:@"tabbar_one" selectedImage:@"tabbar_three_selected"];
     [self setupChildVc:[SZGMoneyViewController new] title:@"财务" image:@"tab_xuesheng_icon" selectedImage:@"tab_xuesheng_icon_ed"];
     [self setupChildVc:[SZGMineViewController new] title:@"我的" image:@"tab_mine_icon" selectedImage:@"tab_mine_icon_ed"];
    
//    // 更换tabBar
     [self setValue:[[HHTababr alloc] init] forKey:@"tabBar"];
    
    

}


/**
 *  初始化控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置文字图片
    vc.tabBarItem.title = title;
    UIImage *imageOriginal =  [UIImage imageNamed:image];
    UIImage *selectedImageOriginal =  [UIImage imageNamed:selectedImage];
    vc.tabBarItem.image =[imageOriginal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [selectedImageOriginal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.title = title;
    // 包装一个导航控制器，添加导航控制器为tabBarController的子控制器
    HHNavigationViewController *nav = [[HHNavigationViewController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)setSelectedViewController:(__kindof UIViewController *)selectedViewController{
    [super setSelectedViewController:selectedViewController];
    
//    if (self.lastSelectedController == selectedViewController) {
//
//        [[NSNotificationCenter defaultCenter]postNotificationName:JYNotificationCenterReSelectedTabbar object:nil];
//
//    }
    // 记录这一次选中的索引
    self.lastSelectedController = selectedViewController;
    

}


@end
