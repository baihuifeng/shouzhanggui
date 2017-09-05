//
//  JYCountButton.h
//  JinSeJiaYuanWang
//
//  Created by honghong on 16/3/19.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JYCountButton;
typedef NSString* (^DidChangeBlock)(JYCountButton *countDownButton,int second);
typedef NSString* (^DidFinishedBlock)(JYCountButton *countDownButton,int second);
typedef void (^TouchedDownBlock)(JYCountButton *countDownButton,NSInteger tag);









// 注意  在使用时 如果定时器没有停止就移除控制器会造成内存泄露
// 请在viewWillDisApper  [count stop];




@interface JYCountButton : UIButton

- (void)addToucheHandler:(TouchedDownBlock)touchHandler;
- (void)didChange:(DidChangeBlock)didChangeBlock;
- (void)didFinished:(DidFinishedBlock)didFinishedBlock;
- (void)startWithSecond:(int)second;
- (void)stop;

@end


/**
 How To usage
 1 AddTarget
 - (void)click:(DDZCountButton)sender
 2 addBlock
 
 sender.enabled = NO;
 //button type要 设置成custom 否则会闪动
 [sender startWithSecond:60];
 [sender didChange:^NSString *(JYCountButton *countDownButton,int second) {
 NSString *title = [NSString stringWithFormat:@"剩余%d秒",second];
 return title;
 }];
 [sender didFinished:^NSString *(JYCountButton *countDownButton, int second) {
 countDownButton.enabled = YES;
 return @"点击重新获取";
 
 }];
 
 
 
 3 如果Block调用Self
 Usage  __weak typeof(self) weakSelf = self;
 
 */