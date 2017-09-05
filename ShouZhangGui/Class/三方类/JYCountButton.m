//
//  JYCountButton.m
//  JinSeJiaYuanWang
//
//  Created by honghong on 16/3/19.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "JYCountButton.h"

@implementation JYCountButton{
    int _second;
    int _totalSecond;
    
    NSTimer *_timer;
    NSDate *_startDate;
    
    DidChangeBlock _didChangeBlock;
    DidFinishedBlock _didFinishedBlock;
    TouchedDownBlock _touchedDownBlock;
}
#pragma -mark touche action
- (void)addToucheHandler:(TouchedDownBlock)touchHandler {
    _touchedDownBlock = [touchHandler copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touched:(JYCountButton *)sender{
    if (_touchedDownBlock) {
        _touchedDownBlock(sender,sender.tag);
    }
}

#pragma -mark count down method
- (void)startWithSecond:(int)totalSecond {
    _totalSecond = totalSecond;
    _second = totalSecond;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void)timerStart:(NSTimer *)theTimer {
    double deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];
    
    _second = _totalSecond - (int)(deltaTime+0.5) ;
    if (_second< 0.0) {
        [self stop];
    } else {
        //        _second--;
        if (_didChangeBlock) {
            [self setTitle:_didChangeBlock(self,_second) forState:UIControlStateNormal];
            [self setTitle:_didChangeBlock(self,_second) forState:UIControlStateDisabled];
            
        } else  {
            NSString *title = [NSString stringWithFormat:@"%d秒",_second];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];
            
        }
    }
}

- (void)stop {
    if (_timer)  {
        if ([_timer respondsToSelector:@selector(isValid)]) {
            if ([_timer isValid]) {
                [_timer invalidate];
                _second = _totalSecond;
                if (_didFinishedBlock) {
                    [self setTitle:_didFinishedBlock(self,_totalSecond)forState:UIControlStateNormal];
                    [self setTitle:_didFinishedBlock(self,_totalSecond)forState:UIControlStateDisabled];
                    
                } else {
                    [self setTitle:@"重新获取" forState:UIControlStateNormal];
                    [self setTitle:@"重新获取" forState:UIControlStateDisabled];
                    
                }
            }
        }
    }
}
#pragma -mark block
- (void)didChange:(DidChangeBlock)didChangeBlock {
    _didChangeBlock = [didChangeBlock copy];
}
- (void)didFinished:(DidFinishedBlock)didFinishedBlock {
    _didFinishedBlock = [didFinishedBlock copy];
}
- (void)willRemoveSubview:(UIView *)subview {
    [_timer invalidate];
    _timer = nil;
    
}
@end
