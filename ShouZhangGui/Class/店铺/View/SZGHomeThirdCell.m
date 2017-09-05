//
//  SZGHomeThirdCell.m
//  ShouZhangGui
//
//  Created by 白慧峰 on 2017/8/28.
//  Copyright © 2017年 白慧峰. All rights reserved.
//

#import "SZGHomeThirdCell.h"
#import "MoneyItmeCell.h"
#import "SZGShopClassifyViewController.h"
#import "SZGSalesActivityViewController.h"
#import "SZGShopInfoViewController.h"

@implementation SZGHomeThirdCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitleArr:(NSArray *)titleArr imgArr:(NSArray *)imgArr {
    _titleArr = titleArr;
    _imgArr = imgArr;

    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[MoneyItmeCell class] forCellWithReuseIdentifier:@"MoneyItmeCell"];
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _titleArr.count;
}

//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
//加载cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MoneyItmeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MoneyItmeCell" forIndexPath:indexPath];
    
    cell.sView.hidden = YES;
    cell.bView.hidden = YES;
    cell.lView.hidden = YES;
    cell.rView.hidden = YES;
    
    cell.img.image = [UIImage imageNamed:_imgArr[indexPath.row]];
    cell.itmeTitle.text = _titleArr[indexPath.row];
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(kScreen_Width/3, 125.5);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HHTabbarViewController *tabar = (HHTabbarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([_titleArr[indexPath.row] isEqualToString:@"商品管理"]) {

        SZGShopClassifyViewController *massageVc = [[SZGShopClassifyViewController alloc] init];
        massageVc.title = _titleArr[indexPath.row];
        [(UINavigationController *)tabar.selectedViewController pushViewController:massageVc animated:YES];
    } else if ([_titleArr[indexPath.row] isEqualToString:@"促销活动"]) {
        SZGSalesActivityViewController *massageVc = [[SZGSalesActivityViewController alloc] init];
        massageVc.title = _titleArr[indexPath.row];
        [(UINavigationController *)tabar.selectedViewController pushViewController:massageVc animated:YES];
        
    } else if ([_titleArr[indexPath.row] isEqualToString:@"店铺信息"]) {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SZGShopInfoViewController" bundle:nil];
        SZGShopInfoViewController *wvc = [storyboard instantiateViewControllerWithIdentifier:@"SZGShopInfoViewController"];
        wvc.title = _titleArr[indexPath.row];
        
        [(UINavigationController *)tabar.selectedViewController pushViewController:wvc animated:YES];
        
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
