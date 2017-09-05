//
//  SZGHomeSecondCell.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/28.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGHomeSecondCell.h"
#import "SZGNoticeViewController.h"

@implementation SZGHomeSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)moreBtn:(UIButton *)sender {
    
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    SZGNoticeViewController *massageVc = [[SZGNoticeViewController alloc] init];
    massageVc.title = @"公告通知";
    [(UINavigationController *)tabar.selectedViewController pushViewController:massageVc animated:YES];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
