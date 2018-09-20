//
//  myDevcKeep.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myDevcKeep.h"
#import "myDevcKeepCell.h"
#import "tourDetais.h"
@interface myDevcKeep ()
@property (nonatomic,strong) ShouCantravelsS *data;
@end

@implementation myDevcKeep

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.basicTableView registerClass:[myDevcKeepCell class] forCellReuseIdentifier:NSStringFromClass([myDevcKeepCell class])];
    self.title = @"我的收藏";
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deletedMyshoucanFunc:)
                                                 name:deletedMyshoucan
                                               object:nil];
    [self.header beginRefreshing];

}
#pragma -mark<收到了 取消收藏的通知>
- (void)deletedMyshoucanFunc:(NSNotification *)user{
    self.isNeedRefreth = YES;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isNeedRefreth) {
        self.basicTableView.mj_header.hidden = NO;
        [self.basicTableView.mj_header beginRefreshing];
    }
}
- (void)loadNewData{
    self.Pagenumber = Firstpage;
    kWeakSelf(self);
    [[ToolRequest sharedInstance]favoritelistWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.data = [ShouCantravelsS mj_objectWithKeyValues:dataDict];
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:weakself.data.totalPages];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}
- (void)loadMoreData{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]favoritelistWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
        ShouCantravelsS *data = [ShouCantravelsS mj_objectWithKeyValues:dataDict];
        [weakself.data.contentA addObjectsFromArray:data.contentA];
        [weakself loadMoreDataEndFootsuccessSet:nil totalPages:data.totalPages];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
    }];
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myDevcKeepCell class]) configuration:^(myDevcKeepCell *cell) {
        [weakself configuremyDevcKeepCell:cell atIndexPath:indexPath];
    }];
    return 0;
}
#pragma --mark< 配置cell 的数据>
- (void)configuremyDevcKeepCell:(myDevcKeepCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.oneone = self.data.contentA[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.contentA.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    tourDetais *tourdetai = [[tourDetais alloc]init];
    contentS *dataOne = self.data.contentA[indexPath.row];
    tourdetai.idd = dataOne.idd;
    [self.navigationController pushViewController:tourdetai animated:YES];
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myDevcKeepCell *cell = [myDevcKeepCell returnCellWith:tableView];
    [self configuremyDevcKeepCell:cell atIndexPath:indexPath];
    return  cell;
}
#pragma --mark< 编辑  cell >
-(NSArray *)tableView:(UITableView* )tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"取消收藏" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
        kWeakSelf(self);
        XAlertView *aleert = [[XAlertView alloc]initWithTitle:@"确定取消收藏?" message:nil clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
            if (!canceled) {
                contentS *dataOne = weakself.data.contentA[indexPath.row];
                [weakself delsetshouc:@[@(dataOne.idd)] :indexPath];
            }
        } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [aleert show];
    }];
    
    deleteRoWAction.backgroundColor = [UIColor redColor];//可以定义RowAction的颜色
    return @[deleteRoWAction];//最后返回这俩个RowAction 的数组
}
#pragma --mark< 是否可以编辑 cell >
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return  YES;
}
#pragma --mark< 取消收藏 cell >
- (void)delsetshouc:(NSArray *)arry :(NSIndexPath *)indexPath{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"取消收藏中..." toView:self.view];
    [[ToolRequest sharedInstance]favoritedeleteWithids:arry success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [weakself.data.contentA removeObjectAtIndex:indexPath.row];
        [weakself.basicTableView beginUpdates];
        [weakself.basicTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [weakself.basicTableView endUpdates];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
        
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}
@end
