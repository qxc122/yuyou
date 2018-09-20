//
//  realNameAuthenticationVc.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "realNameAuthenticationVc.h"
#import "realNameAuthenticationCell.h"
#import "UIImage+cir.h"
#import "CusNavigationBar.h"
#import "SelectBank.h"
#import "BindingResults.h"
#import "NSString+check.h"
@interface realNameAuthenticationVc ()
@property (nonatomic,weak) UIButton *btnNext;
@property (nonatomic,weak) CusNavigationBar *cusNavigationBar;


@end

@implementation realNameAuthenticationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.BankCardDate) {
        self.BankCardDate  = [BindBankCard new];
    }
    [self setUI];
    self.empty_typeV2 = succes_empty_numV2;
    [self.basicTableView reloadData];

}

- (void)setUI{

    self.fd_prefersNavigationBarHidden = YES;
    UIImageView *backImage = [[UIImageView alloc]init];
    backImage.image = ImageNamed(IMAGE_bigALLBack);
    IMAGEsetCONTENTMODE(backImage);
    [self.view addSubview:backImage];
    [self.view sendSubviewToBack:backImage];
    
    kWeakSelf(self);
    CusNavigationBar *cusNavigationBar =[[CusNavigationBar alloc]init];
    cusNavigationBar.endDaojishi = ^(){
        [weakself popSelf];
    };
    
    cusNavigationBar.titleStr = self.title;
    self.cusNavigationBar = cusNavigationBar;
    [self.view addSubview:cusNavigationBar];
    self.cusNavigationBar.hidenBack = YES;
    self.basicTableView.backgroundColor = [UIColor clearColor];
    [self.basicTableView registerClass:[realNameAuthenticationCell class] forCellReuseIdentifier:NSStringFromClass([realNameAuthenticationCell class])];
    // Do any additional setup after loading the view.
//    [self MJRefreshHead];
    
    
    UIButton *btnNext = [UIButton new];
    btnNext.hidden = YES;
    self.btnNext = btnNext;
    [self.view addSubview:btnNext];
    [btnNext setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0xFB704B, 1.0)] forState:UIControlStateNormal];
    [btnNext setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    [btnNext setTitle:@"下一步" forState:UIControlStateNormal];
    btnNext.titleLabel.font = PingFangSC_Regular(17);
    [btnNext addTarget:self action:@selector(btnNextClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
    
    
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
    
    
    [btnNext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.height.equalTo(@(50));
        make.bottom.equalTo(self.view);
    }];
    
    [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(btnNext.mas_top);
        make.top.equalTo(cusNavigationBar.mas_bottom);
    }];
    
}

//- (void)setBankCardDate:(BindBankCard *)BankCardDate{
//    if (BankCardDate) {
//        BankCardDate.bankCode = nil;
//        BankCardDate.mobile = nil;
//        BankCardDate.bankCardNo = nil;//也许不要去掉
//
//        BankCardDate.name = nil;
//        BankCardDate.smsCode = nil;
//        
//        BankCardDate.bankCardType = nil;
//        BankCardDate.bankLogo = nil;
//        BankCardDate.bankName = nil;
//
//        self.BankCardDate = BankCardDate;
//    }
//}

#pragma -mark<点击了下一步>
-(void)btnNextClick{
    [MobClick event:asdfsdf1];
    NSLog(@"1111");
    if ([self.title rangeOfString:@"更换"].location == NSNotFound) {
        if (!self.BankCardDate.realname.length) {
            [MBProgressHUD showPrompt:@"请输入姓名" toView:self.view];
            return;
        }
        if (![NSString checkIdCardNumber:self.BankCardDate.idCard]) {
            [MBProgressHUD showPrompt:@"请输入正确的证件号" toView:self.view];
            return;
        }
    }
    if (!self.BankCardDate.address.length) {
        [MBProgressHUD showPrompt:@"请输入居住地址" toView:self.view];
        return;
    }

    if (!self.BankCardDate.bank.code.length) {
        [MBProgressHUD showPrompt:@"请选择银行" toView:self.view];
        return;
    }
    self.BankCardDate.bankCardNo = [self.BankCardDate.bankCardNo stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (!self.BankCardDate.bankCardNo.length) {
        [MBProgressHUD showPrompt:@"请输入储蓄卡号" toView:self.view];
        return;
    }
    if (![NSString checkTelNumber:self.BankCardDate.mobile]) {
        [MBProgressHUD showPrompt:@"请输入正确的手机号" toView:self.view];
        return;
    }
    if (!self.BankCardDate.smsCode.length  ) {
        [MBProgressHUD showPrompt:@"请输入验证码" toView:self.view];
        return;
    }
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:weakself.view];
    
    if ([self.title rangeOfString:@"更换"].location != NSNotFound) {
        [[ToolRequest sharedInstance]appuserapprovechange_bind_cardWithbankCardNo:self.BankCardDate.bankCardNo address:self.BankCardDate.address bankCode:self.BankCardDate.bank.code mobile:self.BankCardDate.mobile smsCode:self.BankCardDate.smsCode success:^(id dataDict, NSString *msg, NSInteger code) {
            NSLog(@"sdf");
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
            
            if (code == kRespondCodeSuccess) {//成功
                appS *userInfo = [tourInfo sharedInstance].UserInfo;
                userInfo.isBindingBankCard = YES;
                [tourInfo sharedInstance].UserInfo = userInfo;
                if (weakself.AuthenticationSuccess) {
                    [weakself popSelf];
                    weakself.AuthenticationSuccess();
                }
            }
        } failure:^(NSInteger errorCode, NSString *msg) {
            NSLog(@"sdf");
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
        }];
    } else {
        [[ToolRequest sharedInstance]appuserapprovebind_cardWithbankCardNo:self.BankCardDate.bankCardNo address:self.BankCardDate.address bankCode:self.BankCardDate.bank.code idCard:self.BankCardDate.idCard mobile:self.BankCardDate.mobile name:self.BankCardDate.realname smsCode:self.BankCardDate.smsCode success:^(id dataDict, NSString *msg, NSInteger code) {
            NSLog(@"sdf");
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
            
            if (code == kRespondCodeSuccess) {//成功
                appS *tmp = [tourInfo sharedInstance].UserInfo;
                tmp.isBindingBankCard =  YES;
                [tourInfo sharedInstance].UserInfo = tmp;
                if (weakself.AuthenticationSuccess) {
                    [weakself popSelf];
                    weakself.AuthenticationSuccess();
                }
            }
        } failure:^(NSInteger errorCode, NSString *msg) {
            NSLog(@"sdf");
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
        }];
    }
//    BindingResults *BindingResultsView = [BindingResults new];
//    [BindingResultsView windosViewshow];
}


//#pragma -mark<MJ_head加载数据  头部>
//- (void)MJRefreshHead{
//    __weak typeof(self) weakSelf = self;
//    //下拉刷新
//    self.basicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        //加载数据／／TODO
//    }];
//    if (self.BankCardDate) {
//        [self.basicTableView.mj_header beginRefreshing];
//    }else{
//        self.empty_type = succes_empty_num;
//        self.basicTableView.mj_header.hidden = YES;
//    }
//}



#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([realNameAuthenticationCell class]) configuration:^(realNameAuthenticationCell *cell) {
        [weakself configurerealNameAuthenticationCell:cell atIndexPath:indexPath];
    }];
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configurerealNameAuthenticationCell:(realNameAuthenticationCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if ([self.title rangeOfString:@"更换"].location != NSNotFound) {
        cell.Bind = NO;
    } else {
        cell.Bind = YES;
    }
    kWeakSelf(self);
    cell.SelectBank = ^(){
        appcommonglobalS *date = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
        if (date) { //有数据
            [weakself oPenBankList];
        }else{ //无数据
            kWeakSelf(self);
            [MBProgressHUD showLoadingMessage:@"拉取银行列表中..." toView:self.view];
            [[ToolRequest sharedInstance]appcommonglobal_paramssuccess:^(id dataDict, NSString *msg, NSInteger code) {
                [MBProgressHUD hideHUDForView:weakself.view];
                appcommonglobalS *datea = [appcommonglobalS mj_objectWithKeyValues:dataDict];
                [NSKeyedArchiver archiveRootObject:datea toFile:PATH_appcommonglobal];
                
                [weakself oPenBankList];
            } failure:^(NSInteger errorCode, NSString *msg) {
                [MBProgressHUD hideHUDForView:weakself.view];
                [MBProgressHUD showPrompt:msg toView:weakself.view];
            }];
        }
    };
    cell.sendSmsOK = ^(){
        weakself.btnNext.hidden = NO;
    };
    cell.BankCardDate = self.BankCardDate;

}

- (void)oPenBankList{
    kWeakSelf(self);
    [self.basicTableView endEditing:YES];
    SelectBank *backLists = [SelectBank new];
    backLists.SelectBank = ^(bankS *bank){
        NSLog(@"bank.name=%@ bank.logo=%@",bank.name,bank.logo);//TODO  要刷新改行
        weakself.BankCardDate.bank = bank;
        [weakself.basicTableView reloadData];
    };
    [backLists windosViewshow];
}

#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.empty_typeV2 == succes_empty_numV2) {
        return 1;
    }
    return 0;
}

#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    realNameAuthenticationCell *cell = [realNameAuthenticationCell returnCellWith:tableView];
    [self configurerealNameAuthenticationCell:cell atIndexPath:indexPath];
    return  cell;
}

@end
