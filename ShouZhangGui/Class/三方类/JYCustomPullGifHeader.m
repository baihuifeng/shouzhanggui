//
//  MJGIFXiaoTuZiHeader.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/8/14.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "JYCustomPullGifHeader.h"
@interface JYCustomPullGifHeader ()
@property (weak, nonatomic) UIImageView *gifView;
/** 所有状态对应的动画图片 */
@property (strong, nonatomic) NSMutableDictionary *stateImages;
/** 所有状态对应的动画时间 */
@property (strong, nonatomic) NSMutableDictionary *stateDurations;
@property (strong,nonatomic) UILabel *label;
@end
@implementation JYCustomPullGifHeader

#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare {
    [super prepare];
    self.label = [[UILabel alloc]init];
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=10; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"JY_MJheadGif_%zd", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=10; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"JY_MJheadGif_%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    self.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    self.stateLabel.hidden = YES;
}
#pragma mark - 懒加载
- (UIImageView *)gifView {
    if (!_gifView) {
        UIImageView *gifView = [[UIImageView alloc] init];
        [self addSubview:_gifView = gifView];
    }
    return _gifView;
}

- (NSMutableDictionary *)stateImages {
    if (!_stateImages) {
        self.stateImages = [NSMutableDictionary dictionary];
    }
    return _stateImages;
}

- (NSMutableDictionary *)stateDurations {
    if (!_stateDurations) {
        self.stateDurations = [NSMutableDictionary dictionary];
    }
    return _stateDurations;
}

#pragma mark - 公共方法
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state {
    if (images == nil) return;
    
    self.stateImages[@(state)] = images;
    self.stateDurations[@(state)] = @(duration);
    
    /* 根据图片设置控件的高度 */
    UIImage *image = [images firstObject];
//    if (image.size.height > self.mj_h) {
        self.mj_h = image.size.height + 40;
//    }
}

- (void)setImages:(NSArray *)images forState:(MJRefreshState)state {
    [self setImages:images duration:images.count * 0.1 forState:state];
}

#pragma mark - 实现父类的方法
- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
    NSArray *images = self.stateImages[@(MJRefreshStateIdle)];
    if (self.state != MJRefreshStateIdle || images.count == 0) return;
    // 停止动画
    [self.gifView stopAnimating];
    // 设置当前需要显示的图片
    NSUInteger index =  images.count * pullingPercent;
    if (index >= images.count) index = images.count - 1;
    self.gifView.image = images[index];
}

- (void)placeSubviews {
    [super placeSubviews];
    [self addSubview:self.label];
    self.label.text = @"再拉我就刷新了";
    if (self.gifView.constraints.count) return;
//    CGRect rect = self.bounds;
//    rect.origin.y = rect.origin.y - 10;
    self.gifView.frame = self.bounds;
    
//    self.gifView.mj_y =  self.gifView.mj_y - 10;
    self.gifView.mj_x =  self.gifView.mj_x - 15;
    self.gifView.contentMode = UIViewContentModeCenter;
    self.label.frame = CGRectMake(0, CGRectGetMaxY(self.gifView.frame) - 20, kScreen_Width, 12);
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = UICOLOR_RGB_Alpha(0x999999, 1);
    self.label.font = [UIFont systemFontOfSize:10];
//    self.label.mj_y = CGRectGetMaxY(self.gifView.frame);
    
}

- (void)setState:(MJRefreshState)state {
    //    /** 普通闲置状态 */
    //    MJRefreshStateIdle = 1,
    //    /** 松开就可以进行刷新的状态 */
    //    MJRefreshStatePulling,
    //    /** 正在刷新中的状态 */
    //    MJRefreshStateRefreshing,
    //    /** 即将刷新的状态 */
    //    MJRefreshStateWillRefresh,
    //    /** 所有数据加载完毕，没有更多的数据了 */
    //    MJRefreshStateNoMoreData
    MJRefreshCheckState
    switch (state) {
        case MJRefreshStatePulling: {
            self.label.text = @"松开立即刷新";
            NSArray *images = self.stateImages[@(MJRefreshStatePulling)];
            if (images.count == 0) return;
            
            [self.gifView stopAnimating];
            if (images.count == 1) { // 单张图片
                self.gifView.image = [images lastObject];
            } else { // 多张图片
                self.gifView.animationImages = images;
                self.gifView.animationDuration = [self.stateDurations[@(MJRefreshStatePulling)] doubleValue];
                [self.gifView startAnimating];
            }
        }
            break;
        case MJRefreshStateRefreshing: {
            self.label.text = @"更新中";
            NSArray *images = self.stateImages[@(MJRefreshStateRefreshing)];
            if (images.count == 0) return;
            
            [self.gifView stopAnimating];
            if (images.count == 1) { // 单张图片
                self.gifView.image = [images lastObject];
            } else { // 多张图片
                self.gifView.animationImages = images;
                self.gifView.animationDuration = [self.stateDurations[@(MJRefreshStateRefreshing)] doubleValue];
                [self.gifView startAnimating];
            }
        }
            break;
        case MJRefreshStateIdle:
            self.label.text = @"再拉我就刷新了";
            [self.gifView stopAnimating];
            break;
 
        default:
            break;
    }

}

@end
