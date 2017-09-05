//
//  SZGMineViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/28.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGMineViewController.h"
#import "SZGMineHeadCell.h"
#import "SZGSectionCell.h"
#import "GeneralDefine.h"
#import "SZGStatusTestViewController.h"
#import "SZGMineInfoViewController.h"
#import "SZGLoginViewController.h"
#import "SZGYiJianViewController.h"

@interface SZGMineViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *titleArr;

@end

@implementation SZGMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _titleArr = @[@[@"我的店员"],@[@"立即开店/店铺协议"],@[@"密码修改"],@[@"身份验证",@"意见反馈",@"使用帮助"],@[@"关于我们"]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 68;
    } else {
        return 44;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 4) {
        return 3;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SZGMineHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGMineHeadCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGMineHeadCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    } else {
        SZGSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGSectionCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGSectionCell" owner:self options:nil] lastObject];
        }
        cell.titleContent.text = _titleArr[indexPath.section-1][indexPath.row];
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
    
    if (indexPath.section == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SZGMineInfoViewController" bundle:nil];
        SZGMineInfoViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"SZGMineInfoViewController"];
        HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        [(UINavigationController *)tabar.selectedViewController pushViewController:wvc animated:YES];
        
        
        
    } else {
        
        if ([_titleArr[indexPath.section -1][indexPath.row] isEqualToString:@"身份验证"]) {
            SZGStatusTestViewController *vc = [[SZGStatusTestViewController alloc] init];
            vc.title = _titleArr[indexPath.section -1][indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }else if ([_titleArr[indexPath.section -1][indexPath.row] isEqualToString:@"意见反馈"]) {
            
            SZGYiJianViewController *vc = [[SZGYiJianViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        
        } else {
            SZGLoginViewController *VC= [[SZGLoginViewController alloc]init];
            
            [self.navigationController pushViewController:VC animated:YES];
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
