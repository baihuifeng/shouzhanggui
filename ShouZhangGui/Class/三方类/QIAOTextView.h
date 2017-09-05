//
//  QIAOTextView.h
//  NanNingO2O
//
//  Created by 葬花桥 on 15/1/16.
//  Copyright (c) 2015年 CoolTea. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DoneActionBlock)(id);

@interface QIAOTextView : UITextView
{
    NSString *_placeholder;
    UIColor *_placeholderColor;
}

@property(nonatomic, strong) NSString *placeholder;
@property(nonatomic, strong) UIColor *placeholderColor;
@property(nonatomic, strong) UIFont *placeholderFont;

@property(nonatomic, strong) UIButton* doneButton;
@property(nonatomic, strong) NSString* buttonTitle;
@property(nonatomic, copy)   DoneActionBlock doneEven;

@end
