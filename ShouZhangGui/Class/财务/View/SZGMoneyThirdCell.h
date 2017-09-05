//
//  SZGMoneyThirdCell.h
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/29.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZGMoneyThirdCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataArr;
@property (nonatomic,strong) NSArray *imgArr;

- (void)setDataArr:(NSArray *)dataArr imgArr:(NSArray *)imgArr;

@end
