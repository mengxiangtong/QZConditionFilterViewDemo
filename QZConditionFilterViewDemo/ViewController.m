//
//  ViewController.m
//  QZConditionFilterViewDemo
//
//  Created by MrYu on 16/9/21.
//  Copyright © 2016年 yu qingzhu. All rights reserved.
//

#import "ViewController.h"
#import "QZConditionFilterView.h"
#import "UIView+Extension.h"

@interface ViewController ()
{
    // 装网络请求url中的筛选项
    NSArray *_selectedDataSource1Ary;
    NSArray *_selectedDataSource2Ary;
    NSArray *_selectedDataSource3Ary;
    
    QZConditionFilterView *_conditionFilterView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"ListView";
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setHidden:YES];
    
    
    _selectedDataSource1Ary = @[@"默认条件"];
    _selectedDataSource2Ary = @[@"默认条件"];
    _selectedDataSource3Ary = @[@"默认条件"];
    
    _conditionFilterView = [QZConditionFilterView conditionFilterViewWithFilterBlock:^(BOOL isFilter, NSArray *dataSource1Ary, NSArray *dataSource2Ary, NSArray *dataSource3Ary) {
        if (isFilter) {
            _selectedDataSource1Ary = dataSource1Ary;
            _selectedDataSource2Ary = dataSource2Ary;
            _selectedDataSource3Ary = dataSource3Ary;
        }else{
            _selectedDataSource1Ary = @[@"默认条件"];
            _selectedDataSource2Ary = @[@"默认条件"];
            _selectedDataSource3Ary = @[@"默认条件"];
        }
        [self startRequest];
    }];
    _conditionFilterView.y += 64;
    // 传入数据源
    _conditionFilterView.dataAry1 = @[@"1-1",@"1-2",@"1-3",@"1-4",@"1-5"];
    _conditionFilterView.dataAry2 = @[@"2-1",@"2-2",@"2-3",@"2-4",@"2-5"];
    _conditionFilterView.dataAry3 = @[@"3-1",@"3-2",@"3-3",@"3-4",@"3-5"];
    
    [_conditionFilterView bindChoseArrayDataSource1:_selectedDataSource1Ary DataSource2:_selectedDataSource2Ary DataSource3:_selectedDataSource3Ary];
    
    [self.view addSubview:_conditionFilterView];
    
}

- (void)startRequest
{

    NSString *source1 = [NSString stringWithFormat:@"%@",_selectedDataSource1Ary.firstObject];
    NSString *source2 = [NSString stringWithFormat:@"%@",_selectedDataSource2Ary.firstObject];
    NSString *source3 = [NSString stringWithFormat:@"%@",_selectedDataSource3Ary.firstObject];
    NSDictionary *dic = [_conditionFilterView keyValueDic];
    // 可以用字符串在dic换成对应英文key
    
    NSLog(@"第一个条件:%@\n  第二个条件:%@\n  第三个条件:%@\n",source1,source2,source3);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
