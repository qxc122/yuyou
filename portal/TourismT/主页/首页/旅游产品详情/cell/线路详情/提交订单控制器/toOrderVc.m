//
//  toOrderVc.m
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "toOrderVc.h"
#import "titleCell.h"
#import "tongyonCell.h"
#import "chuXingrenCell.h"
#import "chuxinrenHead.h"
#import "totalThetour.h"
#import "popularTouer.h"
#import "CommodityAmountCell.h"
#import "lastOk.h"
#import "NSString+check.h"
#import "myCodeYHQ.h"
#import "payOk.h"
#import "WXapi.h"
#import "togetherLY.h"
#import "myOreserDetail.h"
#import "CusNavigationBar.h"
#import "payPopView.h"
#import "StagingList.h"
#import "haveChildren.h"
#import "toOrderVcFootToolForStages.h"
#import "realNameAuthenticationVc.h"
#import "kaiqiPopView.h"
#import "BindingResults.h"
#import "lookWkweb.h"
#import "myOreserFive.h"
#import "Withhold.h"
@interface toOrderVc ()<UIScrollViewDelegate>
@property (nonatomic,weak) CusNavigationBar *cusNavigationBar;
@property (nonatomic,weak) UIImageView *backImage;


//@property (nonatomic,weak) lastOk *lastokView; //再次确认的见面
//@property (nonatomic,weak) payPopView *payPopViewview; // 选支付方式


@property (nonatomic,strong) orderOk *orderok; //
@property (nonatomic,strong) jisuanInfo *jisuanInfodate; //分期明细



@property (nonatomic,weak) toOrderVcFootTool *FootTool;
@property (nonatomic,weak) StagingList *liset;



@property (nonatomic,strong) NSString *payType;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) YHQoneS *YHQSoneDate;//优惠码
@property (nonatomic,strong) NSMutableArray *travellers;//选中的出行人

@property (nonatomic,strong) orderInfo *orderinfoData;//订单信息

@property (nonatomic,strong) ThirdPayment *thirdPayment;//支付成功要用到的信息
@end


@implementation toOrderVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"填写订单";
    self.fd_prefersNavigationBarHidden = YES;
    appS *decodedBag = [tourInfo sharedInstance].UserInfo;
    self.mobile = decodedBag.mobile;
    // Do any additional setup after loading the view.
    self.travellers = [NSMutableArray array];
    UIImageView *backImage = [[UIImageView alloc]init];
    self.backImage = backImage;
    backImage.image = ImageNamed(IMAGE_bigALLBack);
    IMAGEsetCONTENTMODE(backImage);
    [self.view addSubview:backImage];
    [self.view sendSubviewToBack:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    kWeakSelf(self);
    CusNavigationBar *cusNavigationBar =[[CusNavigationBar alloc]init];
    cusNavigationBar.endDaojishi = ^(){
        [weakself popSelf];
    };

    cusNavigationBar.titleStr = @"填写订单";
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
    self.basicTableView.backgroundColor = [UIColor clearColor];
    [self.basicTableView registerClass:[titleCell class] forCellReuseIdentifier:NSStringFromClass([titleCell class])];
    [self.basicTableView registerClass:[chuXingrenCell class] forCellReuseIdentifier:NSStringFromClass([chuXingrenCell class])];
    [self.basicTableView registerClass:[CommodityAmountCell class] forCellReuseIdentifier:NSStringFromClass([CommodityAmountCell class])];
//    [tableView registerClass:[tongyonCell class] forCellReuseIdentifier:NSStringFromClass([tongyonCell class])];
    [self.basicTableView registerClass:[haveChildren class] forCellReuseIdentifier:NSStringFromClass([haveChildren class])];
    [self.basicTableView registerClass:[CommodityAmountNoneCell class] forCellReuseIdentifier:NSStringFromClass([CommodityAmountNoneCell class])];
    [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        if (ScreenHeight==812){
            make.top.equalTo(self.view).offset(HEIGHT_NavbarX);
        }else{
            
            make.top.equalTo(self.view).offset(HEIGHT_Navbar);
        }
        make.bottom.equalTo(self.view).offset(-HEIGHT_NEXTBTN);
    }];
    
    //set
//    priceTitle.text = @"总价";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatPayStateCan:) name:wechatPayState object:nil];
    //test
//    self.price.text = @"￥5250";
    [self.header beginRefreshing];
    if (!self.code || !self.code.length) {
        self.code = NoStagingString;
    }
}

#pragma  -mark<微信支付>
- (void)wechatPayStateCan:(NSNotification *)user{
    NSDictionary *dic = user.userInfo;
    NSString *code = dic[wechatPayState];
    if ([code intValue] == WXSuccess) {
        [self OpenpayOkVc];
    }else{
        [self openMydingdxiangq];
    }
}
#pragma  -mark<打开付款完成 控制器>
- (void)OpenpayOkVc{
    if (self.orderinfoData.travelD.isPeriod) {
        NSNotification *notification =[NSNotification notificationWithName:wechatPayfenqiState object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
    payOk *vc = [[payOk alloc]init];
    // 解档
    vc.thirdPayment = self.thirdPayment;
    
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)openMydingdxiangq{
    myOreserDetail *vc = [[myOreserDetail alloc]init];
    //vc.isPlaceOrder = YES;
    vc.classNmae = [self class];
    orderlistForOneS *one = [[orderlistForOneS alloc]init];
    one.idd = self.orderok.idd;
    //vc.type = TOPAY_myOreserFiveAll_type;
    vc.datess = one;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0) {
        self.cusNavigationBar.hidenBack = NO;
    }else{
        self.cusNavigationBar.hidenBack = YES;
    }
}

- (void)loadNewData{
    NSInteger travelId;
    if (self.isTogether) {
        travelId  =self.traid;
    } else {
        travelId = self.traid?self.traid:self.detailD.travelD.idd;
    }
    kWeakSelf(self);
    [[ToolRequest sharedInstance]orderinfoWithtravelId:travelId date:self.startDate periodNum:[self.code integerValue] travelSpecificationId:self.travelSpecificationId success:^(id dataDict, NSString *msg, NSInteger code) {
        if (code == kRespondCodeSuccess) {
            weakself.orderinfoData = [orderInfo mj_objectWithKeyValues:dataDict];
            //                [weakself setPriceLabel:weakself.orderinfoData.travelD.price];
            if (weakself.orderinfoData.defaultTravellerD) {
                weakself.travellers = [NSMutableArray arrayWithObject:weakself.orderinfoData.defaultTravellerD];
            }
            [weakself jisuanPrice];
            
            if (weakself.orderinfoData.travelD.isPeriod && ![weakself.code isEqualToString:NoStagingString]) {
                weakself.FootTool.priceStr = weakself.orderinfoData.firstRepayment;
            } else {
                weakself.FootTool.priceStr = [NSString stringWithFormat:@"%0.f",[weakself.orderinfoData.amount doubleValue]];
            }
            
            
            //                weakself.FootTool.priceStr = weakself.orderinfoData.firstRepayment;
            //                weakself.price.text = [NSString stringWithFormat:@"¥%.2f",weakself.orderinfoData.travelD.price];
            //TODO
            weakself.orderinfoData.defaultPaymentPlugin = PayType_WX;
            //TODO
            //                weakself.orderinfoData.adultNum = nil;
            //                weakself.orderinfoData.adultPrice = nil;
            //                weakself.orderinfoData.agreement = nil;
            if (weakself.orderinfoData.defaultPaymentPlugin && weakself.orderinfoData.defaultPaymentPlugin.length) {
                weakself.payType = weakself.orderinfoData.defaultPaymentPlugin;
            }else{
                weakself.payType = PayType_WX;
            }
            weakself.FootTool.hidden = NO;
            weakself.IsLoadSuccessfully = YES;
            weakself.backImage.hidden = NO;
   
            [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
        }else if (code == kRespondCodeWaring){
            [MBProgressHUD showPrompt:msg];
            [weakself popSelf];
        }
    } failure:^(NSInteger errorCode, NSString *msg) {
        weakself.backImage.hidden = YES;
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];;
}

#pragma -mark<提交订单 按钮>
- (void)nextbtnClick{
    if (self.liset) {
        [self.liset removeFromSuperview];
    }
    NSMutableArray *muarry = [NSMutableArray array];
    for (travellerS *trPeo in self.travellers) {
        [muarry addObject:@(trPeo.idd)];
    }
    
    if (![NSString checkTelNumber:self.mobile]) {
        [MBProgressHUD showPrompt:@"请输入正确的手机号" toView:self.view];
        return;
    }
    NSLog(@"11111===self.payType=%@ self.mobile=%@ self.startDate=%@",self.payType,self.mobile,self.startDate);
    if (!muarry.count) {
        [MBProgressHUD showPrompt:@"请添加出行人" toView:self.view];
        return;
    }
    if (self.orderinfoData.travelD.isPeriod && ![self.code isEqualToString:NoStagingString] && (![tourInfo sharedInstance].UserInfo.isBindingBankCard || ![tourInfo sharedInstance].UserInfo.isPeriodEnabled)) {//是分期的
        if ([tourInfo sharedInstance].UserInfo.isBindingBankCard) {
            [self chekid];
        } else {
            kaiqiPopView *liset = [kaiqiPopView new];
            kWeakSelf(self);
            liset.goToRealNameAuthentication = ^(kaiqiPopView_enmu type){
                if (type == go_kaiqiPopView) {
                    realNameAuthenticationVc *vc = [realNameAuthenticationVc new];
                    vc.title = @"实名认证";
                    vc.AuthenticationSuccess = ^(){
                        [weakself chekid];
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
        [self creatOrder];
    }
}

#pragma -mark<请求接口  弹出 最后确认 界面>
- (void)creatOrder{
    NSMutableArray *muarry = [NSMutableArray array];
    for (travellerS *trPeo in self.travellers) {
        [muarry addObject:@(trPeo.idd)];
    }
    
    if (![NSString checkTelNumber:self.mobile]) {
        [MBProgressHUD showPrompt:@"请输入正确的手机号" toView:self.view];
        return;
    }
    NSLog(@"11111===self.payType=%@ self.mobile=%@ self.startDate=%@",self.payType,self.mobile,self.startDate);
    if (!muarry.count) {
        [MBProgressHUD showPrompt:@"请添加出行人" toView:self.view];
        return;
    }
    
    NSLog(@"2222==self.payType=%@ self.mobile=%@ self.startDate=%@",self.payType,self.mobile,self.startDate);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
    kWeakSelf(self);
    NSLog(@"33333====self.payType=%@ self.mobile=%@ self.startDate=%@",self.payType,self.mobile,self.startDate);
    [[ToolRequest sharedInstance]ordercreateWithpaymentPluginId:nil mobile:self.mobile travelId:self.detailD?self.detailD.travelD.idd:self.traid travelSpecificationId:self.travelSpecificationId travellers:muarry date:self.startDate couponCode:self.YHQSoneDate.code periodNum:[self.code integerValue] success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.orderok = [orderOk mj_objectWithKeyValues:dataDict];
        lastOk *lastokView = [[lastOk alloc]init];
        lastokView.code = weakself.code;
        lastokView.TemporaryPaymentClick = ^(btnlastOk_ENMU type){
            [weakself ClickZhifuAndNoneZhifu:type];
        };
        lastokView.payType = weakself.payType;
        lastokView.orderok = weakself.orderok;
        lastokView.orderinfoData = weakself.orderinfoData;
        [lastokView windosViewshow];
        [MBProgressHUD hideHUDForView:weakself.view];
        
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}

#pragma -mark<点击暂不支付  和  支付按钮>
- (void)ClickZhifuAndNoneZhifu:(btnlastOk_ENMU )type{
    if (type == left_btnlastOk_ENMU) { //不支付
        [MobClick event:zanbuzhifu];
        [self openMydingdxiangq];

    }else if (type == right_btnlastOk_ENMU){
        [MobClick event:zhifu];
        [self payView];
    }
}
- (void)payView{
    Withhold *view;
    if (self.orderinfoData.travelD.isPeriod && ![self.code isEqualToString:NoStagingString]) {
        view= [Withhold new];
        view.orderok = self.orderok;
    } else {
        view= [payPopView new];
    }
    view.code = self.code;
    view.orderinfoData = self.orderinfoData;
    kWeakSelf(self);
    view.GOPayMode = ^(NSString *type){
        if (type && type.length) {
            [weakself pay];
        }else{
            [weakself WithholdPayPre];
        }
    };
    view.noPay = ^(){
        [weakself openMydingdxiangq];
    };
    [view windosViewshow];
}

#pragma --mark<代扣 钱提示>
- (void)WithholdPayPre{
    kWeakSelf(self);
    XAlertView *alert = [[XAlertView alloc]initWithTitle:@"提示" message:self.orderok.debitNotice clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
        if (canceled) {
            [weakself openMydingdxiangq];
        }else{
            [weakself WithholdPay];
        }
    } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

#pragma --mark<代扣>
- (void)WithholdPay{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
    [[ToolRequest sharedInstance]apppaymentdebitWithSn:self.orderok.sn type:PayTypepayment success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD showPrompt:msg];
        [MBProgressHUD hideHUDForView:weakself.view];
        weakself.thirdPayment = [ThirdPayment mj_objectWithKeyValues:dataDict];
        [weakself performSelector:@selector(OpenpayOkVc) withObject:nil afterDelay:0.3];
        NSNotification *notification =[NSNotification notificationWithName:Withholdingsuccess object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg];
        [MBProgressHUD hideHUDForView:weakself.view];
        [weakself performSelector:@selector(openMydingdxiangq) withObject:nil afterDelay:0.3];
    }];
    
    
//    kWeakSelf(self);
//    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
//    [[ToolRequest sharedInstance]apporderperiod_first_debitWithSn:[NSString stringWithFormat:@"%ld",(long)self.orderok.sn] success:^(id dataDict, NSString *msg, NSInteger code) {
//        [MBProgressHUD showPrompt:msg];
//        [MBProgressHUD hideHUDForView:weakself.view];
//        weakself.thirdPayment = [ThirdPayment mj_objectWithKeyValues:dataDict];
//        [weakself performSelector:@selector(OpenpayOkVc) withObject:nil afterDelay:0.3];
//    } failure:^(NSInteger errorCode, NSString *msg) {
//        [MBProgressHUD showPrompt:msg];
//        [MBProgressHUD hideHUDForView:weakself.view];
//        [weakself performSelector:@selector(openMydingdxiangq) withObject:nil afterDelay:0.3];
//    }];
}

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
                [weakself creatOrder];
            };
            view.date = date;
            [view windosViewshow];
            [MBProgressHUD hideHUDForView:weakself.view];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD showPrompt:msg];
            [MBProgressHUD hideHUDForView:weakself.view];
        }];
    } else {
        [self creatOrder];
    }
}

- (void)pay{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
    [[ToolRequest sharedInstance]paymentsubmitWithpaymentPluginId:self.payType sn:self.orderok.sn type:PayTypepayment success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD hideHUDForView:weakself.view];
        
        ThirdPayment *thirdPayment = [ThirdPayment mj_objectWithKeyValues:dataDict];
        weakself.thirdPayment  =thirdPayment;
        
        if ([weakself.payType isEqualToString:PayType_Twallet]) {
            if (thirdPayment.businessID && thirdPayment.businessName && thirdPayment.businessType && thirdPayment.supportTcoin && thirdPayment.businessID.length && thirdPayment.businessName.length && thirdPayment.businessType.length && thirdPayment.supportTcoin.length) {
                NSDictionary *datajsonData = @{
                                               @"businessID":thirdPayment.businessID,
                                               @"businessType":thirdPayment.businessType,
                                               @"businessName":thirdPayment.businessName,
                                               @"money":@(thirdPayment.money),
                                               @"supportTcoin":thirdPayment.supportTcoin,
                                               };
                [[tourHelper  sharedInstance]tPayMethod:datajsonData];
            } else {
                [MBProgressHUD showPrompt:@"服务器返回缺少参数"];
            }
        }else if ([weakself.payType isEqualToString:PayType_WX]) {
            if(![WXApi isWXAppInstalled]) {
                [MBProgressHUD showPrompt:@"您还没有安装微信客户端哦"];
            }else{
                // 归档
                if (thirdPayment.appid && thirdPayment.partnerid && thirdPayment.prepayid && thirdPayment.noncestr && thirdPayment.package && thirdPayment.sign && thirdPayment.appid.length && thirdPayment.partnerid.length && thirdPayment.prepayid.length && thirdPayment.noncestr.length && thirdPayment.package.length && thirdPayment.sign.length) {
                    [WXApi registerApp:dataDict[@"appid"]];
                    
                    NSNumber *timeStamp = dataDict[@"timestamp"];
                    PayReq *req = [[PayReq alloc] init];
                    req.openID =dataDict[@"appid"];
                    req.partnerId = dataDict[@"partnerid"];
                    req.prepayId = dataDict[@"prepayid"];
                    req.nonceStr = dataDict[@"noncestr"];
                    req.timeStamp = [timeStamp unsignedIntValue];
                    req.package = dataDict[@"package"];
                    req.sign = dataDict[@"sign"];
                    [WXApi sendReq:req];
                }else{
                    [MBProgressHUD showPrompt:@"服务器返回缺少参数"];
                }
            }
        }
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg];
        [MBProgressHUD hideHUDForView:weakself.view];
    }];
}

- (void)goPayWithType:(NSString *)type{
    self.payType = type;
    if (self.orderinfoData.travelD.isPeriod) {
        [self chekid];
    } else {
        [self pay];
    }
}

#pragma -mark<cell 的 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            CGFloat height1 = [NSString HeightForText:self.orderinfoData.travelD.name withFont:PingFangSC_Medium(16) withTextWidth:ScreenWidth - 60];
            return 75 + height1;
//            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([titleCell class]) configuration:^(titleCell *cell) {
//                [weakself configuretitleCell:cell atIndexPath:indexPath];
//            }];
        }
//        else if (indexPath.row == 1){
//            return 65;
//        }
    } else if (indexPath.section == 1){
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([chuXingrenCell class]) configuration:^(chuXingrenCell *cell) {
            [weakself configurechuXingrenCell:cell atIndexPath:indexPath];
        }];
    } else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            return 65;
        } else {
            CGFloat adultHeight = [NSString HeightForText:self.orderinfoData.adultPrice withFont:PingFangSC_Regular(14) withTextWidth:(ScreenWidth-30-15-30-20-5-50-15-30)];
            CGFloat childHeight = [NSString HeightForText:self.orderinfoData.childPrice withFont:PingFangSC_Regular(14) withTextWidth:(ScreenWidth-30-15-30-20-5-50-15-30)];
            CGFloat xieyi = 0;
            if (self.orderinfoData.agreement.count) {
                NSString *text = @"我已阅读并同意 ";
                NSInteger index = 0;
                for (agreementS *one in self.orderinfoData.agreement) {
                    text = [text stringByAppendingString:one.name];
                    if (index != self.orderinfoData.agreement.count) {
                        text = [text stringByAppendingString:@"   "];
                    }
                    index++;
                }
                xieyi = [NSString HeightForText:text withFont:PingFangSC_Regular(12) withTextWidth:(ScreenWidth-30)];
                xieyi = xieyi;
            }

            CGFloat cellHeight = 0;
            if (self.orderinfoData.adultNum && self.orderinfoData.adultNum.length && self.orderinfoData.adultPrice && self.orderinfoData.adultPrice.length && self.orderinfoData.childNum && self.orderinfoData.childNum.length && self.orderinfoData.childPrice && self.orderinfoData.childPrice.length) {
                cellHeight = adultHeight+childHeight+xieyi+45+15+32+32+200+xieyi+15+2+21;
//                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([haveChildren class]) configuration:^(haveChildren *cell) {
//                    [weakself configurehaveChildren:cell atIndexPath:indexPath];
//                }];
            } else if ((self.orderinfoData.adultNum && self.orderinfoData.adultNum.length && self.orderinfoData.adultPrice && self.orderinfoData.adultPrice.length) || (self.orderinfoData.childNum && self.orderinfoData.childNum.length && self.orderinfoData.childPrice && self.orderinfoData.childPrice.length)) {
                cellHeight = adultHeight+childHeight+xieyi+45+15+32+200+xieyi+15+2+21;
//                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([CommodityAmountCell class]) configuration:^(CommodityAmountCell *cell) {
//                    [weakself configureCommodityAmountCell:cell atIndexPath:indexPath];
//                }];
            } else if (!self.orderinfoData.adultNum && !self.orderinfoData.adultNum.length && !self.orderinfoData.adultPrice && !self.orderinfoData.adultPrice.length && !self.orderinfoData.childNum && !self.orderinfoData.childNum.length && !self.orderinfoData.childPrice && !self.orderinfoData.childPrice.length) {
//                return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([CommodityAmountNoneCell class]) configuration:^(CommodityAmountNoneCell *cell) {
//                    [weakself configureCommodityAmountNoneCell:cell atIndexPath:indexPath];
//                }];
                cellHeight = adultHeight+childHeight+xieyi+200+xieyi+15+21;
            }
            return cellHeight;
        }

    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.empty_typeV2 == succes_empty_numV2) {
        if (section == 1) {
            return 65;
        }
        return 0.001;
    }

    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.empty_typeV2 == succes_empty_numV2) {
        if (section == 0) {
            return 1;
//            return 2;
        } else if (section == 1){
            return [self.travellers count];
        } else if (section == 2){
            return 2;
        }
    }
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView
    viewForHeaderInSection:(NSInteger)section{
    if (self.IsLoadSuccessfully) {
        if (section == 1) {
            chuxinrenHead *head = [[chuxinrenHead alloc]init];
            kWeakSelf(self);
            head.moreCXRClick = ^(){
                popularTouer *vc = [[popularTouer alloc]init];
                vc.idType = weakself.detailD.travelD.type;
                vc.travellers = [weakself.travellers mutableCopy];
                vc.SelectedTravellers = ^(NSMutableArray *travellers){
                    weakself.travellers = travellers;
                    NSIndexSet *set = [NSIndexSet indexSetWithIndex:1];
                    [weakself.basicTableView reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
                    [weakself jisuanPrice];
                };
                vc.eidtTravellers = ^(travellerS *peo){
                    NSInteger index=0;
                    for (travellerS *peoTmp in weakself.travellers) {
                        if (peoTmp.idd == peo.idd) {
                            [weakself.travellers replaceObjectAtIndex:index withObject:peo];
                            [weakself.basicTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
                            break;
                        }
                        index++;
                    }
                };
                vc.deletTravellers = ^(travellerS *peo){
                    NSInteger index=0;
                    for (travellerS *peoTmp in weakself.travellers) {
                        if (peoTmp.idd == peo.idd) {
                            [weakself.travellers removeObjectAtIndex:index];
                            
                            NSIndexSet *set = [NSIndexSet indexSetWithIndex:1];
                            [weakself.basicTableView reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
                            
//                            [weakself.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
                            [weakself jisuanPrice];
                            break;
                        }
                        index++;
                    }
                };
                [weakself.navigationController pushViewController:vc animated:YES];
            };
            return head;
        }
    }

    return nil;
}
#pragma  -mark<实时计算价格>
- (void)jisuanPrice{
    kWeakSelf(self);
    NSMutableArray *muarry = [NSMutableArray array];
    for (travellerS *trPeo in self.travellers) {
        [muarry addObject:@(trPeo.idd)];
    }
    if (1) {
        NSInteger travelId=0;
        if (self.detailD) {
            travelId = weakself.detailD.travelD.idd;
        }else{
            travelId = self.traid;
        }
        [MBProgressHUD showLoadingMessage:@"计算价格中..." toView:self.view];
        [[ToolRequest sharedInstance]ordercalculateWithtravelId:travelId travelSpecificationId:self.travelSpecificationId travellers:muarry  date:self.startDate couponCode:self.YHQSoneDate.code periodNum:[self.code integerValue] success:^(id dataDict, NSString *msg, NSInteger code) {
            jisuanInfo *jisuanInfodate = [jisuanInfo mj_objectWithKeyValues:dataDict];
            weakself.jisuanInfodate = jisuanInfodate;
            [MBProgressHUD hideHUDForView:weakself.view];
//            weakself.price.text = [NSString stringWithFormat:@"¥%.2f",[proc doubleValue]];
            weakself.orderinfoData.discount = jisuanInfodate.discount;
            weakself.orderinfoData.amount = jisuanInfodate.amount;
            weakself.orderinfoData.firstRepayment = jisuanInfodate.firstRepayment;
            weakself.orderinfoData.adultPrice = jisuanInfodate.adultPrice;
            weakself.orderinfoData.adultNum = jisuanInfodate.adultNum;
            weakself.orderinfoData.childPrice = jisuanInfodate.childPrice;
            weakself.orderinfoData.childNum = jisuanInfodate.childNum;
            if (weakself.orderinfoData.travelD.isPeriod && ![weakself.code isEqualToString:NoStagingString]) {
                weakself.FootTool.priceStr = jisuanInfodate.firstRepayment; 
            } else {
                weakself.FootTool.priceStr = [NSString stringWithFormat:@"%.2f",[jisuanInfodate.amount doubleValue]];
            }
            [weakself.basicTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:2]] withRowAnimation:UITableViewRowAnimationNone];
        } failure:^(NSInteger errorCode, NSString *msg) {
//            if (weakself.travellers.count) {
//                [weakself.travellers removeAllObjects];
//            }
//            [weakself.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:2]] withRowAnimation:UITableViewRowAnimationNone];
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
        }];
    }else{
//        weakself.FootTool.priceStr = @"0.00";
//        weakself.price.text = @"¥0.00";
    }
}
#pragma  -mark<配置  商品信息 只有成人 cell>
- (void)configureCommodityAmountCell:(CommodityAmountCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self configureCommodityAmountNoneCell:cell atIndexPath:indexPath];
    cell.orderinfoData = self.orderinfoData;
}
#pragma  -mark<配置  商品信息 还有儿童 cell>
- (void)configurehaveChildren:(haveChildren *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self configureCommodityAmountCell:cell atIndexPath:indexPath];
}
#pragma  -mark<配置  商品信息 无出行人 cell>
- (void)configureCommodityAmountNoneCell:(CommodityAmountNoneCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.orderinfoData = self.orderinfoData;
    cell.goToSlecetYHQ = ^(){
        myCodeYHQ *vc = [[myCodeYHQ alloc]init];
        if (weakself.isTogether) {
            vc.travelId = weakself.traid;
        } else {
            vc.travelId = weakself.detailD.travelD.idd;
        }
        vc.btnClick = ^(YHQoneS *YHQSoneDate){
            weakself.YHQSoneDate = YHQSoneDate;
            [weakself jisuanPrice];
            [weakself.basicTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [weakself.navigationController pushViewController:vc animated:YES];
    };
    cell.goToViewXieYi = ^(NSURL *url){
        lookWkweb *vc = [[lookWkweb alloc]init];
        vc.url = [url absoluteString];
        vc.IsHaveshareBtn = NO;
        [weakself.navigationController pushViewController:vc animated:YES];
    };
    
    cell.YHQSoneDate = self.YHQSoneDate;
}

#pragma  -mark<通用 cell>
- (void)configuretongyonCell:(tongyonCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.textClick = ^(NSString *input){
        weakself.mobile = input;
    };
    cell.title = @"联系电话";
    cell.des = @"用于商家联系您接受预订信息";
    cell.desOk = self.mobile;
    cell.hidenMidle = NO;
    cell.hidenMore = YES;
    cell.hidenyouhui = YES;
    cell.userEnaMidle = YES;
}


#pragma  -mark<配置第一个  cell>
- (void)configuretitleCell:(titleCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.isPeriod = self.orderinfoData.travelD.isPeriod;
    cell.reselectDateClick = ^(NSString *startDate){
        weakself.startDate = startDate;
        [weakself jisuanPrice];
    };
    cell.startTime = self.startDate;
    cell.titleStr = self.orderinfoData.travelD.name;
    cell.startPlace = self.orderinfoData.travelD.fromCitysA;
    cell.priceMonthsA = self.detailD.priceMonthsA;
}
#pragma  -mark<配置 出行人  cell>
- (void)configurechuXingrenCell:(chuXingrenCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.peopleOne = self.travellers[indexPath.row];
    cell.index = indexPath.row;
    cell.btnDeleClick = ^(NSInteger index){
        if (weakself.travellers.count == 1) {
            [MBProgressHUD showPrompt:@"至少保留一个" toView:weakself.view];
            
        }else{
            [weakself.travellers removeObjectAtIndex:index];
            
            [weakself.basicTableView beginUpdates];
            NSIndexPath *tmpPath = [NSIndexPath indexPathForRow:index inSection:1];
            [weakself.basicTableView deleteRowsAtIndexPaths:@[tmpPath] withRowAnimation:UITableViewRowAnimationLeft];
            [weakself.basicTableView endUpdates];
            NSIndexSet *set = [[NSIndexSet alloc]initWithIndex:1];
            [weakself.basicTableView reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
            [weakself jisuanPrice];
        }
    };
}
#pragma  -mark<创建cell>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
         if (indexPath.row == 0) {
             titleCell *cell = [titleCell returnCellWith:tableView];
             [self configuretitleCell:cell atIndexPath:indexPath];
             return cell;
         }
//         else if (indexPath.row == 1){
//             tongyonCell *cell = [tongyonCell returnCellWith:tableView];
//             cell.title = @"同团旅友";
//             cell.desOk = nil;
//             cell.des = @"快来看看和你同团的小伙伴吧";
//             cell.userEnaMidle = NO;
//             cell.hidenMore = NO;
//             cell.hidenyouhui = YES;
//             return cell;
//         }
     } else if (indexPath.section == 1){
         chuXingrenCell *cell = [chuXingrenCell returnCellWith:tableView];
         [self configurechuXingrenCell:cell atIndexPath:indexPath];
         return cell;
     } else if (indexPath.section == 2){
         if (indexPath.row == 0) {
             tongyonCell *cell = [tongyonCell returnCellWith:tableView];
             [self configuretongyonCell:cell atIndexPath:indexPath];
             return cell;
         }else if (indexPath.row == 1){
             if (self.orderinfoData.adultNum && self.orderinfoData.adultNum.length && self.orderinfoData.adultPrice && self.orderinfoData.adultPrice.length && self.orderinfoData.childNum && self.orderinfoData.childNum.length && self.orderinfoData.childPrice && self.orderinfoData.childPrice.length) {
                 haveChildren *cell = [haveChildren returnCellWith:tableView];
                 [self configurehaveChildren:cell atIndexPath:indexPath];
                 return cell;
             } else if ((self.orderinfoData.adultNum && self.orderinfoData.adultNum.length && self.orderinfoData.adultPrice && self.orderinfoData.adultPrice.length) || (self.orderinfoData.childNum && self.orderinfoData.childNum.length && self.orderinfoData.childPrice && self.orderinfoData.childPrice.length)) {
                 CommodityAmountCell *cell = [CommodityAmountCell returnCellWith:tableView];
                 [self configureCommodityAmountCell:cell atIndexPath:indexPath];
                 return cell;
                 
             } else if (!self.orderinfoData.adultNum && !self.orderinfoData.adultNum.length && !self.orderinfoData.adultPrice && !self.orderinfoData.adultPrice.length && !self.orderinfoData.childNum && !self.orderinfoData.childNum.length && !self.orderinfoData.childPrice && !self.orderinfoData.childPrice.length) {
                 CommodityAmountNoneCell *cell = [CommodityAmountNoneCell returnCellWith:tableView];
                 [self configureCommodityAmountNoneCell:cell atIndexPath:indexPath];
                 return cell;
             }
         }
     }
    NSLog(@"indexPath。row=%ld  %ld",indexPath.row,indexPath.section);
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ceoi"];
     if (!cell) {
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ceoi"];
     }
     return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section == 0) {
//        if (indexPath.row == 0) {
//            
//        } else if (indexPath.row == 1){
//            totalThetour *vc = [[totalThetour alloc]init];
//            vc.detailD = self.detailD;
//            vc.traid = self.traid;
//            vc.isHidenBtn = YES;
//            [self.navigationController pushViewController:vc animated:YES];
//        }
    } else if (indexPath.section == 1){

    } else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            
        } else if (indexPath.row == 1){
//            feesView *viewT = [[feesView alloc]init];
//            viewT.feesA = self.orderinfoData.feesA;
//            [viewT windosViewshow];
        } else if (indexPath.row == 2){
//            mustKnow *viewT = [[mustKnow alloc]init];
//            viewT.desUrl = self.orderinfoData.travelD.bookingNotes;
//            [viewT windosViewshow];
        } else if (indexPath.row == 3){
            myCodeYHQ *vc = [[myCodeYHQ alloc]init];
            if (self.isTogether) {
                vc.travelId = self.traid;
            } else {
                vc.travelId = self.detailD.travelD.idd;
            }
            vc.btnClick = ^(YHQoneS *YHQSoneDate){
                weakself.YHQSoneDate = YHQSoneDate;
                NSIndexPath *path = [NSIndexPath indexPathForRow:3 inSection:2];
                [weakself.basicTableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
                [weakself jisuanPrice];
            };
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma --mark<处理从  与游控制器过来的事件>
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isTogether) {
        NSMutableArray *muArry =[self.navigationController.viewControllers mutableCopy];
        for (UIViewController *vc in muArry) {
            if ([vc isKindOfClass:[togetherLY class]]) {
                [muArry removeObject:vc];
                self.navigationController.viewControllers = muArry;
                break;
            }
        }
    }
}
- (toOrderVcFootTool *)FootTool{
    if (!_FootTool) {
        toOrderVcFootTool *tool;
        if (self.orderinfoData.travelD.isPeriod && ![self.code isEqualToString:NoStagingString]) {
            tool = [toOrderVcFootToolForStages new];
        } else {
            tool = [toOrderVcFootTool new];
        }
//        toOrderVcFootTool *tool = [toOrderVcFootTool new];
//        toOrderVcFootToolForStages *tool = [toOrderVcFootToolForStages new];
        _FootTool = tool;
        kWeakSelf(self);
        tool.btnClick = ^(toOrderVcFootTool_btnEnum type){
            if (type == next_toOrderVcFootTool_btnEnum) {
                [weakself nextbtnClick];
                [MobClick event:tijdingddianta];
            } else if (type == view_toOrderVcFootTool_btnEnum) {
                 [MobClick event:uyryuxcv];
                if (weakself.jisuanInfodate) {
                    if (weakself.liset) {
                        //                    tool.isUp = YES;
                        [weakself.liset closeClisck];
                    } else {
                        StagingList *liset = [StagingList new];
                        liset.jisuanInfodate = self.jisuanInfodate;
                        //                    tool.isUp = NO;
                        weakself.liset = liset;
                        [liset windosViewshow];
                    }
                }else{
                    [MBProgressHUD showPrompt:@"请先添加出游人～" toView:weakself.view];
                }

            }
        };
        [self.view addSubview:tool];
        [tool mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view);
            make.top.equalTo(self.basicTableView.mas_bottom);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
        }];
    }
    return _FootTool;
}
@end
