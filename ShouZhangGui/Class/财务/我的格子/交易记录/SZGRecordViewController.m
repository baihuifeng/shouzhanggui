//
//  SZGRecordViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/31.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGRecordViewController.h"
#import "SZGRecordCell.h"

@interface SZGRecordViewController () <selectedDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation SZGRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *titltArr = @[@"未完成",@"已完成",@"退货"];
    
    self.title = @"交易记录";
    
    SegmentView *segment = [[SegmentView alloc] initWithItmes:titltArr WithFrame:CGRectMake(0, 0, kScreen_Width, 45) LabelType:radiuLabelTypeNone];
    
    segment.delegate = self;
    segment.layer.cornerRadius = 25/2;
    segment.selectIndex = 0;
    segment.BackcornerRadius = 15;
    segment.radiuRadius = 0.5;
    segment.radiuView.radiusF = 15;
    [segment setcolorWithBackgroundColor:[UIColor clearColor] radiuLabelBackgroudColor:[UIColor clearColor] defaultColor:UICOLOR_RGB_Alpha(0X666666, 1.0) selectedColor:UICOLOR_RGB_Alpha(0X333333, 1.0)];
    segment.radiuView.radiusColor = [UIColor clearColor];
    segment.radiuLabelType = radiuLabelTypeNone;
    segment.radiuView.isRadius = YES;
    segment.radiuView.radiusHeight = 2;
    segment.lineHeight = 30;
    segment.isShowLine = NO;
    segment.lineColor = UICOLOR_RGB_Alpha(0Xeeeeee, 1.0);
    
    [self.topView addSubview:segment];
}

- (void)index:(NSInteger)index {


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SZGRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGRecordCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGRecordCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
