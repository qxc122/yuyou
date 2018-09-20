//
//  myOreserDetail.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOreserDetail.h"
#import "mainDetailCell.h"
#import "peopeoToCell.h"
#import "ordermyOreserDetailCell.h"
#import "sectonHead.h"
#import "myOrDetailTabHeadLine.h"
#import "daojishi.h"
#import "imageStaue.h"
#import "toPayHead.h"
#import "WXApi.h"
#import "querenTuiKuan.h"

#import "toOrderVc.h"
#import "payOk.h"
#import "kaiqiPopView.h"
#import "realNameAuthenticationVc.h"
#import "BindingResults.h"
#import "CusNavigationBar.h"
#import "cancel.h"
#import "sysPhto.h"
typedef NS_ENUM(NSInteger, myOreserDetail_btn_enm)
{
    pingjia_myOreserDetail_btn_enm,//评价
    pay_myOreserDetail_btn_enm,//付款
};
#define myOreserDetailHEIGHT_NEXTBTN  50
#define kHEIGHT  149.f  //213.f

@interface myOreserDetail ()
@property (nonatomic,strong) orderDeatailS *detail;
@property (nonatomic,weak) UILabel *price;//价格
@property (nonatomic,weak) UILabel *priceTitle;//总价还是首付
@property (nonatomic,weak) UIButton *nextbtn;

@property (nonatomic,weak) UIView *bottomView;
@property (nonatomic,weak) CusNavigationBar *cusNavigationBar;


@property (nonatomic,strong) NSString *paymentMethod;  //付款方式

@property (nonatomic,strong) ThirdPayment *thirdPayment;
@end



@implementation myOreserDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"订单详情";
    self.fd_prefersNavigationBarHidden = YES;

    [self setUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatPayStateCan:) name:wechatPayState object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(needRefremydingdangFunc:)
                                                 name:pingjialemydingdang
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(needRefremydingdangFunc:)
                                                 name:needRefremydingdang
                                               object:nil];
//    if (self.type == TOPAY_myOreserFiveAll_type) {
//
//    }else if (self.type == toGo_myOreserFiveAll_type) {
//    }
//    if ([self.datess.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str] || [self.datess.orderStatus isEqualToString:tuikuang_myOreserFiveAll_type_str]) {
//        self.fd_prefersNavigationBarHidden = YES;
//    }
    [self.header beginRefreshing];
}

//- (void)dealloc{
//    NSNotification *notification =[NSNotification notificationWithName:needRefremydingdang object:nil userInfo:nil];
//    [[NSNotificationCenter defaultCenter] postNotification:notification];
//}

/**
 UIColor 转UIImage
 */
//- (UIImage*) createImageWithColor: (UIColor*) color
//{
//    CGRect rect=CGRectMake(0,0, 1, 1);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return theImage;
//}

#pragma  -mark<微信支付>
- (void)wechatPayStateCan:(NSNotification *)user{
    NSDictionary *dic = user.userInfo;
    NSString *code = dic[wechatPayState];
    if ([code intValue] == WXSuccess) {

        NSNotification *notification2 =[NSNotification notificationWithName:wechatPayfenqiState object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification2];
        
        
        [self postNoticationNeedRefremydingdang];
        
        self.isNeedRefreth = YES;

        
//        payOk *vc = [[payOk alloc]init];
//        // 解档
//        vc.thirdPayment = self.thirdPayment;
//        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)postNoticationNeedRefremydingdang{
    NSNotification *notification =[NSNotification notificationWithName:needRefremydingdang object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
- (void)needRefremydingdangFunc:(NSNotification *)user{
    self.basicTableView.mj_header.hidden = NO;
    [self.basicTableView.mj_header beginRefreshing];
}
- (void)setUI{
    kWeakSelf(self);
    CusNavigationBar *cusNavigationBar =[[CusNavigationBar alloc]init];
    cusNavigationBar.endDaojishi = ^(){
        [weakself popSelf];
    };
    self.cusNavigationBar = cusNavigationBar;
    [self.view addSubview:cusNavigationBar];
    cusNavigationBar.titleStr = @"订单详情";
    
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
    
    [self.basicTableView registerClass:[mainDetailCell class] forCellReuseIdentifier:NSStringFromClass([mainDetailCell class])];
    [self.basicTableView registerClass:[peopeoToCell class] forCellReuseIdentifier:NSStringFromClass([peopeoToCell class])];
    [self.basicTableView registerClass:[ordermyOreserDetailCell class] forCellReuseIdentifier:NSStringFromClass([ordermyOreserDetailCell class])];
}
- (void)loadNewData{
    //下拉刷新
    kWeakSelf(self);
        [[ToolRequest sharedInstance]appuserorderdetailWithIid:weakself.datess.idd success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.detail = [orderDeatailS mj_objectWithKeyValues:dataDict];
            weakself.paymentMethod = weakself.detail.orderD.paymentMethod;
            if ([weakself.detail.orderD.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) {
                if (weakself.detail.expireSecond<0) {
                    weakself.detail.orderD.orderStatus = tuikuang_myOreserFiveAll_type_str;
                }
            }
            if ([weakself.detail.orderD.orderStatus isEqualToString:confirm_myOreserFiveAll_type_str]) {
                weakself.detail.orderD.orderStatus = TOdianping_myOreserFiveAll_type_str;
            }
            
            CGFloat top=0;
            CGFloat bottom=0;
            if ([weakself.detail.orderD.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) {
                [weakself setToPayUI];
                if (weakself.detail.orderD.travelInfoD.isPeriod && ![self.detail.orderD.periodNum isEqualToString:NoStagingString]) {
                    weakself.priceTitle.text = @"首期应付:";
                    weakself.price.text = weakself.detail.orderD.amountPayableStr;
                } else {
                    weakself.priceTitle.text = @"总价";
                    weakself.price.text = [NSString stringWithFormat:@"¥%.2f",weakself.detail.orderD.totalPrice];
                }
                if (ScreenHeight==812){
                                    top = HEIGHT_NavbarX;
                }else{
                    
                    top = HEIGHT_Navbar;
                }
                bottom = -myOreserDetailHEIGHT_NEXTBTN;
            } else if ([weakself.detail.orderD.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str]){
                if (ScreenHeight==812){
                                        top = HEIGHT_NavbarX;
                }else{
                    top = HEIGHT_Navbar;
                    
                }
                if (weakself.bottomView) {
                    [weakself.bottomView removeFromSuperview];
                }
            }else if ([weakself.detail.orderD.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str]){
                if (weakself.detail.orderD.commentable) {
                    [weakself setOKsha];
                    bottom = -myOreserDetailHEIGHT_NEXTBTN;
                }
                weakself.cusNavigationBar.hidenBack = YES;
            } else if ([weakself.detail.orderD.orderStatus isEqualToString:tuikuang_myOreserFiveAll_type_str]){
                weakself.cusNavigationBar.hidenBack = YES;
                if (weakself.bottomView) {
                    [weakself.bottomView removeFromSuperview];
                }
            }
            [weakself.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(weakself.view);
                make.left.equalTo(weakself.view);
                make.top.equalTo(weakself.view).offset(top);
                make.bottom.equalTo(weakself.view).offset(bottom);
            }];
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if (self.classNmae) {
        [self removeViewController:self.classNmae];
    }
    if (self.isNeedRefreth) {
        self.isNeedRefreth = NO;
        self.basicTableView.mj_header.hidden = NO;
        [self.basicTableView.mj_header beginRefreshing];
    }
}

//#pragma mark - scrollView delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if ([self.detail.orderD.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str] || [self.detail.orderD.orderStatus isEqualToString:tuikuang_myOreserFiveAll_type_str]) {
//        if (scrollView.contentOffset.y >=(kHEIGHT-HEIGHT_Navbar)) {
//            self.cusNavigationBar.alpha = 1;
//        }else{
//            self.cusNavigationBar.alpha = 0;
//        }
//    }
//}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section == 0) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([mainDetailCell class]) configuration:^(mainDetailCell *cell) {
            [self configuremainDetailCell:cell atIndexPath:indexPath];
        }];
        
    } else if (indexPath.section == 1){
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([peopeoToCell class]) configuration:^(peopeoToCell *cell) {
            [weakself configurepeopeoToCell:cell atIndexPath:indexPath];
        }];
    } else if (indexPath.section == 3){
//        CGFloat tmp = [tableView fd_heightForCellWithIdentifier:NSStringFromClass([ordermyOreserDetailCell class]) configuration:^(ordermyOreserDetailCell *cell) {
//            [weakself configureordermyOreserDetailCell:cell atIndexPath:indexPath];
//        }];
//        if (self.detail.orderD.couponDiscountStr && self.detail.orderD.couponDiscountStr.length) {
//
//        }else{
//            tmp = tmp - 20;
//        }
//        return tmp;
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([ordermyOreserDetailCell class]) configuration:^(ordermyOreserDetailCell *cell) {
            [weakself configureordermyOreserDetailCell:cell atIndexPath:indexPath];
        }];
    }
    return 0.001;
}

#pragma --mark<配置cell>
- (void)configuremainDetailCell:(mainDetailCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.detail = self.detail;
    kWeakSelf(self);
    cell.btnClick = ^(){
        querenTuiKuan *alert = [[querenTuiKuan alloc]init];
        kWeakSelf(alert);
        alert.querenTuiKuanbtnClick = ^(){
            [MBProgressHUD showLoadingMessage:@"申请中..." toView:weakalert]; //TODO 是 paymentMethod 吗？weakself.detail.orderD.paymentMethod
            [[ToolRequest sharedInstance]apprefundapplyWithapplyMemo:@"取消订单" sn:weakself.detail.orderD.sn success:^(id dataDict, NSString *msg, NSInteger code) {
                [MBProgressHUD hideHUDForView:weakalert];
                [MBProgressHUD showPrompt:msg toView:weakself.view];
                [weakalert closeClisck];
                weakself.basicTableView.mj_header.hidden = NO;
                [weakself.basicTableView.mj_header beginRefreshing];
                
                [self postNoticationNeedRefremydingdang];
            } failure:^(NSInteger errorCode, NSString *msg) {
                [MBProgressHUD hideHUDForView:weakalert];
                [MBProgressHUD showPrompt:msg toView:weakalert];
            }];
        };
        [alert windosViewshow];
    };
}
- (void)configurepeopeoToCell:(peopeoToCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.detail = self.detail.orderTravellersA[indexPath.row];
}
- (void)configureordermyOreserDetailCell:(ordermyOreserDetailCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.detail = self.detail;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.empty_typeV2 == succes_empty_numV2) {
        if (section == 0) {
            if ([self.detail.orderD.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str]) {
                return 108;
            } else if ([self.detail.orderD.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) {
                return kHEIGHT;
            }else{
                if (ScreenHeight==812){
                                    return kHEIGHT+HEIGHT_NavbarX;
                }else{
                    
                    return kHEIGHT+HEIGHT_Navbar;
                }
            }
        } else if (section == 4){
            if ([self.detail.orderD.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) { //
                if (![self.detail.orderD.periodNum isEqualToString:NoStagingString]) {
                    return 80;
                }else{
                    return 210;
                }
            } else if ([self.detail.orderD.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str] || [self.detail.orderD.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str]) {
                return 59;
            }
        }else{
            return 59;
        }
    }
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (void)enabledNOnextbtn{
    self.nextbtn.enabled = NO;
    [self.nextbtn setBackgroundColor:ColorWithHex(0x979797, 0.4)];
}

#pragma -mark<头部视图>
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.empty_typeV2 == succes_empty_numV2) {
        kWeakSelf(self);
        if (section == 0) {
            NSLog(@"%@",self.detail.orderD.orderStatus);
            if ([self.detail.orderD.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) {
                daojishi *head = [[daojishi alloc]init];
                head.endDaojishi = ^(){
                    [weakself enabledNOnextbtn];
                    weakself.detail.expireSecond = 0;
                    [weakself.basicTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
                };
                head.detail = self.detail;
                head.endTime = self.detail.expireSecond;
                return head;
            } else if ([self.detail.orderD.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str] || [self.detail.orderD.orderStatus isEqualToString:tuikuang_myOreserFiveAll_type_str]) {
                
//                return nil;
                
                imageStaue *head = [[imageStaue alloc]init];
//                head.backgroundColor = [UIColor redColor];
                if ([self.detail.orderD.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str]) {
                    head.desStr = @"订单已完成";
                    head.imageStr = @"picok";
                } else if ([self.detail.orderD.orderStatus isEqualToString:tuikuang_myOreserFiveAll_type_str]){
                    head.desStr = @"订单已取消";
                    head.imageStr = @"picjianls";
                }
                return head;
            } else if ([self.detail.orderD.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str]) {
                myOrDetailTabHeadLine *head = [[myOrDetailTabHeadLine alloc]init];
                head.detail = self.detail;
                return head;
            }
        }else if (section == 1){
            sectonHead *head = [[sectonHead alloc]init];
            head.phoneStr = @"";
            head.desStr = @"出行人";
            return head;
        }else if (section == 2){
            sectonHead *head = [[sectonHead alloc]init];
            head.phoneStr = [NSString stringWithFormat:@"%ld",(long)self.detail.mobile];
            head.desStr = @"联系电话";
            return head;
        }else if (section == 3){
            sectonHead *head = [[sectonHead alloc]init];
            head.phoneStr = @"";
            head.desStr = @"订单信息";
            return head;
        }else if (section == 4){
            if ([self.detail.orderD.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) { //
                cancel *head;
                if (![self.detail.orderD.periodNum isEqualToString:NoStagingString]) {
                    head = [[cancel alloc]init];
                } else {
                    head = [[toPayHead alloc]init];
                }
                head.chagePayTypeClick = ^(toPayHead_enum btnType,NSString *Paytype){
                    if (btnType == payType_chage_toPayHead) {//支付方式的改变
                        weakself.paymentMethod = Paytype;
                    } else if (btnType == cancel_chage_toPayHead){//取消订单
                        [MBProgressHUD showLoadingMessage:@"取消中..." toView:weakself.view];
                        [[ToolRequest sharedInstance]appordercancelWithtSn:weakself.detail.orderD.sn success:^(id dataDict, NSString *msg, NSInteger code) {
                            [MBProgressHUD hideHUDForView:weakself.view];
                            [MBProgressHUD showPrompt:msg toView:weakself.view];
                            weakself.basicTableView.mj_header.hidden = NO;
                            [weakself.basicTableView.mj_header beginRefreshing];
                            [self postNoticationNeedRefremydingdang];
                        } failure:^(NSInteger errorCode, NSString *msg) {
                            [MBProgressHUD hideHUDForView:weakself.view];
                            [MBProgressHUD showPrompt:msg toView:weakself.view];
                        }];
                    }
                };
                head.isExpre = (self.detail.expireSecond>0)?NO:YES;
                return head;
            } else if ([self.detail.orderD.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str] || [self.detail.orderD.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str]) {
                sectonHead *head = [[sectonHead alloc]init];
                head.phoneStr = self.detail.orderD.paymentMethod;
                head.desStr = @"支付方式";
                return head;
            }
        }
    }
    return nil;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return self.detail.orderTravellersA.count;
    }else if (section == 2) {
        return 0;
    }else if (section == 3) {
        return 1;
    }else if (section == 4)  {
        return 0;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.empty_typeV2 == succes_empty_numV2) {
        if ([self.detail.orderD.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) { //
            return 5;
        } else{
            if ([self.detail.orderD.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str] || [self.detail.orderD.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str]) {
                return 5;
            } else {
               return 4;
            }
        }
    }
    return 0;
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        mainDetailCell *cell = [mainDetailCell returnCellWith:tableView];
        [self configuremainDetailCell:cell atIndexPath:indexPath];
        return  cell;
    } else if (indexPath.section == 1){
        peopeoToCell *cell = [peopeoToCell returnCellWith:tableView];
        [self configurepeopeoToCell:cell atIndexPath:indexPath];
        return  cell;
    } else if (indexPath.section == 3){
        ordermyOreserDetailCell *cell = [ordermyOreserDetailCell returnCellWith:tableView];
        [self configureordermyOreserDetailCell:cell atIndexPath:indexPath];
        return  cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cceell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cceell"];
        }
        return cell;
    }
    return nil;
}
#pragma --mark< 已经完成，可以去点评了>
- (void)setOKsha{
    UIView *bottomView = [[UIView alloc]init];
    self.bottomView = bottomView;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.height.equalTo(@(myOreserDetailHEIGHT_NEXTBTN));
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
    }];
    
    UIButton *pingjiabtn = [[UIButton alloc]init];
    [bottomView addSubview:pingjiabtn];
    LRViewBorder(pingjiabtn, 0.5, [UIColor whiteColor]);
    [pingjiabtn setTitle:@" 发布游记" forState:UIControlStateNormal];
    [pingjiabtn setImage:ImageNamed(@"待评价sdf") forState:UIControlStateNormal];
    [pingjiabtn setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateNormal];
    pingjiabtn.titleLabel.font = PingFangSC_Regular(17);
    [pingjiabtn addTarget:self action:@selector(nextbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [pingjiabtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bottomView);
        make.top.equalTo(bottomView);
        make.left.equalTo(bottomView);
        make.right.equalTo(bottomView);
    }];
    pingjiabtn.tag = pingjia_myOreserDetail_btn_enm;
}
#pragma --mark< 复原UI >
- (void)reSetUI{
    
}

#pragma --mark< 待付款 >
- (void)setToPayUI{
    UIView *bottomView = [[UIView alloc]init];
    self.bottomView = bottomView;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.height.equalTo(@(myOreserDetailHEIGHT_NEXTBTN));
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
    }];
    
    UIButton *nextbtn = [[UIButton alloc]init];
    self.nextbtn = nextbtn;
    [bottomView addSubview:nextbtn];
    [nextbtn setBackgroundColor:ColorWithHex(0xFB704B, 1.0)];
    [nextbtn setTitle:@"支付" forState:UIControlStateNormal];
    [nextbtn setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    nextbtn.titleLabel.font = PingFangSC_Regular(17);
    [nextbtn addTarget:self action:@selector(nextbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [nextbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bottomView);
        make.top.equalTo(bottomView);
        make.right.equalTo(bottomView);
        make.width.equalTo(@(ScreenWidth/2.0));
    }];
    nextbtn.tag = pay_myOreserDetail_btn_enm;
        
    UIView *leftView = [[UIView alloc]init];
    LRViewBorder(leftView, 0.5, ColorWithHex(0x979797, 1.0));
    leftView.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
    [bottomView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nextbtn);
        make.bottom.equalTo(nextbtn);
        make.left.equalTo(bottomView);
        make.right.equalTo(nextbtn.mas_left);
        make.width.equalTo(nextbtn);
    }];
    
    UILabel *priceTitle = [[UILabel alloc]init];
    self.priceTitle = priceTitle;
//    self.priceTitle.text = @"总价";

    [bottomView addSubview:priceTitle];
    priceTitle.font = PingFangSC_Regular(12);
    priceTitle.textColor = ColorWithHex(0x000000, 1.0);
    priceTitle.textAlignment = NSTextAlignmentRight;
    
    UILabel *price = [[UILabel alloc]init];
    self.price = price;
    [bottomView addSubview:price];
    price.font = PingFangSC_Medium(17);
    price.textColor = ColorWithHex(0xFB704B , 1.0);
    [priceTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView);
        make.bottom.equalTo(leftView);
        make.left.equalTo(leftView);
        make.right.equalTo(price.mas_left);
        make.width.equalTo(price).offset(-5);
    }];
    
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView);
        make.bottom.equalTo(leftView);
        make.left.equalTo(priceTitle.mas_right).offset(5);
        make.right.equalTo(leftView);
    }];
    if (self.detail.expireSecond<0) {
        [self enabledNOnextbtn];
    }
}

#pragma <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat spaceing = scrollView.contentOffset.y;
    NSLog(@"spaceing=%f  %f   %f",spaceing,kHEIGHT-HEIGHT_Navbar,CGRectGetMinY(self.basicTableView.frame));
    if (CGRectGetMinY(self.basicTableView.frame) == 0) {
        
        if (ScreenHeight==812){
            if (spaceing>(kHEIGHT-HEIGHT_NavbarX)) {
                self.cusNavigationBar.hidenBack = NO;
            } else {
                self.cusNavigationBar.hidenBack = YES;
            }
        }else{
            if (spaceing>(kHEIGHT-HEIGHT_Navbar)) {
                self.cusNavigationBar.hidenBack = NO;
            } else {
                self.cusNavigationBar.hidenBack = YES;
            }
            
        }
        
    }
}

#pragma --mark<代扣 钱提示>
- (void)WithholdPayPre{
    kWeakSelf(self);
    XAlertView *alert = [[XAlertView alloc]initWithTitle:@"提示" message:self.detail.debitNotice clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
        if (!canceled) {
            [weakself WithholdPay];
        }
    } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

#pragma --mark<代扣>
- (void)WithholdPay{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..."];
    [[ToolRequest sharedInstance]apppaymentdebitWithSn:self.detail.orderD.sn type:PayTypepayment success:^(id dataDict, NSString *msg, NSInteger code) {
        ThirdPayment *thirdPayment = [ThirdPayment mj_objectWithKeyValues:dataDict];
        weakself.thirdPayment  =thirdPayment;
        [MBProgressHUD hideHUD];
        [MBProgressHUD showPrompt:msg];
        
        NSNotification *notification2 =[NSNotification notificationWithName:wechatPayfenqiState object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification2];
        
        [self postNoticationNeedRefremydingdang];
        
        self.isNeedRefreth = YES;
        
        
//        payOk *vc = [[payOk alloc]init];
//        // 解档
//        vc.thirdPayment = self.thirdPayment;
//        [self.navigationController pushViewController:vc animated:YES];
        
        NSNotification *notification =[NSNotification notificationWithName:Withholdingsuccess object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showPrompt:msg];
    }];
    
}
- (void)goPay{
    kWeakSelf(self);
    if (self.detail.orderD.travelInfoD.isPeriod  && ![self.detail.orderD.periodNum isEqualToString:NoStagingString]) { //分期的产品
        [self WithholdPayPre];
//        [[ToolRequest sharedInstance] apporderperiod_first_debitWithSn:self.detail.orderD.sn success:^(id dataDict, NSString *msg, NSInteger code) {
//            ThirdPayment *thirdPayment = [ThirdPayment mj_objectWithKeyValues:dataDict];
//            weakself.thirdPayment  =thirdPayment;
//            [MBProgressHUD hideHUD];
//            [MBProgressHUD showPrompt:msg];
//            
//            NSNotification *notification =[NSNotification notificationWithName:needRefremydingdang object:nil userInfo:nil];
//            [[NSNotificationCenter defaultCenter] postNotification:notification];
//            weakself.isNeedRefreth = YES;
//            
//            
//            payOk *vc = [[payOk alloc]init];
//            // 解档
//            vc.thirdPayment = self.thirdPayment;
//            [self.navigationController pushViewController:vc animated:YES];
//        } failure:^(NSInteger errorCode, NSString *msg) {
//            [MBProgressHUD hideHUD];
//            [MBProgressHUD showPrompt:msg];
//        }];
        
        
    }else{
        if (!self.paymentMethod || !self.paymentMethod.length) {
            self.paymentMethod = PayType_WX;
        }
        
        if ([self.paymentMethod isEqualToString:PayType_Twallet]) {
            
        }else if ([self.paymentMethod isEqualToString:PayType_WX]) {
            if(![WXApi isWXAppInstalled]) {
                [MBProgressHUD showPrompt:@"您没有安装微信"];
//                [MBProgressHUD hideHUD];
                return;
            }
        }
        [MBProgressHUD showLoadingMessage:@"加载中..."];
        [[ToolRequest sharedInstance]paymentsubmitWithpaymentPluginId:self.paymentMethod sn:self.detail.orderD.sn type:PayTypepayment success:^(id dataDict, NSString *msg, NSInteger code) {
            [MBProgressHUD hideHUD];
            ThirdPayment *thirdPayment = [ThirdPayment mj_objectWithKeyValues:dataDict];
            weakself.thirdPayment  =thirdPayment;
            if ([weakself.paymentMethod isEqualToString:PayType_Twallet]) {
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
                    return;
                }
            }else if ([weakself.paymentMethod isEqualToString:PayType_WX]) {
                //                [WXApi registerApp:WechatAppIDPay];
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
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:msg];
        }];
    }
}
- (void)chekid{
    if (![tourInfo sharedInstance].UserInfo.isPeriodEnabled){
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
                [weakself goPay];
            };
            view.date = date;
            [view windosViewshow];
            [MBProgressHUD hideHUDForView:weakself.view];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD showPrompt:msg];
            [MBProgressHUD hideHUDForView:weakself.view];
        }];
    }else{
      [self goPay];
    }
}

- (void)OpenPinJIa{
    sysPhto *sysphto = [[sysPhto alloc]init];
    SelectOrder_date *tmp = [SelectOrder_date new];
    tmp.Arry_orders = [NSMutableArray arrayWithObject:self.datess];
    sysphto.dateSelectOrder = tmp;
    sysphto.isFromPingJia = YES;
    [self.navigationController pushViewController:sysphto animated:YES];
//    pingjia *vc = [[pingjia alloc]init];
//    vc.datessTwo = self.datess;
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)nextbtnClick:(UIButton *)btn{
    if (btn.tag == pingjia_myOreserDetail_btn_enm) {
        [self OpenPinJIa];
    } else if (btn.tag == pay_myOreserDetail_btn_enm){
        if (self.detail.orderD.travelInfoD.isPeriod  && ![self.detail.orderD.periodNum isEqualToString:NoStagingString]) { //分期的产品
            if ([tourInfo sharedInstance].UserInfo.isBindingBankCard) { //绑卡了
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
                        [weakself popSelf];
                    }
                };
                [liset windosViewshow];
            }
        } else {
            [self goPay];
        }
    }
}
@end
