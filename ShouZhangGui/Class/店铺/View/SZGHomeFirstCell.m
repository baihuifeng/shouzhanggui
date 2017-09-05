//
//  SZGHomeFirstCell.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/28.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGHomeFirstCell.h"

#import "SZGNewShopViewController.h"

@implementation SZGHomeFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)moreNewShop:(UIButton *)sender {
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    SZGNewShopViewController *massageVc = [[SZGNewShopViewController alloc] init];
    massageVc.title = @"新品";
    [(UINavigationController *)tabar.selectedViewController pushViewController:massageVc animated:YES];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
