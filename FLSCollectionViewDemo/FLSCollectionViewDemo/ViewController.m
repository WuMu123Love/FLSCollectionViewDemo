//
//  ViewController.m
//  FLSCollectionViewDemo
//
//  Created by 天立泰 on 2018/9/29.
//  Copyright © 2018年 天立泰. All rights reserved.
//

#import "ViewController.h"
#import "EasyCollectionController.h"
#import "Easy2ViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}
- (void)createTableView{
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 50;
    self.tableView.tableFooterView = [UIView new];
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
    }
#endif
}
#pragma mark tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"UITableViewCellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            EasyCollectionController * vc = [[EasyCollectionController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            Easy2ViewController * vc = [[Easy2ViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"简单使用1",@"简单使用2"];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
