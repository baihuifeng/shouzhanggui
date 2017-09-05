//
//  Tool.m
//  HomeHealth
//
//  Created by newuser on 17/1/4.
//  Copyright © 2017年 ChiJian. All rights reserved.
//

#import "Tool.h"

@interface Tool ()

@property (strong,nonatomic)UIActivityIndicatorView *indicatorView;

@end


@implementation Tool

+(instancetype)instance{
    static Tool *tl = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tl = [[Tool alloc]init];
    });
    return tl;
}

-(UIActivityIndicatorView *)indicatorView{
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.frame = [UIApplication sharedApplication].keyWindow.bounds;
    }
    return _indicatorView;
}


+ (void)showHUDWithText:(NSString *)text
{
    if ([text length]<=0) {
        return;
    }
    [Tool showWarning:[UIApplication sharedApplication].keyWindow mText:text seconds:1.0 callback:nil];
}

+ (void)showHUDWithText:(NSString *)text callback:(void(^)(void))callback
{
    [Tool showWarning:[UIApplication sharedApplication].keyWindow mText:text seconds:1.0 callback:callback];
}

+(void)showWarning:(UIView *)view mText:(NSString *)text seconds:(CGFloat)seconds callback:(void(^)(void))hudCallBack{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    NSMutableParagraphStyle *pStyle = [[NSMutableParagraphStyle alloc]init];
    [pStyle setLineSpacing:0.5];
    [pStyle setLineBreakMode:NSLineBreakByWordWrapping];
    CGRect matchRect = [text boundingRectWithSize:CGSizeMake(190, 150) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16],NSFontAttributeName,pStyle,NSParagraphStyleAttributeName, nil] context:nil];
//    hud.yOffset = kScreen_Height - 200;
    
    hud.mode = MBProgressHUDModeCustomView;
    UILabel *mLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreen_Height - 100, matchRect.size.width, matchRect.size.height)];
    mLabel.backgroundColor = [UIColor clearColor];
    mLabel.textColor = UICOLOR_RGB_Alpha(0x646e70, 1.0);
    
    mLabel.font = [UIFont systemFontOfSize:16];
    mLabel.textAlignment = NSTextAlignmentCenter;
    mLabel.lineBreakMode = NSLineBreakByWordWrapping;
    mLabel.numberOfLines = 0;
    mLabel.text = text;
    hud.customView = mLabel;
    
    hud.yOffset = kScreen_Height/2-100;

    
    
//    hud.activityIndicatorColor = [UIColor redColor];
    hud.color = UICOLOR_RGB_Alpha(0xefefef, 0.90);
    
//    hud.bezelView.backgroundColor = [UIColor blackColor];
    if (hudCallBack) {
        hud.completionBlock = [hudCallBack copy];
    }
    [hud hide:YES afterDelay:seconds];

    
}


+ (void)showHUDAddedTo:(UIView *)view animated:(BOOL)animated {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.color = UICOLOR_RGB_Alpha(0x646e70, 0.3);
    
    
    [hud show:YES];
}

+ (void)hideHUDForView:(UIView *)view animated:(BOOL)animated {
    [MBProgressHUD hideHUDForView:view animated:animated];
}



+(void)showLoadingOnView:(UIView *)view{
    [Tool instance].indicatorView.frame = view.bounds;
    [view addSubview:[Tool instance].indicatorView];
    [[Tool instance].indicatorView startAnimating]; 
}

+(void)showLoadingOnWindowCustomFrame:(CGRect)frame{
    [Tool instance].indicatorView.frame = frame;
    [[UIApplication sharedApplication].delegate.window addSubview:[Tool instance].indicatorView];
    [[Tool instance].indicatorView startAnimating]; 
}

+(void)showLoadingOnWindow{
    [Tool instance].indicatorView.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].delegate.window addSubview:[Tool instance].indicatorView];
    [[Tool instance].indicatorView startAnimating];                                     
}


+(void)hideLoading{
    [[Tool instance].indicatorView stopAnimating];
    [[Tool instance].indicatorView removeFromSuperview];

}

+ (void)callPhone:(NSString *)phoneNum{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"400-000-9988"]];
    [[UIApplication sharedApplication] openURL:phoneURL];
//    NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",phoneNum];
//    // NSLog(@"str======%@",str);
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//    [[UIApplication sharedApplication] canOpenURL:phoneURL];
}

@end
