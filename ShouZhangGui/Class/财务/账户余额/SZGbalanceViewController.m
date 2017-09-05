//
//  SZGbalanceViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/29.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGbalanceViewController.h"
#import "SZGMoneyFirstCell.h"
#import "SZGBalanceItmeCell.h"

@interface SZGbalanceViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation SZGbalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"账户余额";
    _tableView.tableFooterView = [[UIView alloc] init];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 130;
    } else {
        return 55;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SZGMoneyFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGMoneyFirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGMoneyFirstCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }  else {
        SZGBalanceItmeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGBalanceItmeCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGBalanceItmeCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
