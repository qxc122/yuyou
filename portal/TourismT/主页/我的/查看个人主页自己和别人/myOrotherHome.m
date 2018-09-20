//
//  myOrotherHome.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOrotherHome.h"
#import "homeForMySelf.h"
#import "followOrNO.h"
#import "eidtMyInfo.h"
#import "togetherLY.h"
#import "lookWkweb.h"
#import "emptyMyOrOther.h"
#import "ChatViewController.h"
#import "YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView.h"
#import "YX.h"
#import "emptyMyOrOtherCell.h"
#import "AlbummyOrtherHomeCell.h"
#import "headmyOrotherHomeCell.h"
#import "myOrOtherHomeHeadForCell.h"
#import "CustomNavigationBarForHome.h"
#import "meiPan.h"
typedef NS_ENUM(NSInteger, myOrotherHome_btn_enmu)
{
    guanzhuorNO_myOrotherHome_btn_enmu,//关注
    together_myOrotherHome_btn_enmu,//与游
    MMi_myOrotherHome_btn_enmu,//私信
};

#define height_foot  50

@interface myOrotherHome ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView *tableView;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;

@property (nonatomic, assign) BOOL canScroll;

@property (nonatomic,strong) peoHome_page *oneData;

@property (nonatomic,weak) UIImageView *foot;
@property (nonatomic,weak) CustomNavigationBarForHome *customNavigationBarForHome; //导航栏头部
@property (nonatomic,weak) UIButton *btn1;

//@property (nonatomic,strong) appS *decodedBag;
@end


@implementation myOrotherHome
- (void)setUiBasic{}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.shareArry = [NSMutableArray array];

    
    self.fd_prefersNavigationBarHidden = YES;
    [self setUI];
    appS *decodedBag = [tourInfo sharedInstance].UserInfo;
    if (self.idd == decodedBag.idd) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(MorepersonalinformationFuc:)
                                                     name:MorepersonalinformationNotice
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(myselfGuanNumFuc:)
                                                     name:myselfGuanNum
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(editOrDeleShareFuc:)
                                                     name:editOrDeleShare
                                                   object:nil];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(imagesssyingxiaobiaoqController:)
                                                 name:imagesssyingxiaobiaoq
                                               object:nil];
    

}

#pragma  -mark<滑动>
-(void)acceptMsg : (NSNotification *)notification{
    //NSLog(@"%@",notification);
    NSDictionary *userInfo = notification.userInfo;
    NSString *canScroll = userInfo[@"canScroll"];
    if ([canScroll isEqualToString:@"1"]) {
        _canScroll = YES;
    }
    NSLog(@"父 接收到 %@",notification.name);
}



#pragma --mark<我 对别人 贴了标签>
- (void)imagesssyingxiaobiaoqController:(NSNotification *)user{
    self.isNeedRefreth  =YES;
//    self.tableView.mj_header.hidden = NO;
//    [self.tableView.mj_header beginRefreshing];
}

#pragma --mark<我的文章发生了变化>
- (void)editOrDeleShareFuc:(NSNotification *)user{
    self.isNeedRefreth  =YES;
}

#pragma --mark<我关注人数的变化 >
- (void)myselfGuanNumFuc:(NSNotification *)user{
    self.isNeedRefreth  =YES;
//    self.tableView.mj_header.hidden = NO;
//    [self.tableView.mj_header beginRefreshing];
//    NSDictionary *info = user.userInfo;
//    NSString *num = info[myselfGuanNum];
//    self.oneData.followCount = [num integerValue];
//    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma --mark<更该个人信息 >
- (void)MorepersonalinformationFuc:(NSNotification *)user{
    self.isNeedRefreth  =YES;
//    NSDictionary *info = user.userInfo;
//    UserS *decodedBag = info[MorepersonalinformationNotice];
//    self.oneData.user = decodedBag;
//    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isNeedRefreth) {
        self.tableView.mj_header.hidden = NO;
        [self.tableView.mj_header beginRefreshing];
    }
}
- (void)setUI{
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    appS *decodedBag = [tourInfo sharedInstance].UserInfo;
    if (decodedBag.idd == self.idd) {
        YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView *tableView = [[YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//        tableView.pagingEnabled = YES;
        self.tableView = tableView;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kLeaveTopNotificationNameHome object:nil];
    } else {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        self.tableView = tableView;
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, height_foot, 0);
    }
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self setEmptyDelegateUitableView:self.tableView];

    self.basicTableView = self.tableView;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    
    [self.tableView registerClass:[headmyOrotherHomeCell class] forCellReuseIdentifier:NSStringFromClass([headmyOrotherHomeCell class])];
    [self.tableView registerClass:[emptyMyOrOtherCell class] forCellReuseIdentifier:NSStringFromClass([emptyMyOrOtherCell class])];
    [self.tableView registerClass:[AlbummyOrtherHomeCell class] forCellReuseIdentifier:NSStringFromClass([AlbummyOrtherHomeCell class])];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];

    self.tableView.mj_header = self.header;
    [self.header beginRefreshing];
    
    [self Customize_the_head_of_the_navigation_bar];
    if (decodedBag.idd == self.idd) {
    } else {

        UIImageView *foot = [[UIImageView alloc]init];
        foot.userInteractionEnabled = YES;
        foot.alpha = 0.9;
        self.foot.image = ImageNamed(@"Rectangle 3fj");
        self.foot = foot;
        [self.view addSubview:foot];
        
        UIView *line1 = [[UIView alloc]init];
        [foot addSubview:line1];
        
        UIButton *btn1 = [[UIButton alloc]init];
        self.btn1 =btn1;
        [foot addSubview:btn1];
        
        UIButton *btn2 = [[UIButton alloc]init];
        [foot addSubview:btn2];
        
        UIButton *btn3 = [[UIButton alloc]init];
        [foot addSubview:btn3];
        
        UIView *su1 = [[UIView alloc]init];
        [foot addSubview:su1];
        
        UIView *su2 = [[UIView alloc]init];
        [foot addSubview:su2];
        
        [foot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view);
            make.left.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(0);
            make.height.equalTo(@(height_foot));
        }];
        
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(foot);
            make.right.equalTo(foot);
            make.top.equalTo(foot);
            make.height.equalTo(@0.5);
        }];
        
        [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(foot);
            make.bottom.equalTo(foot);
            make.top.equalTo(foot);
            make.width.equalTo(@[btn2,btn3]);
        }];
        
        [su1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(foot);
            make.height.equalTo(@(26));
            make.width.equalTo(@(0.5));
            make.left.equalTo(btn1.mas_right).offset(-1);
        }];
        
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn1.mas_right);
            make.bottom.equalTo(foot);
            make.top.equalTo(foot);
        }];
        [su2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(foot);
            make.height.equalTo(@(26));
            make.width.equalTo(@(0.5));
            make.left.equalTo(btn2.mas_right).offset(-1);
        }];
        [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn2.mas_right);
            make.right.equalTo(foot);
            make.bottom.equalTo(foot);
            make.top.equalTo(foot);
        }];
        
        line1.backgroundColor = ColorWithHex(0x979797, 0.4);
        su1.backgroundColor = ColorWithHex(0x979797, 0.4);
        su2.backgroundColor = ColorWithHex(0x979797, 0.4);
        [btn1 setImage:ImageNamed(@"已关注my") forState:UIControlStateNormal];
        [btn1 setTitle:@" 已关注" forState:UIControlStateNormal];
        [btn1 setImage:ImageNamed(@"关注peooe") forState:UIControlStateSelected];
        [btn1 setTitle:@" 关注" forState:UIControlStateSelected];
        
        [btn2 setTitle:@"与游" forState:UIControlStateNormal];
        [btn3 setTitle:@"私信" forState:UIControlStateNormal];
        
        [btn1 setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
        [btn2 setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
        [btn3 setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
        
        btn1.titleLabel.font = PingFangSC_Regular(15);
        btn2.titleLabel.font = PingFangSC_Regular(15);
        btn3.titleLabel.font = PingFangSC_Regular(15);
        btn1.tag = guanzhuorNO_myOrotherHome_btn_enmu;
        btn2.tag = together_myOrotherHome_btn_enmu;
        btn3.tag = MMi_myOrotherHome_btn_enmu;
        foot.backgroundColor =RGBACOLOR(255, 255, 255, 0.6);
        foot.hidden = YES;
        [btn1 addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
        [btn3 addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIButton *btnBack = [[UIButton alloc]init];
    [self.view addSubview:btnBack];
    
    [btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(back_btn_left_to_superView);
        make.top.equalTo(self.view).offset(back_btn_top_to_superView);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
    }];
    [btnBack setImage:[UIImage imageNamed:IMAGE_back] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(BtnbackClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma -mark<自定义导航栏头部 >
- (void)Customize_the_head_of_the_navigation_bar{
    CustomNavigationBarForHome *customNavigationBarForHome = [CustomNavigationBarForHome  new];
    self.customNavigationBarForHome  =customNavigationBarForHome;
    [self.view addSubview:customNavigationBarForHome];
    [customNavigationBarForHome  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        if (ScreenHeight==812){
                    make.height.equalTo(@(HEIGHT_NavbarX));
        }else{
            
            make.height.equalTo(@(HEIGHT_Navbar));
        }
    }];
    self.customNavigationBarForHome.alpha = 0;
}
#pragma -mark<返回 >
- (void)BtnbackClick:(UIButton *)btn{
    [self popSelf];
}
#pragma -mark<点击最下面3个按钮  关注 和 不关注 >
- (void)deletMyfengsiindexpath{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]followupdateWithtravelId:self.oneData.user.idd success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD showPrompt:msg toView:weakself.view];
        NSNotification *notification =[NSNotification notificationWithName:myselfGuanNum object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        if (weakself.oneData.isFollow) { //我关注了他
            weakself.oneData.followCount--;
            weakself.oneData.isFollow = NO;
        }else{
            weakself.oneData.followCount++;
            weakself.oneData.isFollow = YES;
        }
        [weakself.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]withRowAnimation:UITableViewRowAnimationNone];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg toView:weakself.view];
        weakself.btn1.selected = !weakself.btn1.selected;
    }];
}

#pragma -mark<点击最下面3个按钮 >
- (void)btnClcik:(UIButton *)btn{
    if (btn.tag == guanzhuorNO_myOrotherHome_btn_enmu) {
        //TOTO  调用接口
        self.btn1.selected = !self.btn1.selected;
        [self deletMyfengsiindexpath];
    } else if (btn.tag == together_myOrotherHome_btn_enmu){
        togetherLY *vc = [[togetherLY alloc]init];
        vc.avtorStr = self.oneData.user.avatar;
        vc.idd = self.idd;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == MMi_myOrotherHome_btn_enmu){
        if (self.emChatId && self.emChatId.length && self.type == EMConversationTypeChat) {
            [self popSelf];
        }else{
            //TODO 聊天
            if (self.oneData.isFollow && self.oneData.isFollowed) {
                NSLog(@"self.oneData.user.emChatId==%@",self.oneData.user.emChatId);
                if (self.oneData.user.emChatId && self.oneData.user.emChatId.length) {
                    ChatViewController *chatController = [[ChatViewController alloc]
                                                          initWithConversationChatter:self.oneData.user.emChatId conversationType:EMConversationTypeChat];
                    chatController.UserOne = self.oneData.user;
                    chatController.title = self.oneData.user.nickName?self.oneData.user.nickName:self.oneData.user.mobile;
                    chatController.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:chatController animated:YES];
                } else {
                    [MBProgressHUD showPrompt:@"对方的emChatId为空" toView:self.view];
                }
            } else {
                if (!self.oneData.isFollow) {
                    [MBProgressHUD showPrompt:@"您还没有关注对方哦～" toView:self.view];
                } else if(!self.oneData.isFollowed){
                    [MBProgressHUD showPrompt:@"对方还没有关注您～" toView:self.view];
                }
            }
        }
    }
}
#pragma -mark<mj_footer 加载数据>
- (void)loadMoreData{
    kWeakSelf(self);
    // 上拉加载更多
    [[ToolRequest sharedInstance]home_pagesharingsWithPageNumber:weakself.Pagenumber PageSize:weakself.Pagesize userId:weakself.idd success:^(id dataDict, NSString *msg, NSInteger code) {
        lcxctravelS *lcxctravelSData = [lcxctravelS mj_objectWithKeyValues:dataDict];
        if (weakself.Pagenumber >= lcxctravelSData.totalPages) {
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
        weakself.Pagenumber++;
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg toView:weakself.view];
        [weakself.tableView.mj_footer endRefreshing];
    }];
}

#pragma -mark<MJ_head加载数据>
- (void)loadNewData{
    //下拉刷新
    kWeakSelf(self);
    [[ToolRequest sharedInstance]home_pageuserWithIid:weakself.idd success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.oneData = [peoHome_page mj_objectWithKeyValues:dataDict];
        
        weakself.tableView.mj_header.hidden = YES;
        [weakself.tableView.mj_header endRefreshing];
        
        weakself.tableView.mj_footer.hidden = NO;
        weakself.Pagenumber =2;
        
        if ([weakself.oneData.sharingsA count]>0) {
            weakself.tableView.mj_footer.hidden = NO;
        }else{
            weakself.tableView.mj_footer.hidden = YES;
            [weakself.tableView.mj_footer resetNoMoreData];
        }
        
        weakself.empty_typeV2 = code;
        weakself.isNeedRefreth = NO;
        if (self.foot) {
            weakself.foot.hidden = NO;
            if (weakself.oneData.isFollow) { //关注了
                weakself.btn1.selected = NO;
            } else {
                weakself.btn1.selected = YES;
            }
        }
        [weakself.tableView reloadData];
        if (weakself.customNavigationBarForHome) {
            weakself.customNavigationBarForHome.titleStr = weakself.oneData.user.nickName;
            weakself.customNavigationBarForHome.avtorStr = weakself.oneData.user.avatar;
        }
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself.tableView.mj_header endRefreshing];
        [weakself.tableView reloadData];
        weakself.empty_typeV2 = errorCode;
    }];
}

- (void)openEditMyVc{
    appS *decodedBag = [tourInfo sharedInstance].UserInfo;
    if (self.idd == decodedBag.idd) {
        eidtMyInfo *vc = [[eidtMyInfo alloc]init];
        vc.decodedBag = self.oneData.user;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 265;
    } else {
        if (self.foot) {
            if (self.oneData.sharingsA.count) {
                return 120*HEIGHTICON+15;
            } else {
                return ScreenHeight - 265 - 50;
            }
        } else {
            if (ScreenHeight==812){
                            return ScreenHeight - HEIGHT_NavbarX;
            }else{
                
                return ScreenHeight - HEIGHT_Navbar;
            }
        }
    }
    return 0.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        
    } else {
        if (self.foot) {
            myOrOtherHomeHeadForCell *head = [myOrOtherHomeHeadForCell new];
            head.isHidenBtn = YES;
            head.title = [NSString stringWithFormat:@"已发布游记 %lu",self.oneData.sharingsA.count];
            return head;
        } else {
            
        }
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        
    } else {
        if (self.foot) {
            return 50.0;
        }else{
            
        }
    }
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}


#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    } else if (section == 1){
        if (self.foot) {
            if (self.oneData.sharingsA.count>0) {
                return self.oneData.sharingsA.count;
            } else {
                return 1;
            }
        }else{
            return 1;
        }
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.empty_typeV2 != In_loading_empty_numV2?2:0;
}


#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        headmyOrotherHomeCell *cell = [headmyOrotherHomeCell returnCellWith:tableView];
        [self configureheadmyOrotherHomeCell:cell atIndexPath:indexPath];
        return  cell;
    }else if(indexPath.section == 1){
        if (self.foot) {//别人的
            if (self.oneData.sharingsA.count>0) {
                AlbummyOrtherHomeCell *cell = [AlbummyOrtherHomeCell returnCellWith:tableView];
                [self configureAlbummyOrtherHomeCell:cell atIndexPath:indexPath];
                return  cell;
            } else {
                emptyMyOrOtherCell *cell = [emptyMyOrOtherCell returnCellWith:tableView];
                [self configureemptyMyOrOtherCell:cell atIndexPath:indexPath];
                return  cell;
            }
        } else {//自己的
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eee234"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eee234"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                NSArray *tabConfigArray = @[@{
                                                @"title":@"图文介绍",
                                                @"view":@"AlreadyReleased",
                                                @"data":@"图文介绍的数据",
                                                @"position":@0,
                                                @"kGoTopNotificationNamestr":kGoTopNotificationNameHome,
                                                @"kLeaveTopNotificationNamestr":kLeaveTopNotificationNameHome,
                                                @"kTabTitleViewHeightf":@40.,
                                                @"kBottomBarHeightf":@0.
                                                },@{
                                                @"title":@"商品详情",
                                                @"view":@"draft",
                                                @"data":@"商品详情的数据",
                                                @"position":@1,
                                                @"kGoTopNotificationNamestr":kGoTopNotificationNameHome,
                                                @"kLeaveTopNotificationNamestr":kLeaveTopNotificationNameHome,
                                                @"kTabTitleViewHeightf":@40.,
                                                @"kBottomBarHeightf":@0.
                                                }];
                homeForMySelf *tabView = [[homeForMySelf alloc] initWithTabConfigArray:tabConfigArray];
                [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                [cell.contentView addSubview:tabView];
            }
            homeForMySelf *tabView = [cell.contentView.subviews firstObject];
            tabView.oneData = self.oneData;
            kWeakSelf(self);
            tabView.shareORkeep = ^(travelSharingsS *one){
                [weakself oepenWkwebView:one];
            };
            tabView.EditDraft = ^(NSString *one){
                [weakself openFaBuYouJi:one];
            };
            return cell;
        }
    }
    return nil;
}
#pragma --mark<打开发布游记的 控制器 >
- (void)openFaBuYouJi:(NSString *)path{
    meiPan *vc = [meiPan new];
    vc.path = path;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma --mark<配置  顶部cell >
- (void)configureheadmyOrotherHomeCell:(headmyOrotherHomeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    appS *decodedBag = [tourInfo sharedInstance].UserInfo;
    cell.isMy = (decodedBag.idd==self.idd)?YES:NO;
    cell.oneData = self.oneData;
    cell.btnClick = ^(headmyOrotherHomeCell_enmu type){
        if (type == backheadmyOrotherHomeCell_enmu) {
            [weakself popSelf];
        } else if (type == iconheadmyOrotherHomeCell_enmu) {
            //判断是否是自己
            [weakself openEditMyVc];
        } else if (type == numheadmyOrotherHomeCell_enmu) {
            togetherLY *vc = [[togetherLY alloc]init];
            vc.avtorStr = weakself.oneData.user.avatar;
            vc.isNumberOfJourneys = YES;
            vc.idd = weakself.idd;
            [weakself.navigationController pushViewController:vc animated:YES];
        } else if (type == eidtdmyOrotherHomeCell_enmu) {
            //判断是否是自己
            [weakself openEditMyVc];
        } else if (type == guanzhuheadmyOrotherHomeCell_enmu || type == beiguanzhuheadmyOrotherHomeCell_enmu) {
            if (weakself.idd == decodedBag.idd) {
                followOrNO *vc = [[followOrNO alloc]init];
                if (type == guanzhuheadmyOrotherHomeCell_enmu) {
                    vc.title = @"关注";
                    vc.isGuangzhu = YES;
                } else if(type == beiguanzhuheadmyOrotherHomeCell_enmu){
                    vc.title = @"被关注";
                }
                [weakself.navigationController pushViewController:vc animated:YES];
            }else{
                [MBProgressHUD showPrompt:@"您暂无权查看～" toView:weakself.view];
            }
        }
    };
}

#pragma --mark<点击了别人的游记>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && self.foot && self.oneData.sharingsA.count) {
        travelSharingsS *one = self.oneData.sharingsA[indexPath.row];
        [self oepenWkwebView:one];
    }
}

- (void)oepenWkwebView:(travelSharingsS *)one{
    lookWkweb *vc = [[lookWkweb alloc]init];
    vc.IsHaveshareBtn = YES;
    //        vc.Deleted = ^(travelSharingsS *dateOne){
    //            [weakself.oneData.sharingsA removeObject:dateOne];
    //            [weakself.collectionView reloadData];
    //        };
    vc.IsdemeiPan = NO;
    vc.IsxiangshiOKbtn = YES; //crash
    vc.dateOne = one;
    //        vc.orderId  =self.oneData.idd;
    if (!self.foot) {
        vc.isHaveRightBtnb = YES;
        vc.isHaveRightBtnDelete = YES;
    } else {
        vc.isHaveRightBtnb = NO;
        vc.isHaveRightBtnDelete = NO;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma --mark<配置  别人发布的游记 cell >
- (void)configureAlbummyOrtherHomeCell:(AlbummyOrtherHomeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.oneData = self.oneData.sharingsA[indexPath.row];
}
#pragma --mark<配置  configureemptyMyOrOtherCell cell >
- (void)configureemptyMyOrOtherCell:(emptyMyOrOtherCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.desStr =@"暂无游记";
}

#pragma <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.oneData && !self.foot) {
//        NSLog(@"%f",[_tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].origin.y);
        CGFloat tabOffsetY;
        if (ScreenHeight==812){
                       tabOffsetY  = [_tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].origin.y-kTopBarHeight-HEIGHT_NavbarX-0.05; //不知道为何要加0.05  不然滑动有点问题
        }else{
           tabOffsetY  = [_tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].origin.y-kTopBarHeight-HEIGHT_Navbar-0.05; //不知道为何要加0.05  不然滑动有点问题
        }
        CGFloat offsetY = scrollView.contentOffset.y;
        _isTopIsCanNotMoveTabViewPre = _isTopIsCanNotMoveTabView;
//        NSLog(@"%f  %f",tabOffsetY,offsetY);

        if (offsetY>=tabOffsetY) {
            scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            _isTopIsCanNotMoveTabView = YES;
            NSLog(@"1");
        }else{
            NSLog(@"2");
            _isTopIsCanNotMoveTabView = NO;
        }
        if (_isTopIsCanNotMoveTabView != _isTopIsCanNotMoveTabViewPre) {
            if (!_isTopIsCanNotMoveTabViewPre && _isTopIsCanNotMoveTabView) {
                //NSLog(@"滑动到顶端");
                NSLog(@"父 发出通知%@",kGoTopNotificationNameHome);
                [[NSNotificationCenter defaultCenter] postNotificationName:kGoTopNotificationNameHome object:nil userInfo:@{@"canScroll":@"1"}];
                _canScroll = NO;
            }
            if(_isTopIsCanNotMoveTabViewPre && !_isTopIsCanNotMoveTabView){
                //NSLog(@"离开顶端");
                if (!_canScroll) {
                    NSLog(@"4");
                    scrollView.contentOffset = CGPointMake(0, tabOffsetY);
                }
            }
        }
    }
    if (self.customNavigationBarForHome) {
        if (scrollView.contentOffset.y > 265) {
            self.customNavigationBarForHome.alpha = 1.0;
        } else {
            if (ScreenHeight==812){
                            self.customNavigationBarForHome.alpha = scrollView.contentOffset.y/(265-HEIGHT_NavbarX);
            }else{
                
                self.customNavigationBarForHome.alpha = scrollView.contentOffset.y/(265-HEIGHT_Navbar);
            }
        }
    }
}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    CGFloat tabOffsetY = [_tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].origin.y-kTopBarHeight-HEIGHT_Navbar; //不知道为何要加0.05  不然滑动有点问题
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY<=tabOffsetY*0.5) {
//        [self.tableView setContentOffset:CGPointMake(0,0) animated:NO];
//    }else{
//        [self.tableView setContentOffset:CGPointMake(0,tabOffsetY) animated:NO];
//    }
//}


//#pragma --<空白页处理>
//
//- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
//    return [UIImage imageNamed:load_fail_image];
//}
//
//- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
//    NSString *text = @"服务器开小差了，刷新一下吧";
//    
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
//                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
//    
//    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//}
//
//- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
//    NSString *text = @"点击重新加载";
//    
//    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
//    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
//    paragraph.alignment = NSTextAlignmentCenter;
//    
//    NSDictionary *attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
//                                 NSForegroundColorAttributeName: ColorWithHex(0x779CF4, 1.0),
//                                 NSParagraphStyleAttributeName: paragraph};
//    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//}
//
////按钮文本或者背景样式
//
////- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
////    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
////
////    return [[NSAttributedString alloc] initWithString:@"Continue 点击继续" attributes:attributes];
////}
////
////- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
////    return [UIImage imageNamed:@"123"];
////}
//
////空白页的背景色
//
//- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
//    return [UIColor clearColor];
//}
//
////是否显示空白页，默认YES
//- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
//    return self.empty_type != In_loading_empty_num;
//}
//
////空白页点击事件
//- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
//    self.tableView.mj_header.hidden = NO;
//    [self.tableView.mj_header beginRefreshing];
//}
//
////空白页按钮点击事件
////- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView {
////    self.tableView.mj_header.hidden = NO;
////    [self.tableView.mj_header beginRefreshing];
////}
@end
