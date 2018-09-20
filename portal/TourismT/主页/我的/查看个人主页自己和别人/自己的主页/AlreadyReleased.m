//
//  AlreadyReleased.m
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "AlreadyReleased.h"
#import "NSString+check.h"
#import "emptyMyOrOtherCell.h"
#import "AlbummyOrtherHomeCell.h"

@interface AlreadyReleased ()
@property (nonatomic,assign) NSInteger PageNumber;
@property (nonatomic,assign) NSInteger PageSize;
@end

@implementation AlreadyReleased

-(void)renderUIWithInfo:(NSDictionary *)info{
    [super renderUIWithInfo:info];
//    self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
//    UIEdgeInsets tt= self.tableView.contentInset;
    self.PageNumber = 2;
    self.PageSize = tourPageSize;
    self.backgroundColor = [UIColor redColor];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//     return 20;
    if (self.oneData.sharingsA.count) {
        return  self.oneData.sharingsA.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.oneData.sharingsA.count) {
        if (indexPath.row == 0) {
            return 120*HEIGHTICON+15+15;
        }
       return 120*HEIGHTICON+15;
    }
    return CGRectGetHeight(self.frame);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.oneData.sharingsA.count) {
        AlbummyOrtherHomeCell *cell = [AlbummyOrtherHomeCell returnCellWith:tableView];
        [self configureAlbummyOrtherHomeCell:cell atIndexPath:indexPath];
        return  cell;
    }
    emptyMyOrOtherCell *cell = [emptyMyOrOtherCell returnCellWith:tableView];
    [self configureemptyMyOrOtherCell:cell atIndexPath:indexPath];
    return  cell;
}
#pragma --mark<配置  别人发布的游记 cell >
- (void)configureAlbummyOrtherHomeCell:(AlbummyOrtherHomeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.indexPath = indexPath;
    cell.oneData = self.oneData.sharingsA[indexPath.row];
}
#pragma --mark<配置  configureemptyMyOrOtherCell cell >
- (void)configureemptyMyOrOtherCell:(emptyMyOrOtherCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.desStr =@"暂无游记";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.shareORkeep) {
        travelSharingsS *one = self.oneData.sharingsA[indexPath.row];
        self.shareORkeep(one);
    }
}
- (void)setOneData:(peoHome_page *)oneData{
    _oneData = oneData;
    [self.tableView reloadData];
    if (!self.tableView.mj_footer) {
        [self MJRefreshFoot];
    }
    if (oneData.publishTravels == oneData.sharingsA.count) {
        self.tableView.mj_footer.hidden = YES;
    }else{
        self.tableView.mj_footer.hidden = NO;
    }
}

#pragma -mark<mj_footer 加载数据>
- (void)MJRefreshFoot{
    kWeakSelf(self);
    // 上拉加载更多
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 增加10条数据
        appS *decodedBag = [tourInfo sharedInstance].UserInfo;
        [[ToolRequest sharedInstance]home_pagesharingsWithPageNumber:weakself.PageNumber PageSize:weakself.PageSize userId:decodedBag.idd success:^(id dataDict, NSString *msg, NSInteger code) {
            lcxctravelS *lcxctravelSData = [lcxctravelS mj_objectWithKeyValues:dataDict];
            if (weakself.PageNumber >= lcxctravelSData.totalPages) {
                //if ([lcxctravelSData.contentA count]<weakself.PageSize) {
                weakself.tableView.mj_footer.hidden = YES;
                [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [weakself.tableView.mj_footer resetNoMoreData];
            }
            if (lcxctravelSData.contentA.count) {
                [weakself.oneData.sharingsA addObjectsFromArray:lcxctravelSData.contentA];
                [weakself.tableView reloadData];
            }
            weakself.PageNumber++;
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD showPrompt:msg];
            [weakself.tableView.mj_footer endRefreshing];
        }];
    }];
    // 默认先隐藏footer
//    self.tableView.mj_footer.hidden = YES;
}
@end
