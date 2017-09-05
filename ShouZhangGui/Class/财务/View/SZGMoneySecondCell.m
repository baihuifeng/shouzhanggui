//
//  SZGMoneySecondCell.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/29.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGMoneySecondCell.h"
#import "SZGbalanceViewController.h"

@implementation SZGMoneySecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)blanceBtn:(UIButton *)sender {
    
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    SZGbalanceViewController *massageVc = [[SZGbalanceViewController alloc] init];
    [(UINavigationController *)tabar.selectedViewController pushViewController:massageVc animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
