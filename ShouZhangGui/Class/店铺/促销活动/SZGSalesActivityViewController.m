//
//  SZGSalesActivityViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/30.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGSalesActivityViewController.h"
#import "SZGSalesActivityCell.h"
#import "SZGPingTaiViewController.h"

@interface SZGSalesActivityViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *imgArr;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *detailArr;

@end

@implementation SZGSalesActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imgArr = @[@[@"HD_pingtai_icon"],@[@"HD_maizeng_icon",@"HD_tejia_icon",@"HD_manjian_icon",@"HD_hongbao_icon"]];
    _titleArr = @[@[@"平台活动"],@[@"买赠促销",@"特价促销",@"满立减促销",@"红包促销"]];
    _detailArr = @[@[@"优质服务优质营销"],@[@"灵活设置调控力度",@"降价促销、吸引顾客",@"刺激消费、带动效益",@"让更好的吸粉和呵护"]];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_titleArr[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SZGSalesActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGSalesActivityCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGSalesActivityCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.img.image = [UIImage imageNamed:_imgArr[indexPath.section][indexPath.row]];
    cell.titleStr.text = _titleArr[indexPath.section][indexPath.row];
    cell.detailTitleStr.text = _detailArr[indexPath.section][indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 5;
    }
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 20)];
        view.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 30)];
        label.text = @"促销活动设置";
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = UICOLOR_RGB_Alpha(0X999999, 1.0);
        [view addSubview:label];
        
        return view;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    SZGPingTaiViewController *VC= [[SZGPingTaiViewController alloc] init];
    if ([_titleArr[indexPath.section][indexPath.row] isEqualToString:@"平台活动"]) {
        VC.activity = PingTaiActivity;
    } else if ([_titleArr[indexPath.section][indexPath.row] isEqualToString:@"平台活动"]) {
        VC.activity = PingTaiActivity;
    } else if ([_titleArr[indexPath.section][indexPath.row] isEqualToString:@"买赠促销"]) {
        VC.activity = MaiZengActivity;
    } else if ([_titleArr[indexPath.section][indexPath.row] isEqualToString:@"特价促销"]) {
        VC.activity = TeJiaActivity;
    } else if ([_titleArr[indexPath.section][indexPath.row] isEqualToString:@"满立减促销"]) {
        VC.activity = ManLiJianActivity;
    } else if ([_titleArr[indexPath.section][indexPath.row] isEqualToString:@"红包促销"]) {
        VC.activity = HongBaoActivity;
    }
    VC.title = _titleArr[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:VC animated:YES];
    
    
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
