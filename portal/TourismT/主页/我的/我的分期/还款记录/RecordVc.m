//
//  RecordVc.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "RecordVc.h"
#import "RecordVcCell.h"
#import "TransactionDetailsVc.h"
@interface RecordVc ()
@property (nonatomic,strong) rePaymentInfoAll *date; 
@end

@implementation RecordVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"还款记录";
    [self.basicTableView registerClass:[RecordVcCell class] forCellReuseIdentifier:NSStringFromClass([RecordVcCell class])];
    [self.header beginRefreshing];
}

- (void)loadNewData{
    __weak typeof(self) weakSelf = self;
    [[ToolRequest sharedInstance]appuserperiodrePayment_listsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        NSLog(@"df");
        weakSelf.date =[rePaymentInfoAll mj_objectWithKeyValues:dataDict];
        [weakSelf loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakSelf loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([RecordVcCell class]) configuration:^(RecordVcCell *cell) {
        [weakself configureRecordVcCell:cell atIndexPath:indexPath];
    }];
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configureRecordVcCell:(RecordVcCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date =self.date.rePaymentInfoA[indexPath.row];
}

#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.date.rePaymentInfoA.count;
}

#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TransactionDetailsVc *vc = [TransactionDetailsVc new];
    vc.date = self.date.rePaymentInfoA[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecordVcCell *cell = [RecordVcCell returnCellWith:tableView];
    [self configureRecordVcCell:cell atIndexPath:indexPath];
    return  cell;
}
@end
