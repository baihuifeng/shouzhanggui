//
//  SZGAddMaiZengViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/30.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGAddMaiZengViewController.h"

@interface SZGAddMaiZengViewController ()

@end

@implementation SZGAddMaiZengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JYControllerBackColor;

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
