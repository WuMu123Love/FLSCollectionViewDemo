//
//  EasyCollectionController.m
//  FLSCollectionViewDemo
//
//  Created by 天立泰 on 2018/9/29.
//  Copyright © 2018年 天立泰. All rights reserved.
//

#import "EasyCollectionController.h"
#import "FLSHeader.h"
#import "EasyCollectionViewHeaderView.h"
#import "EasyCollectionViewFooterView.h"
#import "EasyCollectionViewCell.h"

#define kLineNum 4
#define kLineSpacing 2

@interface EasyCollectionController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;

@end

@implementation EasyCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"collectionView的简单使用";
    [self CreateCollectionView];
}

- (void)CreateCollectionView{
    [self.view addSubview:self.collectionView];
    
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth,kScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor orangeColor];
#pragma mark 注册头部
        [_collectionView registerClass:[EasyCollectionViewHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"EasyCollectionViewHeaderView"];
#pragma mark 注册尾部
        [_collectionView registerClass:[EasyCollectionViewFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"EasyCollectionViewFooterView"];
#pragma mark 注册Item
        [_collectionView registerClass:[EasyCollectionViewCell class] forCellWithReuseIdentifier:@"EasyCollectionViewCell"];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
/**
 分区个数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
/**
 每个分区item的个数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
/**
 创建cell
 */
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EasyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EasyCollectionViewCell" forIndexPath:indexPath];
    return cell;
}
/**
 创建区头视图和区尾视图
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){
         EasyCollectionViewHeaderView *headerView = (EasyCollectionViewHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"EasyCollectionViewHeaderView" forIndexPath:indexPath];
        return headerView;
    }else if(kind == UICollectionElementKindSectionFooter){
        EasyCollectionViewFooterView * footerView = (EasyCollectionViewFooterView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"EasyCollectionViewFooterView" forIndexPath:indexPath];
        return footerView;
    }
    return nil;
}
/**
 点击某个cell
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld分item",(long)indexPath.item);
}
/**
 cell的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat itemW = (kScreenWidth-(kLineNum+1)*kLineSpacing)/kLineNum-0.001;
    return CGSizeMake(itemW, itemW);
}
/**
 每个分区的内边距（上左下右）
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(kLineSpacing, kLineSpacing, kLineSpacing, kLineSpacing);
}
/**
 分区内cell之间的最小行间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return kLineSpacing;
}
/**
 分区内cell之间的最小列间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return kLineSpacing;
}
/**
 区头大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, 65);
}
/**
 区尾大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, 65);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
