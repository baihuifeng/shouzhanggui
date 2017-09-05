//
//  SZGBankCardViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/29.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGBankCardViewController.h"
#import "SZGCardCell.h"

@interface SZGBankCardViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation SZGBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 110;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SZGCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGCardCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGCardCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
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
