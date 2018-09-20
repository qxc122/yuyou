//
//  StagingDetailsList.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "StagingDetailsList.h"
#import "StagingDetailsListCell.h"
#import "StagingDetailsListHeadCell.h"

@interface StagingDetailsList ()
@property (nonatomic,strong) periodItemListAForAll *dateperiodList;
@end

@implementation StagingDetailsList

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分期明细";
    [self.basicTableView registerClass:[StagingDetailsListCell class] forCellReuseIdentifier:NSStringFromClass([StagingDetailsListCell class])];
    [self.basicTableView registerClass:[StagingDetailsListHeadCell class] forCellReuseIdentifier:NSStringFromClass([StagingDetailsListHeadCell class])];
    [self.header beginRefreshing];
}

#pragma -mark<MJ_head加载数据  头部>
- (void)loadNewData{
    __weak typeof(self) weakSelf = self;
    [[ToolRequest sharedInstance]appuserperiodperiod_detailWithIid:[self.date.periodId integerValue] success:^(id dataDict, NSString *msg, NSInteger code) {
        weakSelf.dateperiodList =[periodItemListAForAll mj_objectWithKeyValues:dataDict];
        [weakSelf loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakSelf loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section==0) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([StagingDetailsListHeadCell class]) configuration:^(StagingDetailsListHeadCell *cell) {
            [weakself configureStagingDetailsListHeadCell:cell atIndexPath:indexPath];
        }];
    } else {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([StagingDetailsListCell class]) configuration:^(StagingDetailsListCell *cell) {
            [weakself configureStagingDetailsListCell:cell atIndexPath:indexPath];
        }];
    }
    return 0.01;
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configureStagingDetailsListCell:(StagingDetailsListCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.dateperiodList.periodItemListA[indexPath.row];
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configureStagingDetailsListHeadCell:(StagingDetailsListHeadCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date  = self.dateperiodList;
}

#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {

    } else {
        return self.dateperiodList.periodItemListA.count;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dateperiodList?2:0;
}
//#pragma --mark< 点击了  cell >
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        StagingDetailsListHeadCell *cell = [StagingDetailsListHeadCell returnCellWith:tableView];
        [self configureStagingDetailsListHeadCell:cell atIndexPath:indexPath];
        return  cell;
    } else {
        StagingDetailsListCell *cell = [StagingDetailsListCell returnCellWith:tableView];
        [self configureStagingDetailsListCell:cell atIndexPath:indexPath];
        return  cell;
    }
    return nil;
}

@end
