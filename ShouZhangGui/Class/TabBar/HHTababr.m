//
//  HHTababr.m
//  HomeHealth
//
//  Created by zhangwei on 16/12/28.
//  Copyright © 2016年 ChiJian. All rights reserved.
//

#import "HHTababr.h"

@implementation HHTababr

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [[UITabBar appearance] setShadowImage:[UIImage new]];
        [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"]];
    }
    return self;
}

//- (void)setSelectedItem:(UITabBarItem *)selectedItem{
//    [super setSelectedItem:selectedItem];
//    NSLog(@"-----%ld",selectedItem.tag);
//
//
//}



@end
