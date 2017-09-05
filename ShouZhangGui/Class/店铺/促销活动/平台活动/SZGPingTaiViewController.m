//
//  SZGPingTaiViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/30.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGPingTaiViewController.h"
#import "SZGPingTaiCell.h"
#import "SZGMaiZengCell.h"
#import "SZGTaJiaCell.h"
#import "SZGManJianCell.h"
#import "SZGHongBaoCell.h"
#import "SZGAddMaiZengViewController.h"
#import "SZGAddTeJiaViewController.h"
#import "SZGAddManLiJianViewController.h"
#import "SZGAddHongBaoViewController.h"

@interface SZGPingTaiViewController () <selectedDelegate>

@property (nonatomic,strong) NSArray *footArr;

@end

@implementation SZGPingTaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    NSArray *titltArr = nil;
    
    if (_activity == PingTaiActivity) {
        titltArr = @[@"正在进行中",@"已经结束"];
        _addView.hidden = YES;
    } else if (_activity == MaiZengActivity || _activity == TeJiaActivity) {
        titltArr = @[@"正在进行中",@"已赠送完",@"已经结束"];
        _addView.hidden = NO;
        
        NSString *str = _activity == MaiZengActivity ? @"新增买赠" :@"新增特价";
        
        [_addBtn setTitle:str forState:UIControlStateNormal];
        
    } else if (_activity == ManLiJianActivity || _activity == HongBaoActivity) {
        _addView.hidden = NO;
        titltArr = @[@"领取中",@"已赠送完",@"已经结束"];
        NSString *str = _activity == ManLiJianActivity ? @"新增满立减" :@"新增红包";
        
        [_addBtn setTitle:str forState:UIControlStateNormal];
    }
    _footArr = @[@"停止",@"修改",@"分享"];
    
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    
    
    
    SegmentView *segment = [[SegmentView alloc] initWithItmes:titltArr WithFrame:CGRectMake((kScreen_Width-225)/2, 10, 225, 25) LabelType:radiuLabelTypeLeftWithRight];

    segment.delegate = self;
//    segment.backgroundLabel.layer.borderWidth = 0.5;
    segment.layer.borderWidth = 0.5;
    segment.layer.borderColor = UICOLOR_RGB_Alpha(0Xeeeeee, 1.0).CGColor;
    segment.layer.cornerRadius = 25/2;
    segment.selectIndex = 0;
//    segment.selectedColor = [UIColor redColor];
    segment.BackcornerRadius = 15;
    segment.radiuRadius = 0.5;
    segment.radiuView.radiusF = 15;
    segment.radiuLabelType = radiuLabelTypeLeftWithRight;
    segment.radiuView.isRadius = YES;
    segment.radiuView.radiusHeight = 2;
    
    [self.topView addSubview:segment];
}

- (void)index:(NSInteger)index {

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_activity == PingTaiActivity) {
        return 225;
    } else if (_activity == MaiZengActivity || _activity == TeJiaActivity) {
        return 83;
    } else if (_activity == ManLiJianActivity ) {
        
        return 78;
    }
    
    return 78;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_activity == PingTaiActivity) {
        SZGPingTaiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGPingTaiCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGPingTaiCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (_activity == MaiZengActivity) {
        SZGMaiZengCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGMaiZengCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGMaiZengCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (_activity == TeJiaActivity) {
        SZGTaJiaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGTaJiaCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGTaJiaCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (_activity == ManLiJianActivity) {
        
        SZGManJianCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGManJianCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGManJianCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        SZGHongBaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGHongBaoCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGHongBaoCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (_activity != PingTaiActivity) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 40)];
        view.backgroundColor = [UIColor whiteColor];
        for (int i = 0; i < _footArr.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(kScreen_Width/3*i, 0, kScreen_Width/3, 40);
            
            [button setTitle:_footArr[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button setTitleColor:UICOLOR_RGB_Alpha(0X333333, 1.0) forState:UIControlStateNormal];
            [view addSubview:button];
            
        }
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
        lineView.backgroundColor = UICOLOR_RGB_Alpha(0Xeeeeee, 1.0);
        
        [view addSubview:lineView];
        
        return view;
    }
    
    return nil;
    
}

- (IBAction)addMore:(UIButton *)sender {
    
    if (_activity == MaiZengActivity) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SZGAddActivity" bundle:nil];
        
        SZGAddMaiZengViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"SZGAddMaiZengViewController"];
        wvc.title = @"买赠促销";
        [self.navigationController pushViewController:wvc animated:YES];
    } else if (_activity == TeJiaActivity) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SZGAddActivity" bundle:nil];
        
        SZGAddTeJiaViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"SZGAddTeJiaViewController"];
        wvc.title = @"新增特价";
        [self.navigationController pushViewController:wvc animated:YES];
    } else if (_activity == ManLiJianActivity) {
    //
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SZGAddActivity" bundle:nil];
        
        SZGAddManLiJianViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"SZGAddManLiJianViewController"];
        wvc.title = @"满立减促销";
        [self.navigationController pushViewController:wvc animated:YES];
    } else if (_activity == HongBaoActivity) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SZGAddActivity" bundle:nil];
        
        SZGAddHongBaoViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"SZGAddHongBaoViewController"];
        wvc.title = @"红包促销";
        [self.navigationController pushViewController:wvc animated:YES];
    
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
