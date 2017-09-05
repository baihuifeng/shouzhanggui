//
//  NSDictionary+NullReplacement.h
//  JinSeJiaYuanWang
//
//  Created by honghong on 16/7/22.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NullReplacement)
- (NSDictionary *)dictionaryByReplacingNullsWithBlanks;
@end

@interface NSArray (NullReplacement)
- (NSArray *)arrayByReplacingNullsWithBlanks;
@end
