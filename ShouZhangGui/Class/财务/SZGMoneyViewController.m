//
//  SZGMoneyViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/28.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGMoneyViewController.h"
#import "SZGMoneyFirstCell.h"
#import "SZGMoneySecondCell.h"
#import "SZGMoneyThirdCell.h"

@interface SZGMoneyViewController ()
@property (nonatomic,strong) NSArray *titleArray;

@end

@implementation SZGMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _titleArray = @[@"收入明细",@"我的格子",@"格子联盟",@"银行卡",@"更多"];
    _tableview.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 130;
    } else if (indexPath.section == 1) {
        return 84;
    } else {
        return _titleArray.count == 0 ? 0 : (_titleArray.count/3+1) *125.5;
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
        
    } else if (indexPath.section == 1) {
        SZGMoneySecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGMoneySecondCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGMoneySecondCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    } else {
        SZGMoneyThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGMoneyThirdCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGMoneyThirdCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setDataArr:_titleArray imgArr:nil];
        return cell;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        return 0;
    }
    
    return 10;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
