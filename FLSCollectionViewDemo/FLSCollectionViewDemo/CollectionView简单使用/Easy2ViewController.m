//
//  Easy2ViewController.m
//  FLSCollectionViewDemo
//
//  Created by 天立泰 on 2018/9/29.
//  Copyright © 2018年 天立泰. All rights reserved.
//

#import "Easy2ViewController.h"
#import "FLSHeader.h"
#import "EasyCollectionViewHeaderView.h"
#import "EasyCollectionViewFooterView.h"
#import "EasyCollectionViewCell.h"

#define kLineNum 4
#define kLineSpacing 2
@interface Easy2ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView * collectionView;


@end

@implementation Easy2ViewController

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
        /**
         设置item的行间距和列间距
         */
        layout.minimumInteritemSpacing = kLineSpacing;
        layout.minimumLineSpacing = kLineSpacing;
        /**
         设置item的大小
         */
        CGFloat itemW = (kScreenWidth-(kLineNum+1)*kLineSpacing)/kLineNum-0.001;
        layout.itemSize = CGSizeMake(itemW, itemW);
        /*
         设置每个分区的上左下右的内边距
         */
        layout.sectionInset = UIEdgeInsetsMake(kLineSpacing, kLineSpacing,kLineSpacing, kLineSpacing);
        /**
         设置区头和区尾的大小
         */
        layout.headerReferenceSize = CGSizeMake(kScreenWidth, 65);
        layout.footerReferenceSize = CGSizeMake(kScreenWidth, 65);
        /**
         设置分区的头视图和尾视图是否始终固定在屏幕上边和下边
         */
        layout.sectionFootersPinToVisibleBounds = YES;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
