//
//  lastOk.m
//  TourismT
//
//  Created by Store on 16/12/27.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "lastOk.h"
#import "lastOkTwoCell.h"
#import "lastOkOneCell.h"
#import "WXApi.h"
#import "headLastOkCell.h"
#import "NSString+check.h"

#define Gradient   //定义表示要渐渐出现

@interface lastOk ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;

#ifdef Gradient
@property (nonatomic,strong) NSTimer *scrollTimer;
@property (nonatomic,assign) NSInteger num;
#endif
@property (nonatomic,weak) UIButton *btnRight;
@property (nonatomic,weak) UIButton *btnleft;
@end

@implementation lastOk

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.blcak removeGestureRecognizer:self.tap];
        
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-92*HEIGHTICON);
            make.height.equalTo(@(444));
        }];
        
        UILabel *title = [[UILabel alloc]init];
        [self addSubview:title];
        [title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(0);
            make.right.equalTo(self.back).offset(0);
            make.top.equalTo(self.back).offset(20);
        }];

        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [tableView registerClass:[lastOkOneCell class] forCellReuseIdentifier:NSStringFromClass([lastOkOneCell class])];
        [tableView registerClass:[lastOkTwoCell class] forCellReuseIdentifier:NSStringFromClass([lastOkTwoCell class])];
        [tableView registerClass:[headLastOkCell class] forCellReuseIdentifier:NSStringFromClass([headLastOkCell class])];
        
        tableView.backgroundColor = [UIColor clearColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self addSubview:tableView];
        self.tableView = tableView;
        
        UIButton *btnleft = [[UIButton alloc]init];
        self.btnleft = btnleft;
        btnleft.tag = left_btnlastOk_ENMU;
        [self addSubview:btnleft];
//        [btnleft setBackgroundColor:ColorWithHex(0xFB704B, 1.0)]; right_btnlastOk_ENMU
        LRViewBorder(btnleft, 1.0, ColorWithHex(0xFB704B, 1.0));
        LRViewRadius(btnleft, cornerRadius_width);
        [btnleft setTitle:@"暂不支付" forState:UIControlStateNormal];
        [btnleft setTitleColor:ColorWithHex(0xFB704B, 1.0) forState:UIControlStateNormal];
        btnleft.titleLabel.font = PingFangSC_Regular(17);
        [btnleft addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

        
        [self.close removeTarget:self action:@selector(closeClisck) forControlEvents:UIControlEventTouchUpInside];
        [self.close addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btnRight = [[UIButton alloc]init];
        self.btnRight = btnRight;
        btnRight.tag = right_btnlastOk_ENMU;
        [self addSubview:btnRight];
        [btnRight setBackgroundColor:ColorWithHex(0xFB704B, 1.0)];
        LRViewRadius(btnRight, cornerRadius_width);
        [btnRight setTitle:@"支付" forState:UIControlStateNormal];
        [btnRight setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        btnRight.titleLabel.font = PingFangSC_Regular(17);
        [btnRight addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btnRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(20);
            make.right.equalTo(self.back).offset(-20);
            make.bottom.equalTo(btnleft.mas_top).offset(-20);
            make.height.equalTo(@(44));
        }];
        
        [btnleft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(20);
            make.right.equalTo(self.back).offset(-20);
            make.bottom.equalTo(self.back).offset(-30);
            make.height.equalTo(@(44));
        }];
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.top.equalTo(title.mas_bottom).offset(0);
            make.bottom.equalTo(btnRight.mas_top).offset(-10);
        }];
        
        //set
#ifdef Gradient
        self.btnleft.hidden = YES;
        self.btnRight.hidden = YES;
#endif
        
        title.text = @"支付前请再次确认一下信息";
        title.textAlignment = NSTextAlignmentCenter;
        title.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x000000, 0.86);
    }
    return self;
}
#pragma  -mark<微信支付>
- (void)btnClick:(UIButton *)btn{
    [self closeClisck];
    self.TemporaryPaymentClick(btn.tag);
//    if (btn.tag == left_btnlastOk_ENMU) {
//    }
//    if (btn.tag == left_btnlastOk_ENMU) {
//        if (self.TemporaryPaymentClick) {
//            self.TemporaryPaymentClick();
//        }
//        //[self closeClisck];
//    } else if (btn.tag == right_btnlastOk_ENMU){
    
        
        
//        kWeakSelf(self);
//        [[ToolRequest sharedInstance]paymentsubmitWithpaymentPluginId:self.payType sn:[NSString stringWithFormat:@"%ld",(long)self.orderok.sn] type:PayTypepayment success:^(id dataDict, NSString *msg, NSInteger code) {
//            
//            ThirdPayment *thirdPayment = [ThirdPayment mj_objectWithKeyValues:dataDict];
//            [NSKeyedArchiver archiveRootObject:thirdPayment toFile:PATH_payInfo];
//            
//            if ([weakself.payType isEqualToString:PayType_Twallet]) {
//                if (thirdPayment.businessID && thirdPayment.businessName && thirdPayment.businessType && thirdPayment.supportTcoin && thirdPayment.businessID.length && thirdPayment.businessName.length && thirdPayment.businessType.length && thirdPayment.supportTcoin.length) {
//                    NSDictionary *datajsonData = @{
//                                                               @"businessID":thirdPayment.businessID,
//                                                               @"businessType":thirdPayment.businessType,
//                                                               @"businessName":thirdPayment.businessName,
//                                                               @"money":@(thirdPayment.money),
//                                                               @"supportTcoin":thirdPayment.supportTcoin,
//                                                               };
//                    [[tourHelper  sharedInstance]tPayMethod:datajsonData];
//                } else {
//                    [MBProgressHUD showPrompt:@"服务器返回缺少参数"];
//                }
//            }else if ([weakself.payType isEqualToString:PayType_WX]) {
//                if(![WXApi isWXAppInstalled]) {
//                    [MBProgressHUD showPrompt:@"您还没有安装微信客户端哦"];
//                }else{
//                    // 归档
//                    if (thirdPayment.appid && thirdPayment.partnerid && thirdPayment.prepayid && thirdPayment.noncestr && thirdPayment.package && thirdPayment.sign && thirdPayment.appid.length && thirdPayment.partnerid.length && thirdPayment.prepayid.length && thirdPayment.noncestr.length && thirdPayment.package.length && thirdPayment.sign.length) {
//                        [WXApi registerApp:dataDict[@"appid"]];
//                        
//                        NSNumber *timeStamp = dataDict[@"timestamp"];
//                        PayReq *req = [[PayReq alloc] init];
//                        req.openID =dataDict[@"appid"];
//                        req.partnerId = dataDict[@"partnerid"];
//                        req.prepayId = dataDict[@"prepayid"];
//                        req.nonceStr = dataDict[@"noncestr"];
//                        req.timeStamp = [timeStamp unsignedIntValue];
//                        req.package = dataDict[@"package"];
//                        req.sign = dataDict[@"sign"];
//                        [WXApi sendReq:req];
//                    }else{
//                        [MBProgressHUD showPrompt:@"服务器返回缺少参数"];
//                    }
//                }
//            }
//        } failure:^(NSInteger errorCode, NSString *msg) {
//            [MBProgressHUD showPrompt:msg];
//
//        }];
//    }
}
#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([headLastOkCell class]) configuration:^(headLastOkCell *cell) {
            [self configureheadLastOkCell:cell atIndexPath:indexPath];
        }];
    } else  if (indexPath.row == 1){
        NSString *str2;
        str2 = [NSString stringWithFormat:@"%@ %@",self.orderok.date,self.orderok.fromCity];
        if (![str2 hasSuffix:@"出发"]) {
            str2 = [str2 stringByAppendingString:@"出发"];
        }
        
        CGFloat height1 = [NSString HeightForText:self.orderok.travelName withFont:PingFangSC_Regular(14) withTextWidth:ScreenWidth - 40-30];
        CGFloat height2 = [NSString HeightForText:str2 withFont:PingFangSC_Regular(14) withTextWidth:ScreenWidth - 40-30];
        return 25 + height1 + height2;
        
//        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([lastOkOneCell class]) configuration:^(lastOkOneCell *cell) {
//            [self configurelastOkOneCell:cell atIndexPath:indexPath];
//        }];
    } else  if (indexPath.row == 2){
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([headLastOkCell class]) configuration:^(headLastOkCell *cell) {
            [self configureheadLastOkCell:cell atIndexPath:indexPath];
        }];
    } else  if (indexPath.row > 2 && indexPath.row < self.orderok.travellersA.count + 3){
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([lastOkTwoCell class]) configuration:^(lastOkTwoCell *cell) {
            [self configurelastOkTwoCell:cell atIndexPath:indexPath];
        }];
    }
    return 0.01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
#ifdef Gradient
    return self.num;
#else
    return self.orderok.travellersA.count+3;
#endif
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        headLastOkCell *cell = [headLastOkCell returnCellWith:tableView];
        [self configureheadLastOkCell:cell atIndexPath:indexPath];
        return cell;
    } else  if (indexPath.row == 1){
        lastOkOneCell *cell = [lastOkOneCell returnCellWith:tableView];
        [self configurelastOkOneCell:cell atIndexPath:indexPath];
        return cell;
    } else  if (indexPath.row == 2){
        headLastOkCell *cell = [headLastOkCell returnCellWith:tableView];
        [self configureheadLastOkCell:cell atIndexPath:indexPath];
        return cell;
    } else  if (indexPath.row > 2 && indexPath.row <= self.orderok.travellersA.count + 3-1){
        lastOkTwoCell *cell = [lastOkTwoCell returnCellWith:tableView];
        [self configurelastOkTwoCell:cell atIndexPath:indexPath];
        return cell;
    }
    return nil;
}

- (void)configurelastOkOneCell:(lastOkOneCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.label1Str = self.orderok.travelName;
    cell.label2Srt = [NSString stringWithFormat:@"%@ %@",self.orderok.date,self.orderok.fromCity];
    if (![cell.label2Srt hasSuffix:@"出发"]) {
        cell.label2Srt = [cell.label2Srt stringByAppendingString:@"出发"];
    }
}

- (void)configurelastOkTwoCell:(lastOkTwoCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.peoOne = self.orderok.travellersA[indexPath.row-3];
}

- (void)configureheadLastOkCell:(headLastOkCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        cell.titleStr = @"旅程信息";
    } else if (indexPath.row == 2) {
        cell.titleStr = @"出行人信息";
    } else if (indexPath.row == self.orderok.travellersA.count + 3) {
        cell.titleStr = @"订单金额";
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.num <= (self.orderok.travellersA.count+3)) {
        CATransform3D rotation;
        rotation = CATransform3DMakeTranslation(0, 44, 0);
        cell.alpha = 0;
        cell.layer.transform = rotation;

        [UIView animateWithDuration:0.5 animations:^{
            cell.layer.transform = CATransform3DIdentity;
            cell.alpha = 1;
        } completion:^(BOOL finished) {
            if ([cell isKindOfClass:[lastOkOneCell class]]) {
                lastOkOneCell *tmp = (lastOkOneCell *)cell;
                tmp.isHidenImage = NO;
            } else if ([cell isKindOfClass:[lastOkTwoCell class]]) {
                lastOkTwoCell *tmp = (lastOkTwoCell *)cell;
                tmp.isHidenImage = NO;
            }
        }];
    }
}

#ifdef Gradient
#pragma mark----创建定时器
-(void)creatTimer
{
    _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(daojishiRunning) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
}
#pragma mark----倒计时
-(void)daojishiRunning{
    self.num++;
    if (self.num > (self.orderok.travellersA.count+3)) {
        [self removeTimer];
        self.btnleft.hidden = NO;
        self.btnRight.hidden = NO;
    }else{
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.num-1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.num-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}
#pragma mark----移除定时器
-(void)removeTimer
{
    [_scrollTimer invalidate];
    _scrollTimer = nil;
}
- (void)dealloc{

    [self removeTimer];
}
#endif



- (void)setOrderinfoData:(orderInfo *)orderinfoData{
    if (orderinfoData) {
        _orderinfoData = orderinfoData;
        if (orderinfoData.travelD.isPeriod && ![self.code isEqualToString:NoStagingString]) {
            [self.btnRight setTitle:[NSString stringWithFormat:@"确认支付¥%@",orderinfoData.firstRepayment] forState:UIControlStateNormal];
        }

    }
}


- (void)setOrderok:(orderOk *)orderok{
    _orderok = orderok;
#ifdef Gradient
    self.num = 0;
    [self creatTimer];
    
//    if (self.orderinfoData.travelD.isPeriod) {
//        [self.btnRight setTitle:[NSString stringWithFormat:@"确认支付¥%@",self.orderok.amount] forState:UIControlStateNormal];
//    }
    
#else
    [self.tableView reloadData];
#endif
    
    //[self daojishiRunning];
}
@end
