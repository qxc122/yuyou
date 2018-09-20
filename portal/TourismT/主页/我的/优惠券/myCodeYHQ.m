//
//  myCodeYHQ.m
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myCodeYHQ.h"
#import "myCodeCell.h"
#import "myCodeAddCell.h"
#import "emptyCell.h"
@interface myCodeYHQ ()
@property (nonatomic,strong) YHQS *YHQSDate;

@property (nonatomic,assign) CGFloat addHeight;

@end

@implementation myCodeYHQ

- (void)viewDidLoad {
    [super viewDidLoad];
    self.basicTableView.backgroundColor = ColorWithHex(0xf8f8f8, 1.0);
    [self.basicTableView registerClass:[myCodeCell class] forCellReuseIdentifier:NSStringFromClass([myCodeCell class])];
    [self.basicTableView registerClass:[myCodeAddCell class] forCellReuseIdentifier:NSStringFromClass([myCodeAddCell class])];
    [self.basicTableView registerClass:[emptyCell class] forCellReuseIdentifier:NSStringFromClass([emptyCell class])];
    self.title = @"专属礼券";
    [self.header beginRefreshing];
}
- (void)loadNewData{
    self.Pagenumber = Firstpage;
    kWeakSelf(self);
    if (!self.travelId) {
        [[ToolRequest sharedInstance]appusercouponcodeListWithPageNumber:self.Pagenumber PageSize:self.Pagesize status:self.status success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.YHQSDate = [YHQS mj_objectWithKeyValues:dataDict];
            [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:weakself.YHQSDate.totalPages];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
        }];
    } else {
        [[ToolRequest sharedInstance]appusercouponcode_selectWithPageNumber:self.Pagenumber PageSize:self.Pagesize orderSn:self.orderSn travelId:self.travelId success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.YHQSDate = [YHQS mj_objectWithKeyValues:dataDict];
            [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:weakself.YHQSDate.totalPages];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
        }];
    }
}

- (void)loadMoreData{
    kWeakSelf(self);
    if (!self.travelId) {
        [[ToolRequest sharedInstance]appusercouponcodeListWithPageNumber:self.Pagenumber PageSize:self.Pagesize status:self.status success:^(id dataDict, NSString *msg, NSInteger code) {
            YHQS *YHQSDate = [YHQS mj_objectWithKeyValues:dataDict];
            [weakself.YHQSDate.contentA addObjectsFromArray:YHQSDate.contentA];
            [weakself loadMoreDataEndFootsuccessSet:nil totalPages:weakself.YHQSDate.totalPages];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
        }];
    } else {
        [[ToolRequest sharedInstance]appusercouponcode_selectWithPageNumber:self.Pagenumber PageSize:self.Pagesize orderSn:self.orderSn travelId:self.travelId success:^(id dataDict, NSString *msg, NSInteger code) {
            YHQS *YHQSDate = [YHQS mj_objectWithKeyValues:dataDict];
            [weakself.YHQSDate.contentA addObjectsFromArray:YHQSDate.contentA];
            [weakself loadMoreDataEndFootsuccessSet:nil totalPages:weakself.YHQSDate.totalPages];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
        }];
    }
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section == 0) {
        CGFloat tmp =  [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myCodeAddCell class]) configuration:^(myCodeAddCell *cell) {
            [weakself configuremyCodeAddCell:cell atIndexPath:indexPath];
        }];
        self.addHeight = tmp;
        return tmp;
    } else if (indexPath.section == 1){
        if (self.YHQSDate.contentA.count) {
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myCodeCell class]) configuration:^(myCodeCell *cell) {
                [weakself configuremyCodeCell:cell atIndexPath:indexPath];
            }];
        }else{
            if (ScreenHeight==812){
                return ScreenHeight - self.addHeight - HEIGHT_NavbarX;
            }else{
                
                return ScreenHeight - self.addHeight - HEIGHT_Navbar;
            }
//            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([emptyCell class]) configuration:^(emptyCell *cell) {
//                [weakself configureemptyCell:cell atIndexPath:indexPath];
//            }];
        }
    }
    return 0;
}
#pragma --mark<配置登录后 第一个cell>
- (void)configuremyCodeAddCell:(myCodeAddCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.btnClick= ^(NSString *code){
        if (!code && !code.length) {
            [MBProgressHUD showPrompt:@"请输入兑换码" toView:weakself.view];
        }
        [MBProgressHUD showLoadingMessage:@"兑换中..." toView:weakself.view];
        [[ToolRequest sharedInstance]appusercouponexchangeWithpassword:code success:^(id dataDict, NSString *msg, NSInteger code) {
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
            if (code != kRespondCodeWaring) {
                [weakself.basicTableView.mj_header beginRefreshing];
            }
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
        }];
    };
}
- (void)configuremyCodeCell:(myCodeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.YHQSoneDate = self.YHQSDate.contentA[indexPath.row];
}
#pragma -mark<配置空的  cell>
- (void)configureemptyCell:(emptyCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.desStr  =@"亲，暂无优惠券哦";
    cell.imageStr  =None_data_place_Pic;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        if (self.YHQSDate.contentA.count) {
            return self.YHQSDate.contentA.count;
        }else {
            return 1;
        }
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.empty_typeV2 == succes_empty_numV2) {
        return 2;
    }
    return 0;
}

#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        if (self.YHQSDate.contentA.count) {
            YHQoneS *YHQSoneDate = self.YHQSDate.contentA[indexPath.row];
            if (self.btnClick) {
                if ([YHQSoneDate.status isEqualToString:Staueusable_youhuiquan_saues]) {
                    self.btnClick(self.YHQSDate.contentA[indexPath.row]);
                    [self popSelf];
                    
                }else{
                    [MBProgressHUD showPrompt:@"您暂不能选择该优惠券" toView:self.view];
                }
            }
        }
    }
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        myCodeAddCell *cell = [myCodeAddCell returnCellWith:tableView];
        [self configuremyCodeAddCell:cell atIndexPath:indexPath];
        return  cell;
    } else if (indexPath.section == 1){
        if (self.YHQSDate.contentA.count) {
            myCodeCell *cell = [myCodeCell returnCellWith:tableView];
            [self configuremyCodeCell:cell atIndexPath:indexPath];
            return  cell;
        }else{
            emptyCell *cell = [emptyCell returnCellWith:tableView];
            [self configureemptyCell:cell atIndexPath:indexPath];
            return  cell;
        }
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cceell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cceell"];
        }
        return cell;
    }
    return nil;
}
- (NSString *)status{
    if (!_status) {
        _status = all_youhuiquan_saues;
    }
    return _status;
}
@end
