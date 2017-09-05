//
//  UIImage+Color.m
//  JYallXiangMuTong
//
//  Created by 葬花桥 on 16/1/4.
//  Copyright © 2016年 陈石. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

//给我一种颜色，一个尺寸，我给你返回一个UIImage
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size{
    
    CGRect rect=(CGRect){{0.0f,0.0f},size};
    
    //开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    
    //获取图形上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    //获取图像
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage *)imageFromContextWithColor:(UIColor *)color{
    
    CGSize size=CGSizeMake(1.0f, 1.0f);
    
    return [self imageFromContextWithColor:color size:size];
}





@end
