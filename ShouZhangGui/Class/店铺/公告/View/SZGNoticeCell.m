//
//  SZGNoticeCell.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/29.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGNoticeCell.h"

@implementation SZGNoticeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (CGFloat)cellHeight:(NSString *)str {
    
    NSLog(@"====%f===29",[NSString stringSizeWithString:str maxSize:CGSizeMake(kScreen_Width-20, CGFLOAT_MAX) wordFont:12].height);

    
    return [NSString stringSizeWithString:str maxSize:CGSizeMake(kScreen_Width-20, CGFLOAT_MAX) wordFont:12].height + 70;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
