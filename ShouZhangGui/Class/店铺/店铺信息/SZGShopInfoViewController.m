//
//  SZGShopInfoViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/31.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGShopInfoViewController.h"
#import "SZGShopRankViewController.h"

@interface SZGShopInfoViewController ()

@end

@implementation SZGShopInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JYControllerBackColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 3) {
        return 50;
    }
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 3) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 50)];
        view.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 50)];
        
        label.text = @"店招图片";
        
        label.font = [UIFont systemFontOfSize:14];
        
        label.textColor = UICOLOR_RGB_Alpha(0X333333, 1.0);
        
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 200, 50)];
        detailLabel.text = @"（ 图片尺寸建议为750*200px ）";
        detailLabel.textColor = UICOLOR_RGB_Alpha(0X666666, 1.0);
        detailLabel.font = [UIFont systemFontOfSize:12];
        
        [view addSubview:detailLabel];
        
        [view addSubview:label];
        
        return view;
        
        
    }
    
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            
            SZGShopRankViewController *vc = [[SZGShopRankViewController alloc] init];
            vc.title = @"店铺等级";
            [self.navigationController pushViewController:vc animated:YES];
            
        }
    }
    
    
}


@end
