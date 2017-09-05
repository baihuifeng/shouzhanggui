//
//  SZGCommentImgCell.h
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/9/5.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SZGCommentImgCell;
@protocol GetImgDelegate <NSObject>

- (void)addImg;

@end


@interface SZGCommentImgCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>

- (void)setImgArr:(NSArray *)imgArr;

@property (weak, nonatomic) IBOutlet QIAOTextView *textView;
@property (nonatomic,strong) NSMutableArray *imgeArr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak,nonatomic) id <GetImgDelegate> delegate;

@end
