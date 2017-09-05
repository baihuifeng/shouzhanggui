//
//  UIImage+Color.h
//  JYallXiangMuTong
//
//  Created by 葬花桥 on 16/1/4.
//  Copyright © 2016年 陈石. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//给我一种颜色，一个尺寸，我给你返回一个UIImage:不透明
+(UIImage *)imageFromContextWithColor:(UIColor *)color;
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;


@end
