//
//  draft.m
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "draft.h"
#import "NSString+check.h"
#import "emptyMyOrOtherCell.h"
#import "AlbummyOrtherHomeCell.h"
#import "meiPanFootTool.h"
#import "delAlbummyOrtherHomeCell.h"
@interface draft ()
@property (nonatomic,weak) meiPanFootTool *tool;
@property (nonatomic,weak) UIButton *edit;

@property (nonatomic,strong) NSMutableArray *delArry; //将要删除的 cell
@end


@implementation draft
-(void)renderUIWithInfo:(NSDictionary *)info{
    [super renderUIWithInfo:info];
//    self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 50, 0);
    self.delArry = [NSMutableArray array];
    meiPanFootTool *tool = [meiPanFootTool new];
    tool.backgroundColor = [UIColor whiteColor];
    self.tool = tool;
//    self.tool.hidden = YES;
    [self addSubview:tool];
    tool.isCaogao = YES;
    kWeakSelf(self);
    tool.meiPanFootToolClick = ^(collection_ENMU ClickType){
        if (ClickType == caogao_meiPanFootTool) { //删除
            if (weakself.delArry.count) {
                [MBProgressHUD showLoadingMessage:@"删除中..."];
                kWeakSelf(self)
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    NSFileManager *defauleManager = [NSFileManager defaultManager];
                    for (NSString *pathH in weakself.delArry) {
                            [defauleManager removeItemAtPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:[pathH stringByReplacingOccurrencesOfString:DraftCover withString:DraftDetails]] error:nil];
                            [defauleManager removeItemAtPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:pathH] error:nil];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        weakself.edit.hidden = NO;
                        [weakself.tableView reloadData];
                        [weakself.delArry removeAllObjects];
                        [MBProgressHUD hideHUD];
                        [MBProgressHUD showSuccess:@"删除成功"];
                        NSNotification *notification =[NSNotification notificationWithName:The_draft_box_has_been_updated object:nil userInfo:nil];
                        [[NSNotificationCenter defaultCenter] postNotification:notification];
                    });
                });
            } else {
                [MBProgressHUD showError:@"请先勾选要删除的草稿"];
            }
        } else if (ClickType == fabu_meiPanFootTool){ //取消了
            self.edit.hidden = NO;
            [self.tableView reloadData];
//            self.tool.hidden = YES;
        }
    };
    [tool mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@50);
    }];
    
    UIButton *edit = [UIButton new];
    edit.backgroundColor = [UIColor whiteColor];
    [self addSubview:edit];
    self.edit = edit;
    [edit setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateNormal];
    [edit setTitle:@"编辑" forState:UIControlStateNormal];
    edit.titleLabel.font = PingFangSC_Regular(17);
    [edit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@49);
    }];
    [edit addTarget:self action:@selector(editClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)editClick{
    self.edit.hidden = YES;
    [self.tableView reloadData];
//    self.tool.hidden = NO;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arry.count?self.arry.count:1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.arry.count) {
        if (indexPath.row == 0) {
            return 120*HEIGHTICON+15+15;
        }else if (((self.arry.count-1) == indexPath.row)?YES:NO){
            return 120*HEIGHTICON+15+50;
        }
        return 120*HEIGHTICON+15;
    }
    return CGRectGetHeight(self.frame);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.arry.count) {
        if (self.edit.hidden) {
            delAlbummyOrtherHomeCell *cell = [delAlbummyOrtherHomeCell returnCellWith:tableView];
            [self configuredelAlbummyOrtherHomeCell:cell atIndexPath:indexPath];
            return  cell;
        } else {
            AlbummyOrtherHomeCell *cell = [AlbummyOrtherHomeCell returnCellWith:tableView];
            [self configureAlbummyOrtherHomeCell:cell atIndexPath:indexPath];
            return  cell;
        }

    }
    emptyMyOrOtherCell *cell = [emptyMyOrOtherCell returnCellWith:tableView];
    [self configureemptyMyOrOtherCell:cell atIndexPath:indexPath];
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.EditDraft) {
        self.EditDraft(self.arry[indexPath.row]);
    }
}

#pragma --mark<配置  别人发布的游记 可以删除 cell >
- (void)configuredelAlbummyOrtherHomeCell:(delAlbummyOrtherHomeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.indexPath = indexPath;
    if (indexPath.row != 0) {
        cell.TheLastOne = ((self.arry.count-1) == indexPath.row)?YES:NO;
    }
    cell.data = self.arry[indexPath.row];
    cell.isSelect = [self.delArry containsObject:cell.data];
    cell.delDraft = ^(NSString *mydraftPath){
        if ([self.delArry containsObject:mydraftPath]) {
            [self.delArry removeObject:mydraftPath];
        } else {
            [self.delArry addObject:mydraftPath];
        }
    };
}
#pragma --mark<配置  别人发布的游记 cell >
- (void)configureAlbummyOrtherHomeCell:(AlbummyOrtherHomeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.indexPath = indexPath;
    if (indexPath.row != 0) {
        cell.TheLastOne = ((self.arry.count-1) == indexPath.row)?YES:NO;
    }
    cell.data = self.arry[indexPath.row];
}
#pragma --mark<配置  configureemptyMyOrOtherCell cell >
- (void)configureemptyMyOrOtherCell:(emptyMyOrOtherCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.desStr =@"暂无草稿";
}

//
//#pragma --mark<配置  删除>
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
////下面这个方法就是我们实现以上效果的核心
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath* )indexPath
//{
//    return UITableViewCellEditingStyleDelete;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//    }
//}
//
//-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        
//        
//        
//        
//    }];
//    
//    
//    //    rowActionSec.backgroundColor = [UIColor colorWithHexString:@"f38202"];
//    
//    rowAction.backgroundColor = [UIColor purpleColor];
//    
//    
//    UITableViewRowAction *rowaction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        
//        
//        
//    }];
//    rowaction.backgroundColor = [UIColor grayColor];
//    NSArray *arr = @[rowAction,rowaction];
//    return arr;
//}
- (void)setArry:(NSMutableArray *)arry{
    if (arry) {
        _arry = arry;
        [self.tableView reloadData];
        if (arry.count) {
            self.tool.hidden = NO;
            self.edit.hidden = NO;
        } else {
            self.tool.hidden = YES;
            self.edit.hidden = YES;
        }
    }
}

@end
