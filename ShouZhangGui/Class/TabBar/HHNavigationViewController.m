//
//  HHNavigationViewController.m
//  HomeHealth
//
//  Created by zhangwei on 16/12/28.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import "HHNavigationViewController.h"
#import "UIImage+Color.h"
#import "GeneralDefine.h"

@interface HHNavigationViewController ()

@end

@implementation HHNavigationViewController

/**
 *  当第一次使用这个类的时候调用1次
 */
+ (void)initialize
{
    // 设置UINavigationBarTheme的主
    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  设置UINavigationBarTheme的主题
 */
+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = UICOLOR_RGB_Alpha(0x333333, 1);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [appearance setBackgroundImage:[UIImage imageFromContextWithColor:UICOLOR_RGB_Alpha(0xFFFFFF, 1)] forBarMetrics:UIBarMetricsDefault];
    appearance.shadowImage = [UIImage imageFromContextWithColor:UICOLOR_RGB_Alpha(0xeeeeee, 1)];
    // UIOffsetZero是结构体, 只要包装成NSValue对象, 才能放进字典\数组中
    [appearance setTitleTextAttributes:textAttrs];

    
}

/**
 *  设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme
{
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UICOLOR_RGB_Alpha(0x333333, 1), NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateNormal];

    
    // 设置高亮状态的文字属性
    //    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:SWCommonColor, NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UICOLOR_RGB_Alpha(0xFF6633, 1), NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateDisabled];
    /**设置背景**/
    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
    //    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    // 判断是否为栈底控制器
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        //设置导航子控制器按钮的加载样式
        UINavigationItem *vcBtnItem= [viewController navigationItem];
        
        vcBtnItem.leftBarButtonItem = [UIBarButtonItem initWithNormalImage:@"backIcon" target:self isLeftButton:YES action:@selector(back)];
        
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}



- (void)back
{
    [self.view endEditing:YES];
    [self popViewControllerAnimated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
