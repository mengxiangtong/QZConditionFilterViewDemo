//
//  QZConditionFilterView.h
//  QZConditionFilterViewDemo
//
//  Created by MrYu on 16/9/21.
//  Copyright © 2016年 yu qingzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 三个tableView cell 类型的筛选*/

typedef void (^FilterBlock)(BOOL isFilter, NSArray *dataSource1Ary,NSArray *dataSource2Ary, NSArray *dataSource3Ary);

@interface QZConditionFilterView : UIView

/** 筛选按钮的标题数据 你如全部活动、全部城市、、、*/
@property (nonatomic,strong) NSArray *sortTitleAry;
/** 对应三个下拉tableView的数据源*/
@property (nonatomic,strong) NSArray *dataAry1;
@property (nonatomic,strong) NSArray *dataAry2;
@property (nonatomic,strong) NSArray *dataAry3;

/**是否展示*/
@property (nonatomic,readonly,assign)BOOL isShow;

/** 创建实例 with block*/
+(instancetype)conditionFilterViewWithFilterBlock:(FilterBlock)filterBlock;

/** 刷新标题字*/
-(void)bindChoseArrayDataSource1:(NSArray *)dataSource1Ary DataSource2:(NSArray *)dataSource2Ary DataSource3:(NSArray *)dataSource3Ary;

/** 消失*/
-(void)dismiss;

/** 网络请求key value从这取*/
@property (nonatomic,strong) NSDictionary *keyValueDic;

@end
