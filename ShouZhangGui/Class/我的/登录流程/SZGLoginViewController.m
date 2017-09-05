//
//  SZGLoginViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/9/5.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGLoginViewController.h"
#import "SZGRegisterViewController.h"

@interface SZGLoginViewController ()

@end

@implementation SZGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)register:(UIButton *)sender {
    
    SZGRegisterViewController *vc = [[SZGRegisterViewController   alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (IBAction)logBtn:(UIButton *)sender {
    
    [NetApiManager getFromURL:[NSString stringWithFormat:@"%@token=%@&version=%@&phone=%@&pwd=%@",GetLoginUrl,TOKEN,OLDVERSION,_phone.text,_passWord.text] params:nil finished:^(NetResponse *netResponse) {
       
        if (netResponse.isSuccess) {
            
            HHTabbarViewController *tab = (HHTabbarViewController *)JYRootTabBarController;
            tab.selectedIndex = 0;
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        } else {
            SWToast(netResponse.errorMessage);
        }
        
        
    }];
    
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
