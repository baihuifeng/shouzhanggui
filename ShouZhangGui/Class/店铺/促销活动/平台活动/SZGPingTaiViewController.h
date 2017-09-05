//
//  SZGPingTaiViewController.h
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/30.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGRootViewController.h"

@interface SZGPingTaiViewController : SZGRootViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (weak, nonatomic) IBOutlet UIView *topView;

@property (assign,nonatomic) ACTIVITY activity;
@property (weak, nonatomic) IBOutlet UIView *addView;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end
