//
//  TravelItineraryVc.m
//  TourismT
//
//  Created by Store on 2017/7/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TravelItineraryVc.h"
#import "TravelItineraryCell.h"
#import "TravelItineraryDetailVc.h"
#import "lookWkweb.h"
@interface TravelItineraryVc ()
@property (nonatomic,strong) TravelItineraryList *data;
@end

@implementation TravelItineraryVc
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.NodataDescribe = @"您还没有行程哦～";
    }
    return self;
}
- (void)customBackButton{}
- (void)hideBottomBarWhenPush{}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNeedRefreshWhenLoginOrOut = YES;
    self.basicTableView.contentInset = UIEdgeInsetsMake(7.5, 0, 7.5+HEIGHT_bottmo, 0);
    [self.basicTableView registerClass:[TravelItineraryCell class] forCellReuseIdentifier:NSStringFromClass([TravelItineraryCell class])];
    [self.header beginRefreshing];
}

-(void)loadNewData{
    self.Pagenumber = Firstpage;
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appv2travelgroup_trave_linetravel_itineraryWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.data = [TravelItineraryList mj_objectWithKeyValues:dataDict];
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:weakself.data.totalPages];
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}
- (void)loadMoreData{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appv2travelgroup_trave_linetravel_itineraryWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
        TravelItineraryList *dataTmp = [TravelItineraryList mj_objectWithKeyValues:dataDict];
        [weakself.data.Arry_travelItinerary addObjectsFromArray:dataTmp.Arry_travelItinerary];

        [weakself loadMoreDataEndFootsuccessSet:nil totalPages:dataTmp.totalPages];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
    }];
}
#pragma -mark<每组cell的数量>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.Arry_travelItinerary.count;
}

#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelItineraryCell *cell = [TravelItineraryCell returnCellWith:tableView];
    [self configureTravelItineraryCell:cell atIndexPath:indexPath];
    return  cell;
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([TravelItineraryCell class]) configuration:^(TravelItineraryCell *cell) {
        [weakself configureTravelItineraryCell:cell atIndexPath:indexPath];
    }];
}

#pragma --mark<选中了cell>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelItineraryList_one *data = self.data.Arry_travelItinerary[indexPath.row];
    if (data.idd) {
        lookWkweb *vc = [lookWkweb new];
        vc.title = data.travelName;
        vc.url = data.detailUrl;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [MBProgressHUD showPrompt:@"您还没有行程哦～" toView:self.view];
    }
}

#pragma --mark< 配置cell 的数据>
- (void)configureTravelItineraryCell:(TravelItineraryCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.data = self.data.Arry_travelItinerary[indexPath.row];
}
@end
