//
//  NSString+stringSizeCalculate.h
//  JinSeJiaYuanWang
//
//  Created by mengyaoyao on 16/10/19.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (stringSizeCalculate)


//计算文本大小

/**
 传入参数

 @param string   需要计算的字符串
 @param maxSize  最大尺寸
 @param fontSize 字体大小 ,float

 @return 需要尺寸
 */
+ (CGSize)stringSizeWithString:(NSString *)string maxSize:(CGSize)maxSize wordFont:(CGFloat)fontSize;


/**
 传入参数

 @param container 含有文本的 label , textView等
 @param maxSize   设定最大size

 @return 需要的尺寸
 */
+ (CGSize)stringSizeWithWordContainer:(UIView *)container maxSize:(CGSize)maxSize;

@end
