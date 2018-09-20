//
//  myOreserFiveAll.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOreserFiveAll.h"
#import "myOreserFiveToPay.h"
#import "myOreserFiveGOyouCell.h"
#import "sysPhto.h"



@interface myOreserFiveAll ()
@property (nonatomic,strong) orderlistS *datess;

@property (nonatomic,strong) NSString *loadStr;
@end

@implementation myOreserFiveAll

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNeedRefreshWhenLoginOrOut = YES;
    if (self.type == ALL_myOreserFiveAll_type) {
        self.loadStr = ALL_myOreserFiveAll_type_str;
    } else if (self.type == TOPAY_myOreserFiveAll_type) {
        self.loadStr = TOPAY_myOreserFiveAll_type_str;
    } else if (self.type == TOdianping_myOreserFiveAll_type) {
        self.loadStr = TOdianping_myOreserFiveAll_type_str;
    } else if (self.type == toGo_myOreserFiveAll_type) {
        self.loadStr = toGo_myOreserFiveAll_type_str;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(needRefremydingdangFunc:)
                                                     name:pingjialemydingdang
                                                   object:nil];
    } else if (self.type == tuikuang_myOreserFiveAll_type) {
        self.loadStr = tuikuang_myOreserFiveAll_type_str;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(needRefremydingdangFunc:)
                                                 name:needRefremydingdang
                                               object:nil];
    [self setUI];
    [self.header beginRefreshing];
}
- (void)needRefremydingdangFunc:(NSNotification *)user{
    self.isNeedRefreth = YES;
    NSLog(@"1234");
    NSLog(@"1234");
}
- (void)setUI{
    [self.basicTableView registerClass:[myOreserFiveToPay class] forCellReuseIdentifier:NSStringFromClass([myOreserFiveToPay class])];
    [self.basicTableView registerClass:[myOreserFiveGOyouCell class] forCellReuseIdentifier:NSStringFromClass([myOreserFiveGOyouCell class])];
}
- (void)loadNewData{
    kWeakSelf(self);
    self.Pagenumber = Firstpage;
    [[ToolRequest sharedInstance]appuserorderlistWithPageNumber:self.Pagenumber PageSize:self.Pagesize status:self.loadStr success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.datess = [orderlistS mj_objectWithKeyValues:dataDict];
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:weakself.datess.totalPages];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}

- (void)loadMoreData{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appuserorderlistWithPageNumber:self.Pagenumber PageSize:self.Pagesize status:self.loadStr success:^(id dataDict, NSString *msg, NSInteger code) {
        orderlistS *datess = [orderlistS mj_objectWithKeyValues:dataDict];
        [weakself.datess.contentA addObjectsFromArray:datess.contentA];
        [weakself loadMoreDataEndFootsuccessSet:nil totalPages:weakself.datess.totalPages];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
    }];
}

/*
#pragma -mark<MJ_head加载数据  头部>
- (void)MJRefreshHead{
    __weak typeof(self) weakSelf = self;
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf shuxingshujudata:MJREFRESH_REFRESH];
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma -mark<MJ_head加载数据   底部>
- (void)MJRefreshFoot{
    __weak typeof(self) weakSelf = self;
    // 上拉加载更多
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 增加10条数据
        [weakSelf shuxingshujudata:MJREFRESH_LOADMORE];
    }];
    // 默认先隐藏footer
    self.tableView.mj_footer.hidden = YES;
}
- (void)shuxingshujudata:(MJREFRESH_DIRECTION)direction{
    if (direction == MJREFRESH_LOADMORE) {//加载更多
        self.PageNumber ++;
    } else if (direction == MJREFRESH_REFRESH){ //刷新
        self.PageNumber = 1;
    }
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appuserorderlistWithPageNumber:self.Pagenumber PageSize:self.Pagesize status:self.loadStr success:^(id dataDict, NSString *msg, NSInteger code) {
        orderlistS *datess = [orderlistS mj_objectWithKeyValues:dataDict];
        weakself.tableView.mj_footer.hidden = NO;
        if (weakself.tableView.mj_header.isRefreshing) {
            [weakself.tableView.mj_header endRefreshing];
            weakself.datess = datess;
        } else {
            [weakself.datess.contentA addObjectsFromArray:datess.contentA];
        }
        if (weakself.PageNumber >= datess.totalPages) {
        //if ([datess.contentA count]<weakself.PageSize) {
            [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
            weakself.tableView.mj_footer.hidden = YES;
        }else{
            [weakself.tableView.mj_footer resetNoMoreData];
        }
//        if ([datess.contentA count]) {
//            weakself.tableView.mj_footer.hidden = NO;
//        }
        
        weakself.IsLoadSuccessfully = YES;

        [weakself setdelegate];
    } failure:^(NSInteger errorCode, NSString *msg) {
        if (direction == MJREFRESH_REFRESH) {
            [weakself.tableView.mj_header endRefreshing];
        } else if (direction == MJREFRESH_LOADMORE){
            weakself.PageNumber --;
            [weakself.tableView.mj_footer endRefreshing];
        }
        if (!weakself.datess) {
            weakself.IsLoadSuccessfully = NO;
        }
        weakself.tableView.mj_footer.hidden = YES;
        [weakself setdelegate];
    }];
}

- (void)setdelegate{
    if (!self.tableView.emptyDataSetSource ) {
        self.tableView.emptyDataSetSource = self;
    }
    if (!self.tableView.emptyDataSetDelegate ) {
        self.tableView.emptyDataSetDelegate = self;
    }
    [self.tableView reloadData];
}
 */

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    orderlistForOneS *one = self.datess.contentA[indexPath.row];
    if (([one.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str] && !one.expired )|| ([one.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str] && one.commentable)) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myOreserFiveToPay class]) configuration:^(myOreserFiveToPay *cell) {
            [self configuremyOreserFiveToPay:cell atIndexPath:indexPath];
        }];
    } else
//        if ([one.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str] || [one.orderStatus isEqualToString:tuikuang_myOreserFiveAll_type_str] || [one.orderStatus isEqualToString:confirm_myOreserFiveAll_type_str])
        {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myOreserFiveGOyouCell class]) configuration:^(myOreserFiveGOyouCell *cell) {
            [weakself configuremyOreserFiveGOyouCell:cell atIndexPath:indexPath];
        }];
    }
    return 0;
}
#pragma --mark<配置cell>
#pragma --mark<去付款>
- (void)configuremyOreserFiveToPay:(myOreserFiveToPay *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.datessTwo = self.datess.contentA[indexPath.row];
    kWeakSelf(self);
    cell.btnClick = ^(orderlistForOneS *datessTwo){
        if ([datessTwo.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) {
            myOreserDetail *vc = [[myOreserDetail alloc]init];
            //            vc.type = self.type;
            vc.datess = weakself.datess.contentA[indexPath.row];
            [weakself.navigationController pushViewController:vc animated:YES];

        }else if ([datessTwo.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str]){
            sysPhto *sysphto = [[sysPhto alloc]init];
            SelectOrder_date *tmp = [SelectOrder_date new];
            tmp.Arry_orders = [NSMutableArray arrayWithObject:datessTwo];
            sysphto.dateSelectOrder = tmp;
            sysphto.isFromPingJia = YES;
            [weakself.navigationController pushViewController:sysphto animated:YES];
//            pingjia *vc = [[pingjia alloc]init];
//            vc.datessTwo = datessTwo;
//            [weakself.navigationController pushViewController:vc animated:YES];
        }
    };
}
- (void)configuremyOreserFiveGOyouCell:(myOreserFiveGOyouCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.datess = self.datess.contentA[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datess.contentA.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    myOreserDetail *vc = [[myOreserDetail alloc]init];
//    vc.type = self.type;
    vc.datess = self.datess.contentA[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    orderlistForOneS *one = self.datess.contentA[indexPath.row];
    if (([one.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str] && !one.expired )|| ([one.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str] && one.commentable)) {
        myOreserFiveToPay *cell = [myOreserFiveToPay returnCellWith:tableView];
        [self configuremyOreserFiveToPay:cell atIndexPath:indexPath];
        return  cell;
    } else
//        if ([one.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str] || [one.orderStatus isEqualToString:tuikuang_myOreserFiveAll_type_str] || [one.orderStatus isEqualToString:confirm_myOreserFiveAll_type_str])
    {
        myOreserFiveGOyouCell *cell = [myOreserFiveGOyouCell returnCellWith:tableView];
        [self configuremyOreserFiveGOyouCell:cell atIndexPath:indexPath];
        return  cell;
    }
//    else{
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NO"];
//        if (!cell) {
//            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"NO"];
//        }
//        return cell;
//        NSLog(@"sadfasdf");
//    }
    return nil;
}

@end
