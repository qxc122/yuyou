//
//  totalThetour.m
//  TourismT
//
//  Created by Store on 16/12/13.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "totalThetour.h"
#import "theTourCell.h"
#import "toOrderVc.h"
#import "NOtogerCell.h"
#import "myOrotherHome.h"
#import "login.h"
#import "realNameAuthenticationVc.h"
#import "kaiqiPopView.h"
#import "BindingResults.h"
#import "myOreserFive.h"



@interface totalThetour ()
@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,weak) UIImageView *backImageNOne;

@property (nonatomic,strong) total_jousS *date;
@end

@implementation totalThetour

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部团友";
    [self.basicTableView registerClass:[NOtogerCell class] forCellReuseIdentifier:NSStringFromClass([NOtogerCell class])];
    [self.basicTableView registerClass:[theTourCell class] forCellReuseIdentifier:NSStringFromClass([theTourCell class])];
    [self.header beginRefreshing];
}
- (void)loadNewData{
    //下拉刷新
    NSInteger traid=0;
    if (self.detailD) {
        traid = self.detailD.travelD.idd;
    }else{
        traid = self.traid;
    }
    kWeakSelf(self);
    [[ToolRequest sharedInstance]apptraveljoin_usersWithtravelId:traid success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.date = [total_jousS mj_objectWithKeyValues:dataDict];
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}
//- (void)MJRefreshFoot{
//    __weak typeof(self) weakSelf = self;
//    // 上拉加载更多
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        // 增加10条数据
//        [weakSelf shuxingshujudata:MJREFRESH_LOADMORE];
//    }];
//    // 默认先隐藏footer
//    self.tableView.mj_footer.hidden = YES;
//}
//- (void)shuxingshujudata:(MJREFRESH_DIRECTION)direction{
//    NSLog(@"%s",__func__);
//    [self.tableView.mj_header endRefreshing];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma --mark< 点击了一个cell>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexPath。荣威%ld",indexPath.row);
    UserS *oneForTotal = self.date.travelLinesA[indexPath.row];
    myOrotherHome *vc = [[myOrotherHome alloc]init];
    vc.idd = oneForTotal.idd;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma  UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (self.isHidenBtn) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([NOtogerCell class]) configuration:^(NOtogerCell *cell) {
            [weakself configureNOtogethertheTourCell:cell atIndexPath:indexPath];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([theTourCell class]) configuration:^(theTourCell *cell) {
            [weakself configuretheTourCell:cell atIndexPath:indexPath];
        }];
    }
    return 0;
}
#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.date.travelLinesA count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isHidenBtn) {
        NOtogerCell *cell = [NOtogerCell returnCellWith:tableView];
        [self configureNOtogethertheTourCell:cell atIndexPath:indexPath];
        return  cell;
    }else{
        theTourCell *cell = [theTourCell returnCellWith:tableView];
        [self configuretheTourCell:cell atIndexPath:indexPath];
        return  cell;
    }
    return nil;
}
#pragma  -mark<配置第一个  cell>
- (void)configureNOtogethertheTourCell:(NOtogerCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.UserD = self.date.travelLinesA[indexPath.row];
}

#pragma  -mark<配置第一个  cell>
- (void)configuretheTourCell:(theTourCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.isHidenBtn = self.isHidenBtn;
    cell.UserD = self.date.travelLinesA[indexPath.row];
    cell.index = indexPath.row;
    kWeakSelf(cell);
    cell.togetherClick = ^(NSInteger index){
        if ([[tourHelper sharedInstance]judgeisLogin]) {
            appS *decodedBag = [tourInfo sharedInstance].UserInfo;
            NSLog(@"自己=%ld cell=%ld",decodedBag.idd,weakcell.UserD.idd);
            if (decodedBag.idd == weakcell.UserD.idd) {
                [MBProgressHUD showPrompt:@"不能选择自己哦～" toView:weakself.view];
            } else {
                [weakself doSomeThing:index];
            }
        }else{
            [MBProgressHUD showPrompt:@"请先登录"];
            login *losgin = [[login alloc]init];
            UINavigationController *nnvc = [[UINavigationController alloc]initWithRootViewController:losgin];;
            [weakself presentViewController:nnvc animated:YES completion:nil];
        }
    };
}
#ifndef CancelStagingVerification_totalThetour
- (void)chekid:(UserS *)one{
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
                [weakself opentoOrderVc:one];
            };
            view.date = date;
            [view windosViewshow];
            [MBProgressHUD hideHUDForView:weakself.view];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD showPrompt:msg];
            [MBProgressHUD hideHUDForView:weakself.view];
        }];
}
#endif
- (void)doSomeThing:(NSInteger)index{
    UserS *one = self.date.travelLinesA[index];
#ifdef CancelStagingVerification_totalThetour
    [self opentoOrderVc:one];
#else
    if (one.isPeriod) {
        if ([tourInfo sharedInstance].UserInfo.isBindingBankCard) {
            [self chekid:one];
        } else {
            kaiqiPopView *liset = [kaiqiPopView new];
            kWeakSelf(self);
            liset.goToRealNameAuthentication = ^(kaiqiPopView_enmu type){
                if (type == go_kaiqiPopView) {
                    realNameAuthenticationVc *vc = [realNameAuthenticationVc new];
                    vc.title = @"实名认证";
                    vc.AuthenticationSuccess = ^(){
                        [weakself chekid:one];
                    };
                    [weakself.navigationController pushViewController:vc animated:YES];
                } else if (type == giveUp_kaiqiPopView) {
                    myOreserFive *vc = [[myOreserFive alloc]init];
                    vc.index = 0;
                    [weakself.navigationController pushViewController:vc animated:YES];
                }
            };
            [liset windosViewshow];
        }
    } else {
        [self opentoOrderVc:one];
    }
#endif
}

- (void)opentoOrderVc:(UserS *)date{
    NSInteger type = 0;
    NSInteger Month = 0;
    BOOL typeBool = NO;
    BOOL MonthBool = NO;
    pricesS *threeTmp;
    for (tourDetaisData_Specifications *one in self.data.Arry_initiateMonthPrice) {
        if ([one.initiateId isEqualToNumber:date.travelSpecificationId]) {
            typeBool = YES;
            for (priceMonthsTwoS *tmp in one.Arry_monthPrice) {
                if ([tmp.month isEqualToString:date.month]) {
                    MonthBool = YES;
                    for (pricesS *three in tmp.Arry_monthPrice) {
                        if ([three.date isEqualToString:date.date]) {
                            threeTmp = three;
                            break;
                        }
                    }
                    break;
                }
                Month++;
            }
            break;
        }
        type++;
    }
    if (!typeBool) {
        type = 0;
    }
    if (!MonthBool) {
        Month = 0;
    }
    if (self.TravelTogether) {
        self.TravelTogether(type,Month,threeTmp);
        [self popSelf];
    }
    
//    if (!self.data.travel.isPeriod && threeTmp) {
//        toOrderVc *vc = [[toOrderVc alloc]init];
//        vc.detailD = self.detailD;
//        vc.startDate = date.date;
//        vc.travelSpecificationId = [date.travelSpecificationId integerValue];
//        [self.navigationController pushViewController:vc animated:YES];
//    }else{
//        if (self.TravelTogether) {
//            self.TravelTogether(type,Month,threeTmp);
//            [self popSelf];
//        }
//    }
    
    
//    [self popSelf];
//    if (self.SelectDate) {
//        self.SelectDate(date);
//    }
}

//- (void)setArryA:(NSArray *)arryA{
//    _arryA = arryA;
//    if (arryA && arryA.count) {
//        [self.tableView reloadData];
//    }
//}
- (UIImageView *)backImageNOne{
    if (!_backImageNOne) {
        UIImageView *backImageNOne = [[UIImageView alloc]init];
        [self.view addSubview:backImageNOne];
        backImageNOne.image = ImageNamed(IMAGE_bigALLBack);
        [backImageNOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(self.view).offset(0);
            make.bottom.equalTo(self.view).offset(0);
        }];
        
        UILabel *labelNone = [[UILabel alloc]init];
        [backImageNOne addSubview:labelNone];
        labelNone.text = @"亲，你是第一个参加旅程的哦";
        labelNone.font = PingFangSC_Medium(14);
        labelNone.textColor = ColorWithHex(0xFFFFFF,0.5);
        labelNone.textAlignment = NSTextAlignmentCenter;
        [labelNone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backImageNOne);
            make.right.equalTo(backImageNOne);
            make.top.equalTo(backImageNOne).offset(130*HEIGHTICON);
        }];
    }
    return _backImageNOne;
}
@end
