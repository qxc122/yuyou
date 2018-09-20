//
//  myStageThisMonth.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myStageThisMonth.h"
#import "myStageThisMonthCell.h"
#import "StagingDetailsList.h"
#import "myStageThisMonthHead.h"
#import "emptyTable.h"
#import "UIImage+cir.h"
#import "tourDetais.h"
#import "payPopView.h"
@interface myStageThisMonth ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) NSString *payType;
@property (nonatomic,weak) payPopView *payPopViewview;
@property (nonatomic,weak) emptyTable *emptyTableteww;
@property (nonatomic,strong) ThirdPayment *thirdPayment;

@end

@implementation myStageThisMonth

- (void)viewDidLoad {
    [super viewDidLoad];
    self.payType = PayType_WX;
    [self setUI];
     self.view.backgroundColor = ColorWithHex(0xF3F3F3, 1.0);
}

- (void)setDate:(myStageHome *)date{
    _date =date;
    if (date.billInfoNowA.count) {
        [self.basicTableView reloadData];
    } else {
        self.emptyTableteww.hidden = NO;
    }
    if ([date.status isEqualToString:unpaid] || [date.status isEqualToString:overdue]) {
        [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view);
            make.left.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-50);
            make.top.equalTo(self.view);
        }];
    } else {
        [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view);
            make.left.equalTo(self.view);
            make.bottom.equalTo(self.view);
            make.top.equalTo(self.view);
        }];
    }
}

- (void)setUI{
    
    [self setUitableViewstyle:UITableViewStyleGrouped];
    self.basicTableView.backgroundColor = [UIColor clearColor];
    self.basicTableView.delegate = self;
    self.basicTableView.dataSource = self;
    [self.basicTableView registerClass:[myStageThisMonthCell class] forCellReuseIdentifier:NSStringFromClass([myStageThisMonthCell class])];
    // Do any additional setup after loading the view.
    //    [self MJRefreshHead];
    
    self.basicTableView.contentInset = UIEdgeInsetsMake(0, 0, 15, 0);
    UIButton *btnNext = [UIButton new];

    [self.view addSubview:btnNext];
    [btnNext setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0x7692F3, 1.0)] forState:UIControlStateNormal];
    [btnNext setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    [btnNext setTitle:@"还款" forState:UIControlStateNormal];
    btnNext.titleLabel.font = PingFangSC_Regular(17);
    [btnNext addTarget:self action:@selector(btnNextClick) forControlEvents:UIControlEventTouchUpInside];
    
    [btnNext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.height.equalTo(@(50));
        make.top.equalTo(self.basicTableView.mas_bottom);
    }];
}


- (void)btnNextClick{
    [self WithholdPayPre];
//    [MobClick event:ffguty1];
//    payPopView *payPopViewview= [payPopView new];
//    self.payPopViewview = payPopViewview;
//    payPopViewview.date = self.date;
//    kWeakSelf(self);
//    payPopViewview.GOPayMode = ^(NSString *type){
//        weakself.payType = type;
//        [weakself goPayWithType];
//    };
//    [payPopViewview windosViewshow];
}


#pragma --mark<代扣 钱提示>
- (void)WithholdPayPre{
    kWeakSelf(self);
    XAlertView *alert = [[XAlertView alloc]initWithTitle:@"提示" message:self.date.debitNotice clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
        if (!canceled) {
            [weakself WithholdPay];
        }
    } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

#pragma --mark<代扣>
- (void)WithholdPay{
    NSLog(@"还款啦");
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
    [[ToolRequest sharedInstance]apppaymentdebitWithSn:self.date.billSn type:PayTyperepayment success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg];

        NSNotification *notification =[NSNotification notificationWithName:Repaymentsuccess object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg];
    }];
    
}
/*
- (void)goPayWithType{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
    [[ToolRequest sharedInstance]paymentsubmitWithpaymentPluginId:self.payType sn:self.date.billSn type:PayTyperepayment success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [weakself.payPopViewview removeFromSuperview];
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
*/
- (emptyTable *)emptyTableteww{
    if (!_emptyTableteww) {
        emptyTable *emptyTableteww = [emptyTable new];
        _emptyTableteww = emptyTableteww;
        [self.view addSubview:emptyTableteww];
        [emptyTableteww mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
    }
    return _emptyTableteww;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.date.billInfoNowA.count) {
        return 49;
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.date.billInfoNowA.count) {
        myStageThisMonthHead *head = [myStageThisMonthHead new];
        head.date = self.date;
        return head;
    }
    return nil;
}
#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myStageThisMonthCell class]) configuration:^(myStageThisMonthCell *cell) {
        [weakself configuremyStageThisMonthCelll:cell atIndexPath:indexPath];
    }];
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configuremyStageThisMonthCelll:(myStageThisMonthCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date.billInfoNowA[indexPath.row];
    kWeakSelf(self);
    cell.goToViewstaues = ^(myStageHomeListForOne *date,myStageThisMonthCell_enum type){
        if (type == list_myStageThisMonthCell_enum) {
            StagingDetailsList *vc = [StagingDetailsList new];
            vc.date = date;
            [weakself.navigationController pushViewController:vc animated:YES];
        } else if (type == detail_myStageThisMonthCell_enum) {
            tourDetais *vc = [tourDetais new];
            myStageHomeListForOne *date = weakself.date.billInfoNowA[indexPath.row];
            vc.idd = [date.travelId integerValue];
            vc.title = date.travelName;
            [weakself.navigationController pushViewController:vc animated:YES];
        }
    };
}

#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.date.billInfoNowA.count;
}

//#pragma --mark< 点击了  cell >
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    StagingDetailsList *vc = [StagingDetailsList new];
//    vc.date = self.date.billInfoNowA[indexPath.row];
//    [self.navigationController pushViewController:vc animated:YES];
//}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myStageThisMonthCell *cell = [myStageThisMonthCell returnCellWith:tableView];
    [self configuremyStageThisMonthCelll:cell atIndexPath:indexPath];
    return  cell;
}


@end
