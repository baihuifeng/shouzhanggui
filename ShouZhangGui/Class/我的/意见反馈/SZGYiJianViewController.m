//
//  SZGYiJianViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/9/5.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGYiJianViewController.h"
#import "SZGCommentImgCell.h"
#import "SZGYijianFirstCell.h"
#import "SZGJianYiPhoneCell.h"

@interface SZGYiJianViewController () <UITableViewDelegate,UITableViewDataSource,GetImgDelegate>

@property (nonatomic,strong) NSMutableArray *Imgarr;

@end

@implementation SZGYiJianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _Imgarr = [[NSMutableArray alloc] init];
    self.title = @"意见反馈";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 123;
    } else if (indexPath.section == 2 || indexPath.section == 3) {
        
        return 44;
    }
    
    
    return 130 + (_Imgarr.count / 5 + 1) * 10 + (_Imgarr.count / 5 + 1) * 51 * kScreen_Width/320;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 15;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SZGYijianFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGYijianFirstCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGYijianFirstCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 1) {
        
        
        SZGCommentImgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGCommentImgCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGCommentImgCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        cell.textView.placeholder = @"请描述你的问题";
        [cell setImgArr:_Imgarr];
        return cell;
    } else if (indexPath.section == 1) {
        SZGJianYiPhoneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SZGJianYiPhoneCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SZGJianYiPhoneCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    } else {
        static NSString *str = @"qqq";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        
        cell.textLabel.text = @"直接拨打我们的客服热线：400-8562124";
        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
        cell.textLabel.textColor = UICOLOR_RGB_Alpha(0x333333, 1);
        cell.accessoryType = UITableViewCellSelectionStyleNone;
        return cell;
    
    }
    
    
    
}


- (void)addImg {
    
    [JYImagePickerController showMutliPickerInView:self.view maxImageCount:15 block:^(NSArray *imageArray) {
        [_Imgarr addObjectsFromArray:imageArray];
        [_tableview reloadData];
    }];
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
