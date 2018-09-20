//
//  BottomDetailsTableView.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "BottomDetailsTableView.h"
#import "shareCell.h"
#import "WkWebCell.h"
#import "TravelitinerarySmallCell.h"
#import "userAllCell.h"
#import "shareNoArryCell.h"
#import "titleSmallBasicCell.h"
#import "HaveDiscountNoStage.h"

#import "NODiscountStage.h"
#import "HaveDiscountStage.h"

@interface BottomDetailsTableView ()

@end

@implementation BottomDetailsTableView
-(void)renderUIWithInfo:(NSDictionary *)info{
    [super renderUIWithInfo:info];
    [self.tableView registerClass:[shareCell class] forCellReuseIdentifier:NSStringFromClass([shareCell class])];
    [self.tableView registerClass:[WkWebCell class] forCellReuseIdentifier:NSStringFromClass([WkWebCell class])];
    [self.tableView registerClass:[TravelitinerarySmallCell class] forCellReuseIdentifier:NSStringFromClass([TravelitinerarySmallCell class])];
    [self.tableView registerClass:[userAllCell class] forCellReuseIdentifier:NSStringFromClass([userAllCell class])];
    [self.tableView registerClass:[titleSmallBasicCell class] forCellReuseIdentifier:NSStringFromClass([titleSmallBasicCell class])];
    [self.tableView registerClass:[HaveDiscountNoStage class] forCellReuseIdentifier:NSStringFromClass([HaveDiscountNoStage class])];
    
    [self.tableView registerClass:[shareNoArryCell class] forCellReuseIdentifier:NSStringFromClass([shareNoArryCell class])];
    [self.tableView registerClass:[NODiscountStage class] forCellReuseIdentifier:NSStringFromClass([NODiscountStage class])];
    [self.tableView registerClass:[HaveDiscountStage class] forCellReuseIdentifier:NSStringFromClass([HaveDiscountStage class])];
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    if (self.data) {
//        return 5;
//    }
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.row == 0) {
        if (self.data.travel.isPeriod && self.data.minPriceStr && self.data.minPriceStr.length  && self.data.periodTypeNum && self.data.periodTypeNum.length ) {
            if (self.data.couponDiscountStr && self.data.couponDiscountStr.length) {
                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([HaveDiscountStage class]) configuration:^(HaveDiscountStage *cell) {
                    [weakself configureHaveDiscountStage:cell atIndexPath:indexPath];
                }];
            } else {
                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([NODiscountStage class]) configuration:^(NODiscountStage *cell) {
                    [weakself configureNODiscountStage:cell atIndexPath:indexPath];
                }];
            }
        } else {
            if (self.data.couponDiscountStr && self.data.couponDiscountStr.length) {
                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([HaveDiscountNoStage class]) configuration:^(HaveDiscountNoStage *cell) {
                    [weakself configureHaveDiscountNoStage:cell atIndexPath:indexPath];
                }];
            } else {
                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([titleSmallBasicCell class]) configuration:^(titleSmallBasicCell *cell) {
                    [weakself configuretitleSmallBasicCell:cell atIndexPath:indexPath];
                }];
            }
        }
    } else if (indexPath.row == 1) {
        if (self.data.travel.joinUsersA.count) {
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([userAllCell class]) configuration:^(userAllCell *cell) {
                [weakself configureuserAllCell:cell atIndexPath:indexPath];
            }];
        }
    } else if (indexPath.row == 2) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([TravelitinerarySmallCell class]) configuration:^(TravelitinerarySmallCell *cell) {
            [weakself configureTravelitinerarySmallCell:cell atIndexPath:indexPath];
        }];
    } else if (indexPath.row == 3) {
        if (self.data.travelFeelsUrl) {
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([WkWebCell class]) configuration:^(WkWebCell *cell) {
                [weakself configureWkWebCell:cell atIndexPath:indexPath];
            }];
        }
    } else if (indexPath.row == 4) {
        if (self.data.bookingNotesUrl) {
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([WkWebCell class]) configuration:^(WkWebCell *cell) {
                [weakself configureWkWebCell:cell atIndexPath:indexPath];
            }];
        }
    } else if (indexPath.row == 5) {
        if (self.data.Arry_travelSharings.count) {
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([shareCell class]) configuration:^(shareCell *cell) {
                [weakself configureshareCell:cell atIndexPath:indexPath];
            }];
        }else{
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([shareNoArryCell class]) configuration:^(shareNoArryCell *cell) {
                [weakself configureshareNoArryCell:cell atIndexPath:indexPath];
            }];
        }
    }
    return 0.001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    if (self.data && section==0) {
//        BottomDetailsTableViewFoot *foot = [BottomDetailsTableViewFoot  new];
//        foot.btnClick = ^(BottomDetailsTableViewFoot_type type) {
//            if (self.btnClick) {
//                self.btnClick(type);
//            }
//            NSLog(@"type=%ld",(long)type);
//        };
//        foot.wanTogoIsenabel = self.data.Arry_initiateMonthPrice.count?YES:NO;
//        return foot;
//    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if (self.data && section==0) {
//        return 50;
//    }
    return 0.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        if (self.data.travel.isPeriod && self.data.minPriceStr && self.data.minPriceStr.length  && self.data.periodTypeNum && self.data.periodTypeNum.length ) {
            if (self.data.couponDiscountStr && self.data.couponDiscountStr.length) {
                cell = [HaveDiscountStage returnCellWith:tableView];
                [self configureHaveDiscountStage:(HaveDiscountStage *)cell atIndexPath:indexPath];
            } else {
                cell = [NODiscountStage returnCellWith:tableView];
                [self configureNODiscountStage:(NODiscountStage *)cell atIndexPath:indexPath];
            }
        } else {
            if (self.data.couponDiscountStr && self.data.couponDiscountStr.length) {
                cell = [HaveDiscountNoStage returnCellWith:tableView];
                [self configureHaveDiscountNoStage:(HaveDiscountNoStage *)cell atIndexPath:indexPath];
            } else {
                cell = [titleSmallBasicCell returnCellWith:tableView];
                [self configuretitleSmallBasicCell:(titleSmallBasicCell *)cell atIndexPath:indexPath];
            }
        }
    } else if (indexPath.row == 1) {
        if (self.data.travel.joinUsersA.count) {
            cell = [userAllCell returnCellWith:tableView];
            [self configureuserAllCell:(userAllCell *)cell atIndexPath:indexPath];
        }
    } else if (indexPath.row == 2) {
        cell = [TravelitinerarySmallCell returnCellWith:tableView];
        [self configureTravelitinerarySmallCell:(TravelitinerarySmallCell *)cell atIndexPath:indexPath];
    } else if (indexPath.row == 3) {
        cell = [WkWebCell returnCellWith:tableView];
        [self configureWkWebCell:(WkWebCell *)cell atIndexPath:indexPath];
    } else if (indexPath.row == 4) {
        cell = [WkWebCell returnCellWith:tableView];
        [self configureWkWebCell:(WkWebCell *)cell atIndexPath:indexPath];
    } else if (indexPath.row == 5) {
        if (self.data.Arry_travelSharings.count) {
            cell = [shareCell returnCellWith:tableView];
            [self configureshareCell:(shareCell *)cell atIndexPath:indexPath];
        }else{
            cell = [shareNoArryCell returnCellWith:tableView];
            [self configureshareNoArryCell:(shareNoArryCell *)cell atIndexPath:indexPath];
        }
    }
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
    }
    return cell;
}


- (userAllCell *)userAllCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    userAllCell *cell = [userAllCell returnCellWith:tableView];
    [self configureuserAllCell:cell atIndexPath:indexPath];
    return  cell;
}
- (TravelitinerarySmallCell *)TravelitinerarySmallCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelitinerarySmallCell *cell = [TravelitinerarySmallCell returnCellWith:tableView];
    [self configureTravelitinerarySmallCell:cell atIndexPath:indexPath];
    return  cell;
}
- (WkWebCell *)WkWebCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WkWebCell *cell = [WkWebCell returnCellWith:tableView];
    [self configureWkWebCell:cell atIndexPath:indexPath];
    return  cell;
}
- (shareCell *)shareCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    shareCell *cell = [shareCell returnCellWith:tableView];
    [self configureshareCell:cell atIndexPath:indexPath];
    return  cell;
}

#pragma --mark<配置  shareCell cell >
- (void)configureshareNoArryCell:(shareNoArryCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.data = self.data;
}

- (void)configureshareCell:(shareCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.data = self.data;
    kWeakSelf(self);
    cell.lookSharedUrl = ^(travelSharingsS *data) {
        if (weakself.lookSharedUrl) {
            weakself.lookSharedUrl(data);
        }
    };
}
#pragma --mark<配置 WkWebCell  cell >
- (void)configureWkWebCell:(WkWebCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        cell.url = self.data.travelFeelsUrl;
        cell.titleStr = @"费用说明";
    }else if (indexPath.row == 4) {
        cell.titleStr = @"购买须知";
        cell.url = self.data.bookingNotesUrl;
    }
    kWeakSelf(self);
    cell.lookDetail = ^(NSURL *url,NSString *title) {
        if (weakself.lookDetail) {
            weakself.lookDetail(url,title);
        }
    };
}
#pragma --mark<配置 TravelitinerarySmallCell cell >
- (void)configureTravelitinerarySmallCell:(TravelitinerarySmallCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma --mark<配置  userAllCell cell >
- (void)configureuserAllCell:(userAllCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.arryA = self.data.travel.joinUsersA;
    kWeakSelf(self);
    cell.lookMore = ^{
        if (weakself.lookMore) {
            weakself.lookMore();
        }
    };
}
#pragma --mark<配置  titleSmallBasicCell cell >
- (void)configuretitleSmallBasicCell:(titleSmallBasicCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.data = self.data;
}

#pragma --mark<配置  HaveDiscountNoStage cell >
- (void)configureHaveDiscountNoStage:(HaveDiscountNoStage *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self configuretitleSmallBasicCell:cell atIndexPath:indexPath];
}

#pragma --mark<配置  NODiscountStage cell >
- (void)configureNODiscountStage:(NODiscountStage *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self configuretitleSmallBasicCell:cell atIndexPath:indexPath];
    kWeakSelf(self);
    cell.lookWebUrl = ^(NSURL *url) {
        if (weakself.lookWebUrl) {
            weakself.lookWebUrl(url);
        }
    };
}

#pragma --mark<配置  HaveDiscountStage cell >
- (void)configureHaveDiscountStage:(HaveDiscountStage *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self configureNODiscountStage:cell atIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSURL *url;
    if (indexPath.row == 2){
        if (self.lookTravelItinerary) {
            self.lookTravelItinerary();
        }
    }
//    else if (indexPath.row == 3) {
//        url = self.data.travelFeelsUrl;
//    } else if (indexPath.row == 4) {
//        url = self.data.bookingNotesUrl;
//    }
//    if (url && self.lookWebUrl) {
//        self.lookWebUrl(url);
//    }
}

- (void)setData:(tourDetaisData *)data{
    _data = data;
    [self.tableView reloadData];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
//    if (self.data) {
//        BottomDetailsTableViewFoot *foot = [[BottomDetailsTableViewFoot  alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
//        foot.btnClick = ^(BottomDetailsTableViewFoot_type type) {
//            if (self.btnClick) {
//                self.btnClick(type);
//            }
//            NSLog(@"type=%ld",(long)type);
//        };
//        foot.wanTogoIsenabel = self.data.Arry_initiateMonthPrice.count?YES:NO;
//        self.tableView.tableFooterView = foot;
//    }
}
@end
