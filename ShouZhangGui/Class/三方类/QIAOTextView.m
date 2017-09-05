//
//  QIAOTextView.m
//  NanNingO2O
//
//  Created by 葬花桥 on 15/1/16.
//  Copyright (c) 2015年 CoolTea. All rights reserved.
//

#import "QIAOTextView.h"
@interface QIAOTextView () <UITextViewDelegate>
@property (nonatomic, strong) UILabel *placeHolderLabel;
@end

@implementation QIAOTextView

- (void)awakeFromNib
{
    [super awakeFromNib];
//    [self setPlaceholder:@"备注"];
    [self setPlaceholderColor:[UIColor lightGrayColor]];
    _placeholderFont = self.font;
    
    self.layer.cornerRadius = 3.0;
    self.clipsToBounds = YES;
//    self.layer.borderColor = [[MDTXColorTransformation shareColorTransformation] hexStringToColor:@"#cccccc"].CGColor;
//    self.layer.borderWidth = 0.5;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    
    // 键盘 通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification  object:nil];
    
    self.delegate = self;
}

- (id)initWithFrame:(CGRect)frame
{
    if( (self = [super initWithFrame:frame]) )
    {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        _placeholderFont = [UIFont systemFontOfSize:11.0];
//        self.textColor = [[MDTXColorTransformation shareColorTransformation] hexStringToColor:@"#8e8e8e"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
        // 键盘通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification  object:nil];
        
        self.delegate = self;
    }
    return self;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString * toBeString = [self.text stringByReplacingCharactersInRange:range withString:text];
    if (toBeString.length > 200) {
        return NO;
    }
    return YES;
}

- (void)keyboardDidHide:(NSNotification*)note
{
    
    if (self.doneButton) {
        self.doneButton.hidden = YES;
    }
}

- (void)keyboardDidShow:(NSNotification *)note
{
    UIWindow* tempWindow = nil;
    UIView* keyboard = nil;

    tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    
    if (tempWindow == nil)
    {
        return;
    }
    
    NSInteger viewCount = [tempWindow.subviews count];
    
    ////find key board view.
    for(int i=0; i<viewCount; i++)
    {
        keyboard = [tempWindow.subviews objectAtIndex:i];
        
        //keyboard view found; add the custom button to it
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2)
        {
            if(([[keyboard description] hasPrefix:@"<UIPeripheralHostView"] == YES) ||(([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)) || ([[keyboard description] hasPrefix:@"<UIInputSetContainerView"] == YES))
            {
//                NSLog(@"find UIKeyboard or UIPeripheralHostView");
                [self creatDoneButton];
                [keyboard addSubview:_doneButton];
                break;
            }
        }
        else
        {
            if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
            {
                NSLog(@"find UIKeyboard");
                break;
            }
        }
    }
//    NSLog(@"%@", _doneButton);
}

-(void)creatDoneButton
{
    // 在键盘第1次弹出时，创建按钮
    if (self.doneButton == nil) {
        self.doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.doneButton.hidden=YES;
        //定制按钮上面要显示的文字，也可以在创建该对象时自定义，本文只自定义了按钮上面的显示文字为：buttonTitle
        [self.doneButton setTitle:_buttonTitle forState:UIControlStateNormal];   // 设置按钮的位置在恰当的地方
        [self.doneButton setFrame:CGRectMake(773/2.0, 250/2.0, 180/2.0, 68/2.0)];
        [self.doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.doneButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.doneButton setTitle:@"hello" forState:UIControlStateNormal];
        // 设置按钮背景图片
        [self.doneButton setBackgroundImage:[UIImage imageNamed:@"music_starHead_1.png"] forState:UIControlStateNormal];
        // 当按钮按下时，触发doneButton方法
        [self.doneButton addTarget:self action:@selector(doneButton:)  forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (self.editable) {  // 只有当前输入框会显示done按钮
        self.doneButton.hidden = NO;
    } else {
        self.doneButton.hidden = YES;
    }
}

//定制按钮的点击事件

- (void)doneButton:(id)sender
{
    self.doneButton.hidden=YES;
    
    [self resignFirstResponder];
    
    if (_doneEven!=nil) {  // block 回调
        _doneEven(sender);
    }
}

- (void)dealloc
{
    self.doneButton = nil;
    self.doneEven = nil;
    self.buttonTitle = nil;
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
    
    if([[self text] length] == 0)
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    else
    {
        [[self viewWithTag:999] setAlpha:0];
    }
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if( [[self placeholder] length] > 0 )
    {
        if ( _placeHolderLabel == nil )
        {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,8,self.bounds.size.width - 16,0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = _placeholderFont;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    [super drawRect:rect];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
