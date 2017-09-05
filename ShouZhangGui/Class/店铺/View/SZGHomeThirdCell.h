//
//  SZGHomeThirdCell.h
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/28.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZGHomeThirdCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *titleContent;
@property (weak, nonatomic) IBOutlet UILabel *detailTitlecontent;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *imgArr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (void)setTitleArr:(NSArray *)titleArr imgArr:(NSArray *)imgArr;

@end
