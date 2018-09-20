//
//  heartCarId.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "heartCarId.h"
#import "heartCarIdCell.h"
#import "heartCarIdFoot.h"
#import "heartCarIdHead.h"
#import "togetherLYCell.h"
#import "tourDetais.h"
#import "NoneHeartCarIdHead.h"
#import "realNameAuthenticationVc.h"
#import "myStageVc.h"
//#define yijingkaitong    //TODO 去掉表示没有开通
#import "BindingResults.h"
#import "myStageVc.h"

#define YesHead  82

@interface heartCarId ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic,strong) myHeartHome *date;
@end

@implementation heartCarId

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUI];

//    self.title = @"旅行心愿卡";

}

- (void)setUI{
    [self setUitableViewstyle:UITableViewStyleGrouped];
    self.basicTableView.delegate = self;
    self.basicTableView.dataSource = self;
    self.basicTableView.emptyDataSetSource = self;
    self.basicTableView.emptyDataSetDelegate = self;
    [self.basicTableView registerClass:[heartCarIdCell class] forCellReuseIdentifier:NSStringFromClass([heartCarIdCell class])];
    [self.basicTableView registerClass:[togetherLYCell class] forCellReuseIdentifier:NSStringFromClass([togetherLYCell class])];
    // Do any additional setup after loading the view.
    [self MJRefreshHead];
}
#pragma -mark<MJ_head加载数据  头部>
- (void)MJRefreshHead{
    __weak typeof(self) weakSelf = self;
    //下拉刷新
    self.basicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //加载数据 
        [[ToolRequest sharedInstance]appuserwish_cardindexsuccess:^(id dataDict, NSString *msg, NSInteger code) {
            NSLog(@"df");
            weakSelf.date =[myHeartHome mj_objectWithKeyValues:dataDict];
            weakSelf.empty_type = succes_empty_num;
            [weakSelf.basicTableView.mj_header endRefreshing];
            weakSelf.basicTableView.mj_header.hidden = YES;
            [weakSelf.basicTableView reloadData];
        } failure:^(NSInteger errorCode, NSString *msg) {
            NSLog(@"df");
            weakSelf.empty_type = fail_empty_num;
            [weakSelf.basicTableView.mj_header endRefreshing];
            [weakSelf.basicTableView reloadData];
        }];
    }];
//    [tourInfo sharedInstance].UserInfo.isApprove = YES;   //TODO //test sanchu
    
    if ([tourInfo sharedInstance].UserInfo.isBindingBankCard && [tourInfo sharedInstance].UserInfo.isPeriodEnabled) { //实名了
        [self.basicTableView.mj_header beginRefreshing];
        self.basicTableView.contentInset = UIEdgeInsetsMake(0, 0, 15, 0);
    }else{
        self.empty_type = succes_empty_num;
        self.basicTableView.mj_header.hidden = YES;
    }
}


#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section == 0) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([heartCarIdCell class]) configuration:^(heartCarIdCell *cell) {
            [weakself configureheartCarIdCell:cell atIndexPath:indexPath];
        }];
    }else if (indexPath.section == 1){
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([togetherLYCell class]) configuration:^(togetherLYCell *cell) {
            [weakself configuretogetherLYCell:cell atIndexPath:indexPath];
        }];
    }
    return 0.01;
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configuretogetherLYCell:(togetherLYCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.dateHeart = self.date.travelsA[indexPath.row];
}

#pragma --mark< 配置cell 的数据>
- (void)configureheartCarIdCell:(heartCarIdCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        if (![tourInfo sharedInstance].UserInfo.isBindingBankCard || ![tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
            return NOneHead;
        }
    }else if (section == 1){
        return YesHead;
    }
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        if (![tourInfo sharedInstance].UserInfo.isBindingBankCard || ![tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
            return NOneFoot;
        }
    }
    return 0.001;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    } else if (section==1) {
        return self.date.travelsA.count;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.empty_type == succes_empty_num) {
        if ([tourInfo sharedInstance].UserInfo.isBindingBankCard && [tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
            return 2;
        }
        return 1;
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.empty_type == succes_empty_num) {
        if (section == 0) {
            if (![tourInfo sharedInstance].UserInfo.isBindingBankCard || ![tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
                NoneHeartCarIdHead *head = [NoneHeartCarIdHead new];
                return head;
            }
        }else if (section == 1){
            heartCarIdHead *head = [heartCarIdHead new];
            return head;
        }
    }
    return nil;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.empty_type == succes_empty_num) {
        if (section == 0) {
            if (![tourInfo sharedInstance].UserInfo.isBindingBankCard || ![tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
                heartCarIdFoot *foot = [heartCarIdFoot new];
                kWeakSelf(self);
                foot.btnClick = ^(){
                    if ([tourInfo sharedInstance].UserInfo.isBindingBankCard && ![tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
                        [weakself CheckIdentity];
                    } else if(![tourInfo sharedInstance].UserInfo.isBindingBankCard){
                        realNameAuthenticationVc *vc = [realNameAuthenticationVc new];
                        vc.AuthenticationSuccess = ^(){
                            [weakself popSelf];
                            myStageVc *vc = [myStageVc new];
                            [weakself.navigationController pushViewController:vc animated:YES];
                             
//                            if ([weakself.title rangeOfString:@"分期"].location != NSNotFound) { //应该是分期
//                                [weakself popSelf];
//                                myStageVc *vc = [myStageVc new];
//                                [weakself.navigationController pushViewController:vc animated:YES];
//                            } else {
//                                weakself.basicTableView.mj_header.hidden = NO;
//                                [weakself.basicTableView.mj_header beginRefreshing];
//                            }
                        };
                        vc.title = @"实名认证";
                        [weakself.navigationController pushViewController:vc animated:YES];
                    }
                    
                };
                return foot;
            }
        }
    }
    return nil;
}

- (void)CheckIdentity{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"申请中..." toView:self.view];
    [[ToolRequest sharedInstance]appuserapprovechecksuccess:^(id dataDict, NSString *msg, NSInteger code) {

        RiskVerification *date = [RiskVerification mj_objectWithKeyValues:dataDict];
        
        appS *userInfo = [tourInfo sharedInstance].UserInfo;
        userInfo.isPeriodEnabled = date.fright&&date.info&&date.risk;
        [tourInfo sharedInstance].UserInfo = userInfo;
        
        [MBProgressHUD hideHUDForView:weakself.view];
        BindingResults *view = [BindingResults new];
        view.endCountDown = ^(){
            if ([weakself.title isEqualToString:@"我的分期"]) {
                myStageVc *vc = [myStageVc new];
                [weakself.navigationController pushViewController:vc animated:YES];
                [vc removeViewController:[weakself class]];
            } else if ([weakself.title isEqualToString:@"旅行心愿卡"]) {
                weakself.basicTableView.mj_header.hidden = NO;
                [weakself.basicTableView.mj_header beginRefreshing];
            }
        };
        view.date = date;
        [view windosViewshow];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}


#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     if (indexPath.section == 1){
        tourDetais *tourdetai = [[tourDetais alloc]init];
        contentS *one = self.date.travelsA[indexPath.row];
        tourdetai.idd = one.idd;
        [self.navigationController pushViewController:tourdetai animated:YES];
    }
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        heartCarIdCell *cell = [heartCarIdCell returnCellWith:tableView];
        [self configureheartCarIdCell:cell atIndexPath:indexPath];
        return  cell;
    } else if (indexPath.section == 1) {
        togetherLYCell *cell = [togetherLYCell returnCellWith:tableView];
        [self configuretogetherLYCell:cell atIndexPath:indexPath];
        return  cell;
    }
    return nil;
}


#pragma --<空白页处理>

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:load_fail_image];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"服务器开小差了，刷新一下吧";
    
    NSDictionary *attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text;
    NSDictionary *attributes;
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
        text = @"点击重新加载";
        attributes = @{NSFontAttributeName: PingFangSC_Regular(17),
                       NSForegroundColorAttributeName: ColorWithHex(0x779CF4, 1.0),
                       NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

//按钮文本或者背景样式

//- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
//
//    return [[NSAttributedString alloc] initWithString:@"Continue 点击继续" attributes:attributes];
//}
//
//- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
//    return [UIImage imageNamed:@"123"];
//}

//空白页的背景色

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor clearColor];
}

//是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    if (self.empty_type != In_loading_empty_num) {
        return YES;
    }
    return NO;
}

//空白页点击事件
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
    self.basicTableView.mj_header.hidden = NO;
    [self.basicTableView.mj_header beginRefreshing];
}

//空白页按钮点击事件
//- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView {
//    self.tableView.mj_header.hidden = NO;
//    [self.tableView.mj_header beginRefreshing];
//}

@end
