//
//  JYImagePickerController.h
//  JInGuanJia
//
//  Created by liu.qingwei on 15/7/20.
//  Copyright (c) 2015年 liuqw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FinishPickSingleImageBlock)(UIImage* image);
typedef void (^FinishPickMutliImageBlock)(NSArray* imageArray);

@interface JYImagePickerController : NSObject
+ (void)showSinglePickerInView:(UIView*)view block:(FinishPickSingleImageBlock)block;
+ (void)showMutliPickerInView:(UIView*)view block:(FinishPickMutliImageBlock)block;

+ (void)showMutliPickerInView:(UIView *)view maxImageCount:(NSInteger)max block:(FinishPickMutliImageBlock)block;

@end
