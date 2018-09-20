//
//  TransactionDetailsVc.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TransactionDetailsVc.h"
#import "TransactionDetailsCell.h"
#import "NSString+check.h"


@interface TransactionDetailsVc ()

@end

@implementation TransactionDetailsVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易明细";
    [self.basicTableView registerClass:[TransactionDetailsCell class] forCellReuseIdentifier:NSStringFromClass([TransactionDetailsCell class])];
    if (self.date) {
        self.empty_typeV2 = succes_empty_numV2;
        [self.basicTableView reloadData];
    } else {
        [self.header beginRefreshing];
    }
}

- (void)loadNewData{
    __weak typeof(self) weakSelf = self;
    [[ToolRequest sharedInstance]appuserperiodrepayment_detailWithbillId:weakSelf.billId success:^(id dataDict, NSString *msg, NSInteger code) {
        NSLog(@"df");
        weakSelf.date =[rePaymentInfoAllForONeS mj_objectWithKeyValues:dataDict];
        
        [weakSelf loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
    } failure:^(NSInteger errorCode, NSString *msg) {
        NSLog(@"df");
        [weakSelf loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat tmp = 0;
    if (self.date.introduces.count) {
        NSString *all = @"";
        NSInteger allNum = 0;
        for (NSString *str in self.date.introduces) {
            if (str && str.length) {
                all = [all stringByAppendingString:str];
                if (allNum < (self.date.introduces.count-1)) {
                    all = [all stringByAppendingString:@"\n"];
                }
            }
            allNum ++;
        }
        CGFloat height = [NSString HeightForText:all withFont:PingFangSC_Regular(14) withTextWidth:ScreenWidth-16-60-20-14];
        tmp = 293 + height +10;
    } else {
        tmp = 293+14+10;
    }
    return tmp;
    
//    kWeakSelf(self);
//    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([TransactionDetailsCell class]) configuration:^(TransactionDetailsCell *cell) {
//        [weakself configureTransactionDetailsCell:cell atIndexPath:indexPath];
//    }];
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configureTransactionDetailsCell:(TransactionDetailsCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date= self.date;
}

#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.date) {
        return 1;
    }
    return 0;
}

#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TransactionDetailsCell *cell = [TransactionDetailsCell returnCellWith:tableView];
    [self configureTransactionDetailsCell:cell atIndexPath:indexPath];
    return  cell;
}

@end
