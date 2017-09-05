//
//  SZGShopRankViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/31.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGShopRankViewController.h"
#import "SZGShopRankCell.h"
#import "SZGShopClassityCell.h"

@interface SZGShopRankViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation SZGShopRankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SZGShopRankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGShopRankCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGShopRankCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        SZGShopRankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGShopRankCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGShopRankCell" owner:self options:nil] lastObject];
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
