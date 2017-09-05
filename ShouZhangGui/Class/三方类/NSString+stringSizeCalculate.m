//
//  NSString+stringSizeCalculate.m
//  JinSeJiaYuanWang
//
//  Created by mengyaoyao on 16/10/19.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "NSString+stringSizeCalculate.h"

@implementation NSString (stringSizeCalculate)


+ (CGSize)stringSizeWithString:(NSString *)string maxSize:(CGSize)maxSize wordFont:(CGFloat)fontSize
{
    if (!string.length||fontSize == 0 ) {
        
        return CGSizeZero;
    }
    
    fontSize = fontSize;
    
    CGSize needSize = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:NULL].size;
    
    return needSize;
}

+ (CGSize)stringSizeWithWordContainer:(UIView *)container maxSize:(CGSize)maxSize
{
    CGSize needSize = [container sizeThatFits:maxSize];
    
    return needSize;
}


@end
