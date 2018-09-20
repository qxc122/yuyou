//
//  togetherLY.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "togetherLY.h"
#import "togetherLYCell.h"
#import "toOrderVc.h"
//#import "tourDetai.h"
#import "CusNavigationBar.h"
#import "realNameAuthenticationVc.h"
#import "kaiqiPopView.h"
#import "BindingResults.h"
#import "myOreserFive.h"
#import "tourDetais.h"





@interface togetherLY ()
@property (nonatomic,strong) OtherpeoHome_pageS *date;
//@property (nonatomic,weak) UIImageView *avtor;

@property (nonatomic,weak) CusNavigationBar *cusNavigationBar;
@property (nonatomic,assign) NSIndexPath *index;  //选中了那一个
@end

@implementation togetherLY

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    [self setUI];
    [self.header beginRefreshing];
//    [self.header beginRefreshing];
//
//    UIImageView *avtor = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
//    LRViewRadius(avtor, 36/2.0);
//    LRViewBorder(avtor, 1.0, ColorWithHex(0xFFFFFF, 1.0));
//    IMAGEsetCONTENTMODE(avtor);
////    avtor.image = ImageNamed(@"123");
//    self.avtor = avtor;
//    
//    
//    self.navigationItem.titleView = avtor;
    
//    if (!self.isNumberOfJourneys) {
//        UIBarButtonItem *ok = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(btnok:)];
//        self.navigationItem.rightBarButtonItem = ok;
//    }else{
//
//    }
}

//#pragma  --mark<点击了确定按钮>
//- (void)btnok:(UIBarButtonItem *)barBtn{
//    OtherpeoLcOneS *one = self.date.travelsA[self.index.row];
//    toOrderVc *vc = [[toOrderVc alloc]init];
//    vc.isTogether = YES;
//    vc.traid = one.travelId;
//    vc.startDate = one.date;
//    [self.navigationController pushViewController:vc animated:YES];
//}
- (void)setUI{
    kWeakSelf(self);
    CusNavigationBar *cusNavigationBar =[[CusNavigationBar alloc]init];
    cusNavigationBar.endDaojishi = ^(){
        [weakself popSelf];
    };
    if (!self.isNumberOfJourneys) {
        cusNavigationBar.RightTitleStr = @"确定";
        kWeakSelf(self);
        cusNavigationBar.RightendDaojishi = ^(){
        OtherpeoLcOneS *one = weakself.date.travelsA[weakself.index.row];
#ifdef CancelStagingVerification_togetherLY
            [weakself creatOrder:one];
#else
            if (one.isPeriod) {//是分期的
                if ([tourInfo sharedInstance].UserInfo.isBindingBankCard) {
                    [weakself chekid:one];
                } else {
                    kaiqiPopView *liset = [kaiqiPopView new];
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
                [weakself creatOrder:one];
            }
#endif
        };
    }
    cusNavigationBar.titleImaStr = self.avtorStr;
    self.cusNavigationBar = cusNavigationBar;
    [self.view addSubview:cusNavigationBar];
    [cusNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        if (ScreenHeight==812){
                    make.height.equalTo(@(HEIGHT_NavbarX));
        }else{
            
            make.height.equalTo(@(HEIGHT_Navbar));
        }
    }];

    self.basicTableView.contentInset = UIEdgeInsetsMake(0, 0, 15, 0);
    [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        if (ScreenHeight==812){
                   make.top.equalTo(self.view).offset(HEIGHT_NavbarX);
        }else{
            
            make.top.equalTo(self.view).offset(HEIGHT_Navbar);
        }
        make.bottom.equalTo(self.view).offset(0);
    }];
    [self.basicTableView registerClass:[togetherLYCell class] forCellReuseIdentifier:NSStringFromClass([togetherLYCell class])];
}
#pragma -mark<去 产品详情 页面>
- (void)OpenTourDetaisWith:(OtherpeoLcOneS *)date{
    tourDetais *vc = [tourDetais new];
    vc.idd = date.travelId;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma -mark<去提交订单页面>
- (void)creatOrder:(OtherpeoLcOneS *)date{
    [self OpenTourDetaisWith:date];
//    toOrderVc *vc = [[toOrderVc alloc]init];
//    vc.isTogether = YES;
//    vc.traid = date.travelId;
//    vc.startDate = date.date;
//    [self.navigationController pushViewController:vc animated:YES];
}

#ifndef CancelStagingVerification_togetherLY
#pragma -mark<检查 信用信息>
- (void)chekid:(OtherpeoLcOneS *)date{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
    [[ToolRequest sharedInstance]appuserapprovechecksuccess:^(id dataDict, NSString *msg, NSInteger code) {

        
        RiskVerification *dateRiskVerification = [RiskVerification mj_objectWithKeyValues:dataDict];
        appS *userInfo = [tourInfo sharedInstance].UserInfo;
        userInfo.isPeriodEnabled = dateRiskVerification.fright&&dateRiskVerification.info&&dateRiskVerification.risk;
        [tourInfo sharedInstance].UserInfo = userInfo;
        
        [MBProgressHUD hideHUDForView:weakself.view];
        BindingResults *view = [BindingResults new];
        view.endCountDown = ^(){
            [weakself creatOrder:date];
        };
        view.date = dateRiskVerification;
        [view windosViewshow];
        [MBProgressHUD hideHUDForView:weakself.view];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg];
        [MBProgressHUD hideHUDForView:weakself.view];
    }];
}
#endif

- (void)loadNewData{
    kWeakSelf(self);
    if (weakself.isNumberOfJourneys) {
        [[ToolRequest sharedInstance]apphome_pagetravelledWithuserId:weakself.idd success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.date = [OtherpeoHome_pageS mj_objectWithKeyValues:dataDict];
            [weakself loadNewDataEndHeadsuccessSet:nil code:succes_empty_numV2 footerIsShow:NO totalPages:0];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
        }];
    } else {
        [[ToolRequest sharedInstance]apphome_pagejoinsWithuserId:weakself.idd success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.date = [OtherpeoHome_pageS mj_objectWithKeyValues:dataDict];
            if (weakself.date.travelsA.count == 1) {
                weakself.index = [NSIndexPath indexPathForRow:0 inSection:0];
            }
            [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
            if (code == kRespondCodeSuccess) {
                if (weakself.date.travelsA.count==1) {
                    OtherpeoLcOneS *one = weakself.date.travelsA[0];
                    [weakself OpenTourDetaisWith:one];
                    
//                    toOrderVc *vc = [[toOrderVc alloc]init];
//                    vc.isTogether = YES;
//                    vc.traid = one.travelId;
//                    vc.startDate = one.date;
////                    vc.code = one.date;
////                    vc.travelSpecificationId = one.date;
//                    [weakself.navigationController pushViewController:vc animated:YES];
                }
            } else if (code == kRespondCodeWaring){
                [MBProgressHUD showPrompt:msg];
                [weakself popSelf];
            }
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
        }];
    }
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([togetherLYCell class]) configuration:^(togetherLYCell *cell) {
        [weakself configuretogetherLYCell:cell atIndexPath:indexPath];
    }];
}
#pragma --mark<配置登录后 第一个cell>
- (void)configuretogetherLYCell:(togetherLYCell *)cell atIndexPath:(NSIndexPath *)indexPath {
   cell.one = self.date.travelsA[indexPath.row];
    cell.isNumberOfJourneys = self.isNumberOfJourneys;
    if (self.index.row == indexPath.row && self.index.section == indexPath.section ) {
        cell.isSelected = YES;
    }else{
        cell.isSelected = NO;
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
    return self.date.travelsA.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isNumberOfJourneys) {
        OtherpeoLcOneS *one = self.date.travelsA[indexPath.row];
        [self OpenTourDetaisWith:one];
        
//        tourDetais *tourdetai = [[tourDetais alloc]init];
//        tourdetai.idd = one.travelId;
//        [self.navigationController pushViewController:tourdetai animated:YES];
    } else {
        if (indexPath != self.index) {
            togetherLYCell *cellOld = (togetherLYCell *)[tableView cellForRowAtIndexPath:self.index];
            cellOld.one = self.date.travelsA[self.index.row];
            cellOld.isSelected = NO;
            
            togetherLYCell *cell = (togetherLYCell *)[tableView cellForRowAtIndexPath:indexPath];
            cell.one = self.date.travelsA[indexPath.row];
            cell.isSelected = YES;
            self.index = indexPath;
        }
    }
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    togetherLYCell *cell = [togetherLYCell returnCellWith:tableView];
    [self configuretogetherLYCell:cell atIndexPath:indexPath];
    return  cell;
}
@end
