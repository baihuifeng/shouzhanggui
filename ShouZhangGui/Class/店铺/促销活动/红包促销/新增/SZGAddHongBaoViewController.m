//
//  SZGAddHongBaoViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/30.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGAddHongBaoViewController.h"

@interface SZGAddHongBaoViewController ()

@end

@implementation SZGAddHongBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JYControllerBackColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

@end
