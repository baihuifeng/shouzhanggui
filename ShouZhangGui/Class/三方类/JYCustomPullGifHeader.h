//
//  MJGIFXiaoTuZiHeader.h
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/8/14.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "MJRefreshStateHeader.h"

@interface JYCustomPullGifHeader : MJRefreshStateHeader
/** 设置state状态下的动画图片images 动画持续时间duration*/
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state;
- (void)setImages:(NSArray *)images forState:(MJRefreshState)state;
@end
