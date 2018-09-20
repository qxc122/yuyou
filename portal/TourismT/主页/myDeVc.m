//
//  myDeVc.m
//  TourismT
//
//  Created by Store on 16/11/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "myDeVc.h"
#import "loginCell.h"
#import "logoutCell.h"
#import "ordermyDevcCell.h"
#import "oneForMyDeVcCell.h"
#import "myDevcKeep.h"
#import "popularTouer.h"
#import "followOrNO.h"
#import "myOrotherHome.h"
#import "myOreserFive.h"
#import "login.h"
#import "lookWkweb.h"
#import "UIView+BadgeValue.h"
#import "myCodeYHQ.h"
#import "myDeVcSehzhi.h"
#import "sysPhto.h"
#import "ChatViewController.h"
#import "MyStageCell.h"
#import "heartCarId.h"
#import "myCardBank.h"
#import "myStageVc.h"
#import "squaredpaperforpracticingcalligraphyCell.h"

@interface myDeVc ()
@property (nonatomic,strong) SelectOrder_date *dateSelectOrder;

@property (nonatomic,strong) NSArray *date9;

@property (nonatomic,strong) myAppInfoS *date;
//@property (nonatomic,strong) NSMutableArray *arryFour;
@property (nonatomic,weak) UIButton *btnNews;


@property (nonatomic,assign) NSInteger UnReadMessge; //客服未读消息
@end

@implementation myDeVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(LoginAndExitNoticeFuc:)
                                                 name:LoginAndExitNotice
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(MorepersonalinformationFuc:)
                                                 name:MorepersonalinformationNotice
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(MorepersonalinformationFuc:)
                                                 name:Repaymentsuccess
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(MorepersonalinformationFuc:)
                                                 name:Withholdingsuccess
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myselfGuanNumFuc:)
                                                 name:myselfGuanNum
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(editOrDeleShareFuc:)
                                                 name:editOrDeleShare
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(HyunreadCountKefuFuc:)
                                                 name:HyunreadCountKefu
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatPayStateCan:) name:wechatPayState object:nil];

//    self.arryFour = [NSMutableArray array];
//    NSDictionary *dic00 = @{
//                           imageStr:@"银行卡",
//                           desStr:@"我的银行卡",
//                           };
//    [self.arryFour addObject:dic00];
//    NSDictionary *dic0 = @{
//                          imageStr:@"礼券wode",
//                          desStr:@"专属礼券",
//                          };
//    [self.arryFour addObject:dic0];
//    NSDictionary *dic = @{
//                          imageStr:@"收藏MYYY",
//                          desStr:@"我的收藏",
//                          };
//    [self.arryFour addObject:dic];
//    NSDictionary *dicTwo = @{
//                          imageStr:@"个人信息MYYY",
//                          desStr:@"常用旅客",
//                          };
//    [self.arryFour addObject:dicTwo];
//    NSDictionary *dicThree = @{
//                          imageStr:@"客服MYYY",
//                          desStr:@"客服中心",
//                          };
//    [self.arryFour addObject:dicThree];
//    NSDictionary *dicFour = @{
//                          imageStr:@"设置MYYY",
//                          desStr:@"设置",
//                          };
//    [self.arryFour addObject:dicFour];
    [self setDa9];
    self.fd_prefersNavigationBarHidden = YES;
    [self setUI];
    // Do any additional setup after loading the view.

    //test
    //    self.price.text = @"￥5250";
    
    
}
#pragma  -mark<设置九宫格里面的数据>
- (void)setDa9{
    NSMutableArray *arr1 = [NSMutableArray array];
    NSMutableArray *arr2 = [NSMutableArray array];
    myhome *date1 = [myhome new];
    date1.titleStr = @"订单";
    date1.iconStr = @"订单";
    
    myhome *date2 = [myhome new];
    date2.titleStr = @"银行卡";
    date2.iconStr = @"银行卡3";
    
    myhome *date3 = [myhome new];
    date3.titleStr = @"专属礼券";
    date3.iconStr = @"礼券";
    
    myhome *date4 = [myhome new];
    date4.titleStr = @"收藏";
    date4.iconStr = @"收藏我的";
    
    myhome *date5 = [myhome new];
    date5.titleStr = @"常用旅客";
    date5.iconStr = @"常用旅客";
    
    myhome *date6 = [myhome new];
//    date6.titleStr = @"奖励邀请";
//    date6.iconStr = @"邀请";
//    date6.titleStr = @"";
//    date6.iconStr = @"";
    [arr1 addObject:date1];
    [arr1 addObject:date2];
    [arr1 addObject:date3];
    [arr1 addObject:date4];
    [arr1 addObject:date5];
    [arr1 addObject:date6];
    
    myhome *date21 = [myhome new];
    date21.titleStr = @"设置";
    date21.iconStr = @"设置";
    
    myhome *date22 = [myhome new];
    date22.titleStr = @"客服";
    date22.iconStr = @"客服我的";
    myhome *date23 = [myhome new];
    date23.titleStr = @"";
    date23.iconStr = @"";
    
    [arr2 addObject:date21];
    [arr2 addObject:date22];
    [arr2 addObject:date23];
    self.date9 = @[arr1,arr2];
}
#pragma  -mark<微信支付>
- (void)wechatPayStateCan:(NSNotification *)user{
    NSDictionary *dic = user.userInfo;
    NSString *code = dic[wechatPayState];
    if ([code intValue] == WXSuccess) {
        self.isNeedRefreth = YES;
    }
}
#pragma  -mark<可选择的订单列表>
- (void)LoadOrderList{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appv2usersharingselect_ordersuccess:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.dateSelectOrder = [SelectOrder_date mj_objectWithKeyValues:dataDict];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showError:msg toView:weakself.view];
    }];
}

#pragma --mark<客服  消息数量>
- (void)HyunreadCountKefuFuc:(NSNotification *)user{
    NSDictionary *dic = user.userInfo;
    NSString *messge = dic[HyunreadCountKefu];
    NSInteger UnReadMessge = [messge integerValue];
    if (UnReadMessge != self.UnReadMessge) {
        self.isNeedRefreth = YES;
    }
}

#pragma --mark<我的文章发生了变化>
- (void)editOrDeleShareFuc:(NSNotification *)user{
    self.isNeedRefreth = YES;
    
//    self.tableView.mj_header.hidden = NO;
//    [self.tableView.mj_header beginRefreshing];
}

#pragma --mark<我关注人数的变化 >
- (void)myselfGuanNumFuc:(NSNotification *)user{
    self.isNeedRefreth = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isNeedRefreth) {
        self.isNeedRefreth = NO;
        self.header.hidden = NO;
        [self.header beginRefreshing];
    }
}

#pragma --mark<更该个人信息 >
- (void)MorepersonalinformationFuc:(NSNotification *)user{
    self.date.avatar = [tourInfo sharedInstance].UserInfo.avatar;
    self.date.nickName = [tourInfo sharedInstance].UserInfo.nickName;
    [self.basicTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}
- (void)setUI{
    [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-HEIGHT_bottmo);
    }];

    [self.basicTableView registerClass:[loginCell class] forCellReuseIdentifier:NSStringFromClass([loginCell class])];
    [self.basicTableView registerClass:[logoutCell class] forCellReuseIdentifier:NSStringFromClass([logoutCell class])];
    [self.basicTableView registerClass:[ordermyDevcCell class] forCellReuseIdentifier:NSStringFromClass([ordermyDevcCell class])];
    [self.basicTableView registerClass:[oneForMyDeVcCell class] forCellReuseIdentifier:NSStringFromClass([oneForMyDeVcCell class])];
    [self.basicTableView registerClass:[MyStageCell class] forCellReuseIdentifier:NSStringFromClass([MyStageCell class])];
    [self.basicTableView registerClass:[squaredpaperforpracticingcalligraphyCell class] forCellReuseIdentifier:NSStringFromClass([squaredpaperforpracticingcalligraphyCell class])];
    
//    UIButton *btnNews = [[UIButton alloc]init];
//    self.btnNews = btnNews;
//    [btnNews setImage:ImageNamed(@"消息") forState:UIControlStateNormal];
//    [self.view addSubview:btnNews];
//    [btnNews addTarget:self action:@selector(btnNewsClick:) forControlEvents:UIControlEventTouchUpInside];
//    [btnNews mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.view).offset(-3);
//        make.top.equalTo(self.view).offset(20);
//        make.width.equalTo(@(44));
//        make.height.equalTo(@(44));
//    }];
    if ([[tourHelper sharedInstance]judgeisLogin]) {//登录
        [self.header beginRefreshing];
    }else{
        self.empty_typeV2 = succes_empty_numV2;
        [self.basicTableView reloadData];
    }
}
#pragma --mark<登录退出的通知>
- (void)LoginAndExitNoticeFuc:(NSNotification *)user{
    appS *decodedBag = [tourInfo sharedInstance].UserInfo;
    if (decodedBag) {
        self.isNeedRefreth = YES;
    } else {   //退出了
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.btnNews hideRedPoint];
        self.date =nil;
        [self.basicTableView reloadData];
    }
}

//#pragma -mark<点击了消息按钮>
//- (void)btnNewsClick:(UIButton *)btn{
//    appS *decodedBag = [tourInfo sharedInstance].UserInfo;
//    if (decodedBag) {//登录
//        [self.btnNews hideRedPoint];
//        yuyouNotication *vc = [[yuyouNotication alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
//    }else{
//        [self openLoginVc:YES];
//    }
//    NSLog(@"%s",__func__);
//}

- (void)loadNewData{
    //下拉刷新
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appuserindexWithsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.date = [myAppInfoS mj_objectWithKeyValues:dataDict];
        if ([weakself.date.messageCount integerValue]) {
            [weakself.btnNews showRedAtOffSetX:-10 AndOffSetY:-6+10 viewWidth:6];
        } else {
            [weakself.btnNews hideRedPoint];
        }
        weakself.isNeedRefreth = NO;
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself  loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            appS *decodedBag = [tourInfo sharedInstance].UserInfo;
            if (!decodedBag) {//未登录
                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([logoutCell class]) configuration:^(logoutCell *cell) {
                    [weakself configurelogoutCell:cell atIndexPath:indexPath];
                }];
            }else{
                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([loginCell class]) configuration:^(loginCell *cell) {
                    [self configureloginCell:cell atIndexPath:indexPath];
                }];
            }
        }  else if (indexPath.row == 1){
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([MyStageCell class]) configuration:^(MyStageCell *cell) {
                [weakself configureMyStageCell:cell atIndexPath:indexPath];
            }];
        }else{
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([squaredpaperforpracticingcalligraphyCell class]) configuration:^(squaredpaperforpracticingcalligraphyCell *cell) {
                [weakself configuresquaredpaperforpracticingcalligraphyCell:cell atIndexPath:indexPath];
            }];
//            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([ordermyDevcCell class]) configuration:^(ordermyDevcCell *cell) {
//                [weakself configureordermyDevcCell:cell atIndexPath:indexPath];
//            }];
        }
    }
    /*
    else if (indexPath.section == 1){
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([oneForMyDeVcCell class]) configuration:^(oneForMyDeVcCell *cell) {
            [weakself configureoneForMyDeVcCell:cell atIndexPath:indexPath];
        }];
    }
     */
    return 0.01;
}

#pragma --mark<配置 九宫格cell>
- (void)configuresquaredpaperforpracticingcalligraphyCell:(squaredpaperforpracticingcalligraphyCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date9;
    kWeakSelf(self);
    cell.shareORkeep = ^(NSIndexPath *indexPath){
        NSArray *tmp = weakself.date9[indexPath.section];
        myhome *date = tmp[indexPath.row];
        if (date.titleStr && date.titleStr.length) {
            if ([date.titleStr isEqualToString:@"设置"]) {
                myDeVcSehzhi *vc = [[myDeVcSehzhi alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }else{
                if ([[tourHelper sharedInstance]judgeisLogin]) {
                    if ([date.titleStr isEqualToString:@"收藏"]) {
                        myDevcKeep *vc = [[myDevcKeep alloc]init];
                        [self.navigationController pushViewController:vc animated:YES];
                    }else if ([date.titleStr isEqualToString:@"常用旅客"]){
                        popularTouer *vc = [[popularTouer alloc]init];
                        vc.isDebtn = YES;
                        [self.navigationController pushViewController:vc animated:YES];
                    }else if ([date.titleStr isEqualToString:@"专属礼券"]){
                        self.date.couponCount=0;
                        [self.basicTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                        myCodeYHQ *vc = [[myCodeYHQ alloc]init];
                        [self.navigationController pushViewController:vc animated:YES];
                    }else if ([date.titleStr isEqualToString:@"客服"]){
                        ChatViewController *chatController = [[ChatViewController alloc]
                                                              initWithConversationChatter:kefu_head_emoid conversationType:EMConversationTypeChat];
                        chatController.title = kefu_name_emoid;
                        chatController.hidesBottomBarWhenPushed = YES;
                        [self.navigationController pushViewController:chatController animated:YES];
                    }else if ([date.titleStr isEqualToString:@"银行卡"]){
                        myCardBank *vc = [[myCardBank alloc]init];
                        [self.navigationController pushViewController:vc animated:YES];
                    }else if ([date.titleStr isEqualToString:@"订单"]){
                        myOreserFive *vc = [[myOreserFive alloc]init];
                        [self.navigationController pushViewController:vc animated:YES];
                    }else if ([date.titleStr isEqualToString:@"奖励邀请"]){
                        [MBProgressHUD showPrompt:@"敬请期待" toView:self.view];
                    }
                }else{
                    [self openLoginVc:YES];
                }
            }
        }
    };
}

#pragma --mark<配置 我的分期 cell>
- (void)configureMyStageCell:(MyStageCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date;
}

#pragma --mark<配置登录后 第一个cell>
- (void)configurelogoutCell:(logoutCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.toGologinbtnClick = ^(){
        [weakself openLoginVc:NO];
    };
}

- (void)OpenmyOrotherHomeVc{
    myOrotherHome *vc = [[myOrotherHome alloc]init];
    //            vc.btnClick = ^(UserS *decodedBag){
    //                weakself.date.avatar =  decodedBag.avatar;
    //                weakself.date.nickName =  decodedBag.nickName;
    //                NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    //                [weakself.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
    //            };
    appS *peodata = [tourInfo sharedInstance].UserInfo;
    vc.idd = peodata.idd;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)configureloginCell:(loginCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.date = self.date;
    cell.btnClick = ^(loginCell_btnEnum type,NSInteger index){
        if (type == icon_loginCell_btnEnum) {
            [weakself OpenmyOrotherHomeVc];
        } else if (type == guanzhu_loginCell_btnEnum || type == beiguanzhu_loginCell_btnEnum) {
            followOrNO *vc = [[followOrNO alloc]init];
            if (type == guanzhu_loginCell_btnEnum) {
                vc.title = @"关注";
                vc.isGuangzhu = YES;
            } else if(type == beiguanzhu_loginCell_btnEnum){
                vc.title = @"被关注";
            }
            [weakself.navigationController pushViewController:vc animated:YES];
        } else if (type == fabu_loginCell_btnEnum) {
            NSLog(@"点击了发布");
            sysPhto *sysphto = [[sysPhto alloc]init];
            sysphto.dateSelectOrder = self.dateSelectOrder;
            [weakself.navigationController pushViewController:sysphto animated:YES];

        } else if (type == index_loginCell_btnEnum) {
            if (index < self.date.sharingsA.count) {
                NSLog(@"点击了照片%ld",index);
                lookWkweb *vc = [[lookWkweb alloc]init];
                vc.dateOne = weakself.date.sharingsA[index];
                vc.IsHaveshareBtn = YES;
                vc.IsdemeiPan = NO;
                vc.IsxiangshiOKbtn = YES;
                //            vc.orderId  =self.oneData.idd;  待加上订单id
                [weakself.navigationController pushViewController:vc animated:YES];
            } else {
                //
//                NSLog(@"待加上查看全部");
                [weakself OpenmyOrotherHomeVc];
            }
        } else if (type == card_wishcard_btnEnum) {
            if ([[tourHelper sharedInstance]judgeisLogin]) {
                [weakself OpenMyStaue:indexPath];
            } else {
                //去登录
                [weakself openLoginVc:YES];
            }
            
//            heartCarId *vc = [[heartCarId alloc]init];
//            vc.title = @"旅行心愿卡";
//            [self.navigationController pushViewController:vc animated:YES];
        }
    };
}
- (void)configureordermyDevcCell:(ordermyDevcCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.date = self.date;
    cell.btnClick = ^(ordermyDevcCell_btnEnum index){
        appS *decodedBag = [tourInfo sharedInstance].UserInfo;
        if (decodedBag) {//登录
//            BOOL isRefreTabview = NO;
            NSLog(@"weakself.date.orderCountD.unPaidCount=%ld",weakself.date.orderCountD.unPaidCount);
            if (index == one_ordermyDevcCell_btnEnum && weakself.date.orderCountD.unPaidCount ) {
                weakself.date.orderCountD.unPaidCount = 0;
//                isRefreTabview = YES;
            } else if (index == two_ordermyDevcCell_btnEnum && weakself.date.orderCountD.unTripCount ) {
//                isRefreTabview = YES;
                weakself.date.orderCountD.unTripCount = 0;
            } else if (index == three_ordermyDevcCell_btnEnum && weakself.date.orderCountD.unCommentCount ) {
//                isRefreTabview = YES;
                weakself.date.orderCountD.unCommentCount = 0;
            } else if (index == four_ordermyDevcCell_btnEnum && weakself.date.orderCountD.refundCancelCount ) {
//                isRefreTabview = YES;
                weakself.date.orderCountD.refundCancelCount = 0;
            }
//            if (isRefreTabview) {
//                NSIndexPath *path = [NSIndexPath indexPathForRow:1 inSection:0];
//                [weakself.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
//            }
            
            myOreserFive *vc = [[myOreserFive alloc]init];
            kWeakSelf(self);
            vc.lookType = ^(myOreserFive_type type) {
                BOOL isRefreTabview = NO;
                if (type == one_myOreserFive_type && weakself.date.orderCountD.unPaidCount ) {
                    weakself.date.orderCountD.unPaidCount = 0;
                    isRefreTabview = YES;
                } else if (type == two_myOreserFive_type && weakself.date.orderCountD.unTripCount ) {
                    isRefreTabview = YES;
                    weakself.date.orderCountD.unTripCount = 0;
                } else if (type == three_myOreserFive_type && weakself.date.orderCountD.unCommentCount ) {
                    isRefreTabview = YES;
                    weakself.date.orderCountD.unCommentCount = 0;
                } else if (type == four_myOreserFive_type && weakself.date.orderCountD.refundCancelCount ) {
                    isRefreTabview = YES;
                    weakself.date.orderCountD.refundCancelCount = 0;
                }
                if (isRefreTabview) {
                    [weakself.basicTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                }
            };
            vc.index = index;
            [weakself.navigationController pushViewController:vc animated:YES];
        }else{
            [weakself openLoginVc:YES];
        }
    };
}
//#pragma -mark<配置 最下面几个cell  我的客服  我的收藏>
//- (void)configureoneForMyDeVcCell:(oneForMyDeVcCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary *dic = self.arryFour[indexPath.row];
//    NSString *desStrs = dic[desStr];
//    if ([desStrs isEqualToString:@"专属礼券"]) {
//        cell.couponCount =self.date.couponCount;
//    }else if ([desStrs isEqualToString:kefu_name_emoid]){
//        cell.couponCount = self.UnReadMessge;
//    }else{
//        cell.couponCount =0;
//    }
//    cell.dic = dic;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else if (section == 1){
//        return self.arryFour.count;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.empty_typeV2== succes_empty_numV2) {
        return 1;
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (void)openLoginVc:(BOOL)tishi{
    if (tishi) {
        [MBProgressHUD showPrompt:@"请先登录"];
    }
    login *losgin = [[login alloc]init];
    UINavigationController *nnvc = [[UINavigationController alloc]initWithRootViewController:losgin];;
    [self presentViewController:nnvc animated:YES completion:nil];
}
#pragma --mark< 打开我的分期 >
- (void)OpenMyStaue:(NSIndexPath *)indexPath{
    if ([tourInfo sharedInstance].UserInfo.isBindingBankCard && [tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
        myStageVc *vc = [myStageVc new];
//        kWeakSelf(self);
//        vc.huanSucces = ^(){ //刷新我的分期 cell
//            weakself.date.periodInfo.remainDays = [NSNumber numberWithInteger:0];
//            weakself.date.periodInfo.periodRepaymentSum = @"0.00";
//            weakself.date.periodInfo.count = [NSNumber numberWithInteger:0];
//            [weakself.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//        };
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        heartCarId *vc = [heartCarId new];
        vc.title = @"我的分期";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            if ([[tourHelper sharedInstance]judgeisLogin]) {
                [self OpenMyStaue:indexPath];
            } else {
                //去登录
                [self openLoginVc:YES];
            }
        }
    }
    /*
    else if (indexPath.section == 1){
        NSDictionary *dic = self.arryFour[indexPath.row];
        if ([dic[desStr] isEqualToString:@"设置"]) {
            myDeVcSehzhi *vc = [[myDeVcSehzhi alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            if ([[tourHelper sharedInstance]judgeisLogin]) {
                if ([dic[desStr] isEqualToString:@"我的收藏"]) {
                    myDevcKeep *vc = [[myDevcKeep alloc]init];
                    [self.navigationController pushViewController:vc animated:YES];
                }else if ([dic[desStr] isEqualToString:@"常用旅客"]){
                    popularTouer *vc = [[popularTouer alloc]init];
                    vc.isDebtn = YES;
                    [self.navigationController pushViewController:vc animated:YES];
                }else if ([dic[desStr] isEqualToString:@"专属礼券"]){
                    self.date.couponCount=0;
                    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                    myCodeYHQ *vc = [[myCodeYHQ alloc]init];
                    [self.navigationController pushViewController:vc animated:YES];
                }else if ([dic[desStr] isEqualToString:@"客服中心"]){
                    ChatViewController *chatController = [[ChatViewController alloc]
                                                          initWithConversationChatter:kefu_head_emoid conversationType:EMConversationTypeChat];
                    chatController.title = kefu_name_emoid;
                    [self.navigationController pushViewController:chatController animated:YES];
                }else if ([dic[desStr] isEqualToString:@"我的银行卡"]){
                    myCardBank *vc = [[myCardBank alloc]init];
                    [self.navigationController pushViewController:vc animated:YES];
                }
            }else{
                [self openLoginVc:YES];
            }
        }
    }
     */
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            appS *decodedBag = [tourInfo sharedInstance].UserInfo;
            if (!decodedBag) {//未登录
                logoutCell *cell = [logoutCell returnCellWith:tableView];
                [self configurelogoutCell:cell atIndexPath:indexPath];
                return  cell;
            }else{
                loginCell *cell = [loginCell returnCellWith:tableView];
                [self configureloginCell:cell atIndexPath:indexPath];
                return  cell;
            }
        } else if (indexPath.row == 1){
            MyStageCell *cell = [MyStageCell returnCellWith:tableView];
            [self configureMyStageCell:cell atIndexPath:indexPath];
            return  cell;
        } else{
            squaredpaperforpracticingcalligraphyCell *cell = [squaredpaperforpracticingcalligraphyCell returnCellWith:tableView];
            [self configuresquaredpaperforpracticingcalligraphyCell:cell atIndexPath:indexPath];
            return  cell;
//            ordermyDevcCell *cell = [ordermyDevcCell returnCellWith:tableView];
//            [self configureordermyDevcCell:cell atIndexPath:indexPath];
//            return  cell;
        }
    }
    /*
    else if (indexPath.section == 1){
        oneForMyDeVcCell *cell = [oneForMyDeVcCell returnCellWith:tableView];
        [self configureoneForMyDeVcCell:cell atIndexPath:indexPath];
        return  cell;
    }
     */
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)customBackButton{}
- (void)hideBottomBarWhenPush{}
@end
