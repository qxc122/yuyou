//
//  tourDetais.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "tourDetais.h"
#import "bannerImageCell.h"
#import "YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView.h"
#import "YX.h"
#import "BottomDetaisCell.h"
#import "NavigationBarDetais.h"
#import "shareTo.h"
#import "ChatViewController.h"
#import "totalThetour.h"
#import "lookWkweb.h"
#import "toOrderVc.h"
#import "BindingResults.h"
#import "kaiqiPopView.h"
#import "realNameAuthenticationVc.h"
#import "myOreserFive.h"
#import "SelectDateTwo.h"
#import "ChoiceStages.h"
#import "TravelItineraryDetailVc.h"
#import "BottomDetailsTableViewFoot.h"


@interface tourDetais ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView *tableView;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;

@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;

@property (nonatomic, assign) BOOL canScroll;

@property (nonatomic, strong) tourDetaisData *data; 

@property (nonatomic, weak) NavigationBarDetais *headNa;
@property (nonatomic, weak) bannerImageCell *cellImage;
@property (nonatomic, weak) BottomDetailsTableViewFoot *foot;


@property (nonatomic,assign) NSInteger type;//类型
@property (nonatomic,assign) NSInteger Month;
@property (nonatomic,strong) pricesS *dataDate;//出发日期
@property (nonatomic,strong) periodTypeList_one *dateList;//分期

@property (nonatomic,weak) ChoiceStages *ChoiceStagesview;//分期 视图
@property (nonatomic,weak) SelectDateTwo *SelectDateTwoview;//日期 视图
@end


@implementation tourDetais
- (void)viewDidLoad {
    [super viewDidLoad];
    self.type = 0;
    self.Month = 0;
    self.fd_prefersNavigationBarHidden = YES;
    
    
//    UIView *backView = [[UIView alloc]init];
//    backView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:backView];
//    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.top.equalTo(self.view);
//        make.right.equalTo(self.view);
//        make.bottom.equalTo(self.view);
//    }];
    
    YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView *tableView = [[YXIgnoreHeaderTouchAndRecognizeSimultaneousTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.pagingEnabled = YES;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kLeaveTopNotificationNameDetai object:nil];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];

    NavigationBarDetais *headNa = [NavigationBarDetais new];
    kWeakSelf(self);
    headNa.brnClickType = ^(NavigationBarDetais_Click_ENMU type) {
        [weakself brnClickType:type];
    };
    self.headNa = headNa;
    self.headNa.alpaImage = 0.0f;
    self.headNa.isHiden = YES;
    [self.view addSubview:headNa];
    [headNa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        if (ScreenHeight==812){
                    make.height.equalTo(@(HEIGHT_NavbarX));
        }else{
            
            make.height.equalTo(@(HEIGHT_Navbar));
        }
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.mj_header = self.header;
    [self setEmptyDelegateUitableView:self.tableView];
    self.basicTableView = self.tableView;
    [self.header beginRefreshing];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)loadNewData{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appv2traveldetailWithtravelId:self.idd success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.empty_typeV2 = code;
        weakself.data = [tourDetaisData mj_objectWithKeyValues:dataDict];
        [weakself.header endRefreshing];
        [weakself.tableView reloadData];
        weakself.header.hidden = YES;
        
        weakself.headNa.alpaImage = 1.0f;
        weakself.headNa.isHiden = NO;
        weakself.headNa.isFavorite =  weakself.data.isFavorite;
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        weakself.empty_typeV2 = errorCode;
        [weakself.header endRefreshing];
        [weakself.tableView reloadData];
    }];
}
#pragma --mark<自 定义 导航栏的代理方法>
- (void)brnClickType:(NavigationBarDetais_Click_ENMU)type{
    if (type == keep_NavigationBarDetais_Click_ENMU) { //收藏
        if (![tourInfo sharedInstance].UserInfo) {
            [self openLoginView];
        }else{
            [self ClickCollection];
        }
    } else if (type == share_NavigationBarDetais_Click_ENMU) { //分享
        if (![tourInfo sharedInstance].UserInfo) {
            [self openLoginView];
        }else{
            [self ClickshareTo];
        }
    } else if (type == back_NavigationBarDetais_Click_ENMU) {
        [self popSelf];
    }
}
#pragma --mark<点击了收藏>
- (void)ClickCollection{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appuserfavoriteupdateWithids:@[@(self.data.travel.idd)] success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD showPrompt:msg toView:weakself.view];
        weakself.data.isFavorite = !weakself.data.isFavorite;
        weakself.headNa.isFavorite =  weakself.data.isFavorite;
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}
#pragma --mark<点击了分享>
- (void)ClickshareTo{
    shareTo *shareview = [[shareTo alloc]init];
    kWeakSelf(self);
    shareview.shareClick = ^(int index){
        [weakself shareWebPageToPlatformType:index withTitle:self.data.shareTitle withDescr:self.data.shareContent withWebpageUrl:self.data.shareUrl withThumImage:self.data.shareImage success:^(NSString *error) {
            [MBProgressHUD showPrompt:@"分享成功" toView:weakself.view];
        } failure:^(NSString *messg) {
            [MBProgressHUD showPrompt:messg toView:weakself.view];
        }];
    };
    [shareview windosViewshow];
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return ScreenHeight;
    } else {
        return heigtTwo;
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.data) {
        return 50;
    }
    return 0.001;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.data) {
        BottomDetailsTableViewFoot *foot = [[BottomDetailsTableViewFoot  alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        kWeakSelf(self);
        foot.btnClick = ^(BottomDetailsTableViewFoot_type type) {
            if (![tourInfo sharedInstance].UserInfo) {
                [weakself openLoginView];
            }else{
                if (type == Consultation_BottomDetailsTableViewFoot_type) {
                    [weakself OPenChatViewController];
                } else if (type == WantGo_BottomDetailsTableViewFoot_type) {
                    [weakself OPenSelectDateTwo];
                }
            }
        };
        foot.wanTogoIsenabel = self.data.Arry_initiateMonthPrice.count?YES:NO;
        self.foot=foot;
        return foot;
    }
    return nil;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.data) {
       return 2;
    }
    return 0;
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = [bannerImageCell returnCellWith:tableView];
        [self configurebannerImageCell:(bannerImageCell *)cell atIndexPath:indexPath];
        self.cellImage = (bannerImageCell *)cell;
        return  cell;
    } else {
        cell = [BottomDetaisCell returnCellWith:tableView];
        [self configureBottomDetaisCell:(BottomDetaisCell *)cell atIndexPath:indexPath];
        return  cell;
    }
    return  cell;
}
#pragma --mark<打开 聊天 控制器>
- (void)OPenChatViewController{
    [MobClick event:zhixun];
    ChatViewController *chatController = [[ChatViewController alloc]
                                          initWithConversationChatter:kefu_head_emoid conversationType:EMConversationTypeChat];
    chatController.title = kefu_name_emoid;
    chatController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatController animated:YES];
}


#pragma -mark<打开  提交订单  页面>
- (void)OpentoOrderVc{
    toOrderVc *vc = [[toOrderVc alloc]init];
    detailS *tmp = [detailS new];
    tmp.travelD = self.data.travel;
    vc.detailD = tmp;
    vc.traid = self.idd;
    vc.startDate = self.dataDate.date;//选中的出发日期
    vc.code = self.dateList.periodNum; //选中的分期
    tourDetaisData_Specifications *tmptype = self.data.Arry_initiateMonthPrice[self.type];
    vc.travelSpecificationId = [tmptype.initiateId integerValue];
    self.type = 0;
    self.Month = 0;
    self.dataDate = nil;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)checkLitt{
    if (self.data.travel.isPeriod && ![self.dateList.periodNum isEqualToString:NoStagingString]) {
        if ([tourInfo sharedInstance].UserInfo.isBindingBankCard) {
            if ([tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
                [self OpentoOrderVc];
            } else {
                [self chekid];
            }
        } else {
            [self ToTieTheCard];
        }
    } else {
        [self OpentoOrderVc];
    }
}
#pragma -mark<弹出是否绑卡框>
- (void)ToTieTheCard{
    kaiqiPopView *liset = [kaiqiPopView new];
    kWeakSelf(self);
    liset.goToRealNameAuthentication = ^(kaiqiPopView_enmu type){
        if (type == go_kaiqiPopView) {
            [weakself OPenrealNameAuthenticationVc];
        } else if (type == giveUp_kaiqiPopView) {
            [weakself OPenmyOreserFive];
        }
    };
    [liset windosViewshow];
}

#pragma -mark<不绑卡  打开我的订单页面>
- (void)OPenmyOreserFive{
    self.type = 0;
    self.Month = 0;
    self.dataDate = nil;
    
    myOreserFive *vc = [[myOreserFive alloc]init];
    vc.index = 0;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma -mark<去绑卡>
- (void)OPenrealNameAuthenticationVc{
    realNameAuthenticationVc *vc = [realNameAuthenticationVc new];
    vc.title = @"实名认证";
    kWeakSelf(self);
    vc.AuthenticationSuccess = ^(){
        [weakself chekid];
    };
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma -mark<检查 信用信息>
- (void)chekid{
    if (![tourInfo sharedInstance].UserInfo.isPeriodEnabled) {
        kWeakSelf(self);
        [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
        [[ToolRequest sharedInstance]appuserapprovechecksuccess:^(id dataDict, NSString *msg, NSInteger code) {
            
            RiskVerification *date = [RiskVerification mj_objectWithKeyValues:dataDict];
            
            appS *userInfo = [tourInfo sharedInstance].UserInfo;
            userInfo.isPeriodEnabled = date.fright&&date.info&&date.risk;
            [tourInfo sharedInstance].UserInfo = userInfo;
            
            [MBProgressHUD hideHUDForView:weakself.view];
            BindingResults *view = [BindingResults new];
            view.endCountDown = ^(){
                [weakself OpentoOrderVc];
            };
            view.date = date;
            [view windosViewshow];
            [MBProgressHUD hideHUDForView:weakself.view];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD showPrompt:msg];
            [MBProgressHUD hideHUDForView:weakself.view];
        }];
    } else {
        [self OpentoOrderVc];
    }
}

#pragma --mark<打开 日期选择页面>
- (void)OPenSelectDateTwo{
    if (self.data.Arry_initiateMonthPrice.count) {
        SelectDateTwo *view = [SelectDateTwo new];
        self.SelectDateTwoview = view;
        view.type = self.type;
        view.Month = self.Month;
        view.dataDate = self.dataDate;
        view.data = self.data;
        kWeakSelf(self);
        view.NextBtnClisckBlock = ^(NSInteger type,NSInteger month,pricesS *data) {
            weakself.type = type;
            weakself.Month = month;
            weakself.dataDate = data;
            if (weakself.data.travel.isPeriod) {
                [weakself OPenChoiceStages];
            } else {
                [weakself OpentoOrderVc];
            }
        };
        view.CloseView = ^{
            weakself.type = 0;
            weakself.Month = 0;
            weakself.dataDate = nil;
            [weakself.SelectDateTwoview closeClisck];
        };
        [view windosViewshow];
    }
}

#pragma --mark<打开 分期选择页面>
- (void)OPenChoiceStages{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
    tourDetaisData_Specifications *tmp = self.data.Arry_initiateMonthPrice[self.type];
    [[ToolRequest sharedInstance]appv2travelperiodType_listWithtravelId:self.idd travelSpecificationId:[tmp.initiateId integerValue] date:self.dataDate.date success:^(id dataDict, NSString *msg, NSInteger code) {
        ChoiceStages_data *dateList = [ChoiceStages_data mj_objectWithKeyValues:dataDict];
        ChoiceStages *view = [ChoiceStages new];
        weakself.ChoiceStagesview = view;
//        view.data = weakself.data;
        view.dayData = weakself.dataDate;
        view.dateList = dateList;
        view.goToViewXieYi = ^(NSURL *url) {
            weakself.ChoiceStagesview.hidden = YES;
            [weakself openLookWkweb:url isPresent:NO title:nil];
        };
        view.ClickOKBtn = ^(periodTypeList_one *dateList) {
            weakself.dateList = dateList;

            [weakself checkLitt];
        };
        view.CloseView = ^{
            weakself.type = 0;
            weakself.Month = 0;
            weakself.dataDate = nil;
            [weakself.ChoiceStagesview closeClisck];
        };
        [view windosViewshow];
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
        [MBProgressHUD hideHUDForView:weakself.view];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}

#pragma --mark< 配置 下面的cell 的数据>
- (void)configureBottomDetaisCell:(BottomDetaisCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.data = self.data;
    kWeakSelf(self);
    cell.btnClick = ^(BottomDetailsTableViewFoot_type type) {
        if (![tourInfo sharedInstance].UserInfo) {
            [weakself openLoginView];
        }else{
            if (type == Consultation_BottomDetailsTableViewFoot_type) {
                [weakself OPenChatViewController];
            } else if (type == WantGo_BottomDetailsTableViewFoot_type) {
                [weakself OPenSelectDateTwo];
            }
        }
    };
    cell.lookMore = ^{
        [weakself OpenTotalThetourVc];
    };
    cell.lookWebUrl = ^(NSURL *url) {
        NSLog(@"url=%@",url);
        [weakself openLookWkweb:url isPresent:NO title:nil];
    };
    cell.lookSharedUrl = ^(travelSharingsS *data) {
        NSLog(@"data=%@",data.path);
        [weakself openLookWkweb:data isPresent:NO title:nil];
    };
    cell.lookTravelItinerary = ^() {
        NSLog(@"打开行程单控制器");
        [weakself openLookWkweb:weakself.data.travelLinesUrl isPresent:NO title:nil];
//        TravelItineraryDetailVc *vc= [TravelItineraryDetailVc new];
//        vc.idd = weakself.data.travel.idd;
//        [weakself.navigationController pushViewController:vc animated:YES];
    };
    cell.lookDetail = ^(NSURL *url,NSString *title) {
        [weakself openLookWkweb:url isPresent:YES title:title];
    };
}

#pragma --mark<同团游友控制器 返回>
- (void)OpenTotalThetourVc{
    [MobClick event:ttyyyyytyt];
    NSLog(@"lookMore");
    totalThetour *tmtt = [[totalThetour alloc]init];
    tmtt.data = self.data;
    kWeakSelf(self);
    tmtt.TravelTogether = ^(NSInteger type, NSInteger month, pricesS *StartDate) {
        weakself.type = type;
        weakself.Month = month;
        weakself.dataDate = StartDate;
        
        [weakself OPenSelectDateTwo]; //打开日期 选择
        
        
//        if (weakself.data.travel.isPeriod) {
//            if (StartDate) {
//                [weakself OPenChoiceStages];
//            }else{
//               [weakself OPenSelectDateTwo];
//            }
//        }else{
//            if (StartDate) {
//                [weakself OpentoOrderVc];
//            }else{
//                [weakself OPenSelectDateTwo];
//            }
//        }
    };
    tmtt.traid  =self.data.travel.idd;
    [self.navigationController pushViewController:tmtt animated:YES];
}

#pragma --mark<打开 网页浏览器>
- (void)openLookWkweb:(id)dataTmp isPresent:(BOOL)present title:(NSString *)title{
    lookWkweb *vc = [lookWkweb new];
    vc.IsHaveDelBtn = NO;
    vc.IsdemeiPan = NO;
    vc.isHaveRightBtnb = NO;
    vc.isHaveRightBtnDelete = NO;
    
    if ([dataTmp isKindOfClass:[NSURL class]]) {
        vc.url = dataTmp;
        vc.IsHaveshareBtn = NO;
    } else if ([dataTmp isKindOfClass:[travelSharingsS class]]) {
        vc.IsHaveshareBtn = YES;
        travelSharingsS *dateOne = dataTmp;
        vc.dateOne = dateOne;
        vc.url = dateOne.path;
    }
    if (present) {
        vc.isPresent = present;
        vc.titleStr = title;
        UINavigationController *Navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self presentViewController:Navc animated:YES completion:nil];
    }else{
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma --mark< 配置 图片cell 的数据>
- (void)configurebannerImageCell:(bannerImageCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.arryA = self.data.travel.imagesA;
    kWeakSelf(self);
    cell.btnClick = ^(bannerImageCell_btn_type type) {
        if (type == Top_bannerImageCell) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kLeaveTopNotificationNameDetai object:nil userInfo:@{@"canScroll":@"1"}];
            [weakself.tableView setContentOffset:CGPointZero animated:YES];
        } else if (type == Bottom_bannerImageCell) {
            [weakself.tableView setContentOffset:CGPointMake(0, heigtTwo) animated:YES];
        }
    };
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.ChoiceStagesview) {
        self.ChoiceStagesview.hidden = NO;
    }
}
#pragma <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.data) {
        //        NSLog(@"%f",[_tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].origin.y);
        CGFloat tabOffsetY = heigtTwo-0.05; //不知道为何要加0.05  不然滑动有点问题
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
                NSLog(@"父 发出通知%@",kGoTopNotificationNameDetai);
                [[NSNotificationCenter defaultCenter] postNotificationName:kGoTopNotificationNameDetai object:nil userInfo:@{@"canScroll":@"1"}];
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
        
        if (offsetY <=0) {
            self.headNa.alpaImage = 1;
            self.cellImage.isSelecetForBtn = NO;
        } else if (offsetY >= (heigtTwo)) {
            self.headNa.alpaImage = 0;
            self.cellImage.isSelecetForBtn = YES;
        }else{
            if (ScreenHeight==812){
                            self.headNa.alpaImage = HEIGHT_NavbarX/offsetY;
            }else{
                           self.headNa.alpaImage = HEIGHT_Navbar/offsetY;
            }
        }
        
        if (offsetY >  50.0) {
            self.foot.hidden = NO;
        }else{
            self.foot.hidden = YES;
        }
    }
//    if (offsetY <=ScreenHeight*0.5) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:kLeaveTopNotificationNameDetai object:nil userInfo:@{@"canScroll":@"1"}];
//        [self.tableView setContentOffset:CGPointZero animated:YES];
//    } else {
//        [self.tableView setContentOffset:CGPointMake(0, ScreenHeight-120.0) animated:YES];
//    }
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

/*
#pragma --<空白页处理>
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.empty_typeV2 == succes_empty_numV2) {
        return [UIImage imageNamed:None_data_place_Pic];
    } else if (self.empty_typeV2 == fail_empty_numV2) {
        return [UIImage imageNamed:None_Net_place_Pic];
    } else if (self.empty_typeV2 == NoNetworkConnection_empty_numV2) {
        return [UIImage imageNamed:None_Net_place_Pic];
    }else{
        return [UIImage imageNamed:None_Net_place_Pic];
    }
    return nil;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.empty_typeV2 == fail_empty_numV2) {
        NSString *text = @"服务器开小差了，刷新一下吧";
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0f],
                                     NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
        
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else if (self.empty_typeV2 == NoNetworkConnection_empty_numV2) {
        NSString *text = @"您的手机暂无网络连接~\n请检查设置您的网络状态";
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0f],
                                     NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
        
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else if (self.empty_typeV2 == succes_empty_numV2){
        NSString *text = self.NodataDescribe;
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0f],
                                     NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
        
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else{
        NSString *text = @"服务器开小差了，刷新一下吧";
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0f],
                                     NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
        
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    return nil;
}
//
//
//- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
//    NSString *text=@"";
//    NSDictionary *attributes;
//    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
//    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
//    paragraph.alignment = NSTextAlignmentCenter;
//    if (self.empty_typeV2 == succes_empty_numV2) {
//        text = @"暂无数据";
//        attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
//                       NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0),
//                       NSParagraphStyleAttributeName: paragraph};
//    }
//    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//}

//按钮文本或者背景样式

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSString *text=@"";
    NSDictionary *attributes;
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    
    if (self.empty_typeV2 == fail_empty_numV2) {
        text = @"重新加载";
        attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                       NSForegroundColorAttributeName: ColorWithHex(0xFFFFFF, 1.0),
                       NSParagraphStyleAttributeName: paragraph};
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else if(self.empty_typeV2 == succes_empty_numV2){
        
    }else if(self.empty_typeV2 == NoNetworkConnection_empty_numV2){
        
    }else{
        text = @"重新加载";
        attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                       NSForegroundColorAttributeName: ColorWithHex(0xFFFFFF, 1.0),
                       NSParagraphStyleAttributeName: paragraph};
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    return nil;
}
- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    if (self.empty_typeV2 == fail_empty_numV2) {
        return ImageNamed(@"服务器、网络错误，按钮");
    }else if(self.empty_typeV2 == succes_empty_numV2){
        
    }else if(self.empty_typeV2 == NoNetworkConnection_empty_numV2){
        
    }else{
        return ImageNamed(@"服务器、网络错误，按钮");
    }
    return nil;
}

//- (CGPoint)offsetForEmptyDataSet:(UIScrollView *)scrollView{
//      return CGPointMake(100, 700);
//}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return 50;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView{
    return 50.0;
}


//空白页的背景色

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor clearColor];
}

//是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    if (self.empty_typeV2 == In_loading_empty_numV2){
        return NO;
    }
    return YES;
}

//空白页点击事件
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
    [self DidTap];
}

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{
    [self DidTap];
}
- (void)DidTap{
    if (self.empty_typeV2 != succes_empty_numV2) {
        self.basicTableView.mj_header.hidden = NO;
        [self.basicTableView.mj_header beginRefreshing];
    }
}
*/
@end
