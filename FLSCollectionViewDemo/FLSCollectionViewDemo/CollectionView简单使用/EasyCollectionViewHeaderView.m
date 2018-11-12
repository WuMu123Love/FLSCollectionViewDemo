//
//  EasyCollectionViewHeaderView.m
//  FLSCollectionViewDemo
//
//  Created by 天立泰 on 2018/9/29.
//  Copyright © 2018年 天立泰. All rights reserved.
//

#import "EasyCollectionViewHeaderView.h"

@implementation EasyCollectionViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"EasyCollectionViewHeaderView" owner:self options:nil].firstObject;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
