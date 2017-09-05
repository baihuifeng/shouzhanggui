//
//  SegmentView.h
//  testH
//
//  Created by 葬花桥 on 2016/10/20.
//  Copyright © 2016年 葬花桥. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    radiuLabelTypeNone,//无圆角
    radiuLabelTypeLeft, //左圆角
    radiuLabelTypeRight,//右圆角
    radiuLabelTypeLeftWithRight,//左右角
    radiuLabelTypeBottom//底部

}radiuLabelType;

@protocol selectedDelegate <NSObject>

- (void)index:(NSInteger)index;

@end

@class LeftLabelView;

@interface SegmentView : UIView

@property (nonatomic,assign) int selectedIndex;

@property (weak,nonatomic) id <selectedDelegate> delegate;

@property (strong,nonatomic) UILabel *backgroundLabel;//背景
@property (assign,nonatomic) CGFloat BackcornerRadius;//背景的弧度
@property (strong,nonatomic) UIColor *labelBackgroundColor;//背景颜色

@property (assign,nonatomic) CGFloat interval;//间隔

@property (assign,nonatomic) NSTimeInterval timer;


//分割线
@property (assign,nonatomic) BOOL isShowLine;//是否显示分隔线
@property (strong,nonatomic) NSArray *lineArr;
@property (strong,nonatomic) UIColor *lineColor;//分隔线线颜色
@property (assign,nonatomic) CGFloat lineHeight;//分割线的高度



@property (nonatomic,strong) LeftLabelView *radiuView;
@property (assign,nonatomic) CGFloat radiuRadius;//滑块的弧度
@property (strong,nonatomic) UIColor *radiuLabelColor;//滑块的背景的颜色



@property (strong,nonatomic) NSArray *itmeArr;
@property (assign,nonatomic) NSInteger selectIndex;

@property (strong,nonatomic) UIColor *defaultColor;//点击前的button的字体颜色
@property (strong,nonatomic) UIColor *selectedColor;//点击后的button的字体颜色



@property (assign,nonatomic) radiuLabelType radiuLabelType;

- (id)initWithItmes:(NSArray *)itmesArr WithFrame:(CGRect)frame LabelType:(radiuLabelType)radiuLabelType;

- (void)setcolorWithBackgroundColor:(UIColor *)backgroundColor radiuLabelBackgroudColor:(UIColor *)radiuColor defaultColor:(UIColor *)defaultColor selectedColor:(UIColor *)selectedColor;

@end

@interface LeftLabelView : UIView

- (id)initWithRadiuLabelType:(radiuLabelType)radiuLabelType WithFrame:(CGRect)frame;


@property (assign,nonatomic) radiuLabelType radiuType;//类型
@property (assign,nonatomic) CGFloat radiusF;//圆角
@property (assign,nonatomic) CGFloat intervalF;//间隔
@property (assign,nonatomic) CGFloat radiusHeight;//如果滑块的类型是bottom的话设置其高度默认是2;
@property (assign,nonatomic) BOOL isRadius;//判断滑块的类型是bottom时是否需要圆角
@property (assign,nonatomic) CGFloat radiusWidth;//未实现
@property (strong,nonatomic) UIColor *radiusColor;

@property (strong,nonatomic)UILabel *leftRadiuLabel;
@property (strong,nonatomic)UILabel *rightRadiuLabel;




@end
