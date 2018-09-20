//
//  followOrNO.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "followOrNO.h"
#import "followOrNOCell.h"
#import "myOrotherHome.h"
@interface followOrNO ()
@property (nonatomic,strong) guanzhuAndBeisS *datess;
@end


@implementation followOrNO

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.basicTableView registerClass:[followOrNOCell class] forCellReuseIdentifier:NSStringFromClass([followOrNOCell class])];
    [self.header beginRefreshing];
}

- (void)loadNewData{
    self.Pagenumber = Firstpage;
    if (self.isGuangzhu) {
        kWeakSelf(self);
        [[ToolRequest sharedInstance]followfollows_listWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.datess = [guanzhuAndBeisS mj_objectWithKeyValues:dataDict];
            [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:weakself.datess.totalPages];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
        }];
    } else {
        kWeakSelf(self);
        [[ToolRequest sharedInstance]followfollowers_listWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.datess = [guanzhuAndBeisS mj_objectWithKeyValues:dataDict];
            [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:weakself.datess.totalPages];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
        }];
    }
}

- (void)loadMoreData{
    if (self.isGuangzhu) {
        kWeakSelf(self);
        [[ToolRequest sharedInstance]followfollows_listWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
            guanzhuAndBeisS *datess = [guanzhuAndBeisS mj_objectWithKeyValues:dataDict];
            [weakself.datess.contentA addObject:datess.contentA];
            [weakself loadMoreDataEndFootsuccessSet:nil totalPages:weakself.datess.totalPages];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
        }];
    } else {
        kWeakSelf(self);
        [[ToolRequest sharedInstance]followfollowers_listWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
            guanzhuAndBeisS *datess = [guanzhuAndBeisS mj_objectWithKeyValues:dataDict];
            [weakself.datess.contentA addObject:datess.contentA];
            [weakself loadMoreDataEndFootsuccessSet:nil totalPages:weakself.datess.totalPages];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
        }];
    }
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([followOrNOCell class]) configuration:^(followOrNOCell *cell) {
        [weakself configurefollowOrNOCell:cell atIndexPath:indexPath];
    }];
    return 0;
}
#pragma -mark<配置 cell>
- (void)configurefollowOrNOCell:(followOrNOCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.isGuangzhu = self.isGuangzhu;
    cell.oneoe = self.datess.contentA[indexPath.row];
    if (!self.isGuangzhu) {
        kWeakSelf(self);
        cell.YESorNOClick = ^(NSInteger index,BOOL isGuangzhu){
            [weakself deletMyfengsiindexpath:indexPath];
        };
        cell.index = indexPath.row;
    }
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    myOrotherHome *homePeo  =[myOrotherHome new];
    UserS *oneoe = self.datess.contentA[indexPath.row];
    homePeo.idd = oneoe.idd;
    [self.navigationController pushViewController:homePeo animated:YES];
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{    followOrNOCell *cell = [followOrNOCell returnCellWith:tableView];
    [self configurefollowOrNOCell:cell atIndexPath:indexPath];
    return  cell;
}
#pragma --mark< 编辑  cell >
-(NSArray *)tableView:(UITableView* )tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"取消关注" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
            kWeakSelf(self);
            XAlertView *aleert = [[XAlertView alloc]initWithTitle:@"确定不在关注此人?" message:nil clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
                if (!canceled) {
                    [weakself deletMyfengsiindexpath:indexPath];
                }
            } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [aleert show];
        }];//
        
        deleteRoWAction.backgroundColor = [UIColor redColor];//可以定义RowAction的颜色
        return @[deleteRoWAction];//最后返回这俩个RowAction 的数组
}
#pragma --mark< 是否可以编辑 cell >
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return  self.isGuangzhu;
}
- (void)deletMyfengsiindexpath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
//    [MBProgressHUD showLoadingMessage:@"操作中..." toView:self.view];
    UserS *oneoe = self.datess.contentA[indexPath.row];
    [[ToolRequest sharedInstance]followupdateWithtravelId:oneoe.idd success:^(id dataDict, NSString *msg, NSInteger code) {
        if (weakself.isGuangzhu) {
            [weakself.datess.contentA removeObjectAtIndex:indexPath.row];
            [weakself.basicTableView beginUpdates];
            [weakself.basicTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            [weakself.basicTableView endUpdates];
        }
        [MBProgressHUD showPrompt:msg toView:weakself.view];
        //发通知  告诉上一级页面 我的关注人数
//        NSDictionary *dictTmp = @{myselfGuanNum:[NSString stringWithFormat:@"%ld",self.datess.contentA.count],};
        NSNotification *notification =[NSNotification notificationWithName:myselfGuanNum object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];

    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg toView:weakself.view];
        [weakself.basicTableView reloadData];
    }];
}
@end
