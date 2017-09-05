//
//  SZGRegisterViewController.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/9/5.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGRegisterViewController.h"

@interface SZGRegisterViewController ()

@end

@implementation SZGRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"注册";
}


- (IBAction)codeBtn:(JYCountButton *)sender {
    
    if (_phone.text.length == 0) {
        SWToast(@"手机号码不能为空");
        return;
    }
    
    
    [NetApiManager getFromURL:[NSString stringWithFormat:@"%@token=%@&version=%@&mobile=%@&subaction=%@",GetCode,TOKEN,OLDVERSION,_phone.text,@"register"] params:nil finished:^(NetResponse *netResponse) {
        
        if (netResponse.isSuccess) {
            
        } else {
            SWToast(netResponse.errorMessage);
        }
        
    }];
}


- (IBAction)registerBtn:(UIButton *)sender {
    
    
    if (_phone.text.length == 0) {
        SWToast(@"手机号码不能为空");
        return;
    }
    if (_code.text.length == 0) {
        SWToast(@"验证码不能为空");
        return;
    }
    
    if (_passWord.text.length == 0) {
        SWToast(@"密码不能为空");
        return;
    }
    
    [NetApiManager getFromURL:[NSString stringWithFormat:@"%@token=%@&version=%@&phone=%@&pwd=%@&check=%@&recheck=%@&agree=%@&store_id=%@",GetRegister,TOKEN,OLDVERSION,_phone.text,_passWord.text,_code.text,_code.text,@"1",@"1"] params:nil finished:^(NetResponse *netResponse) {
        if (netResponse.isSuccess) {
            
        } else {
            SWToast(netResponse.errorMessage);
        }
        
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
