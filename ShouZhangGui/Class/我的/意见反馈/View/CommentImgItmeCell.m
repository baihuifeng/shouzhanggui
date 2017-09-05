//
//  CommentImgItmeCell.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/9/5.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "CommentImgItmeCell.h"

@implementation CommentImgItmeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"CommentImgItmeCell" owner:self options:nil];
        self = [arr objectAtIndex:0];
        
    }
    return self;
    
}

@end
