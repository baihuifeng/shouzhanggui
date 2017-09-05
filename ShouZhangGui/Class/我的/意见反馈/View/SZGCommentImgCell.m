//
//  SZGCommentImgCell.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/9/5.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGCommentImgCell.h"
#import "CommentImgItmeCell.h"

@implementation SZGCommentImgCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImgArr:(NSArray *)imgArr {

    _imgeArr = [[NSMutableArray alloc] init];
    [_imgeArr addObjectsFromArray:imgArr];
    [_imgeArr addObject:@"add"];
    
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[CommentImgItmeCell class] forCellWithReuseIdentifier:@"CommentImgItmeCell"];
    [_collectionView reloadData];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _imgeArr.count;
}

//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
//加载cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentImgItmeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CommentImgItmeCell" forIndexPath:indexPath];
    
    if ([_imgeArr[indexPath.row] isKindOfClass:[UIImage class]]) {
        cell.img = _imgeArr[indexPath.row];
    } else {
        if ([_imgeArr[indexPath.row] isEqualToString:@"add"]) {
            
        } else {
        
        }
    }
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreen_Width/320 *51, kScreen_Width/320 *51);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_imgeArr[indexPath.row] isKindOfClass:[UIImage class]]) {
    } else {
        if ([_imgeArr[indexPath.row] isEqualToString:@"add"]) {
            [self.delegate addImg];
        } else {
            
        }
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
