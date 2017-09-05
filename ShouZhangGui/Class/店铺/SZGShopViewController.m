//
//  SZGShopViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/28.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGShopViewController.h"
#import "SZGHomeFirstCell.h"
#import "SZGHomeSecondCell.h"
#import "SZGHomeThirdCell.h"
#import "GeneralDefine.h"
#import "SZGShopClassifyViewController.h"
#import "SZGShopInfoViewController.h"

@interface SZGShopViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *imgArr;

@end

@implementation SZGShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableview.tableFooterView = [[UIView alloc] init];
    
    _titleArr = @[@"商品管理",@"促销活动",@"留言回复",@"会员管理",@"经营分析",@"店铺信息"];
    _imgArr = @[@"DP_shop_icon",@"DP_active_icon",@"DP_liuyan_icon",@"DP_huiyuan_icon",@"DP_fenxi_icon",@"DP_info_icon"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 160;
    } else if (indexPath.section == 1) {
        return 37;
    } else {
        return _titleArr.count/3 == 0 ? 50 : _titleArr.count/3 *125.5 + 50;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SZGHomeFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGHomeFirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGHomeFirstCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    } else if (indexPath.section == 1) {
        SZGHomeSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGHomeSecondCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGHomeSecondCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    } else {
        SZGHomeThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGHomeThirdCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGHomeThirdCell" owner:self options:nil] lastObject];
        }
        [cell setTitleArr:_titleArr imgArr:_imgArr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    
    return 10;
    
}
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section

{
    
    view.tintColor = JYControllerBackColor;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 0 || indexPath.section == 1) {
        
    } else {
        if ([_titleArr[indexPath.section- 2][indexPath.row] isEqualToString:@"商品管理"]) {
            SZGShopClassifyViewController *vc = [[SZGShopClassifyViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if ([_titleArr[indexPath.section- 2][indexPath.row] isEqualToString:@"店铺信息"]) {
        
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SZGShopInfoViewController" bundle:nil];
            SZGShopInfoViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"SZGShopInfoViewController"];
            [self.navigationController pushViewController:wvc animated:YES];
        }
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
