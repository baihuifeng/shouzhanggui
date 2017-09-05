//
//  SZGOrderViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/28.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGOrderViewController.h"
#import "SZGHomeFirstCell.h"
#import "SZGHomeSecondCell.h"
#import "SZGHomeThirdCell.h"
#import "GeneralDefine.h"
#import "SZGSectionCell.h"
#import "SZGOrderListViewController.h"

@interface SZGOrderViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *titleArr;

@end

@implementation SZGOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableView.tableFooterView = [[UIView alloc] init];
    _titleArr = @[@"待付款",@"新订单",@"未完成",@"已完成",@"无效订单",@"联盟订单",@"售后服务"];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _titleArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SZGSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGSectionCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGSectionCell" owner:self options:nil] lastObject];
    }
    cell.titleContent.text = _titleArr[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 10;
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = JYControllerBackColor;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SZGOrderListViewController *vc = [[SZGOrderListViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
