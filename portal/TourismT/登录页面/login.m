//
//  login.m
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "login.h"
#import "NSString+check.h"
#import "loginSms.h"
#import "WXapi.h"
//#import "WeiboSDK.h"
#import "SFHFKeychainUtils.h"
typedef NS_ENUM(NSInteger, btnlogin_ENMU)
{
    Quxiao_btnlogin_ENMU  = 2,//取消
    next_btnlogin_ENMU,//下一步
    QQ_btnlogin_ENMU,//QQ登录
    WX_btnlogin_ENMU,//微信登录
    WB_btnlogin_ENMU,//微博登录
};


@interface login ()<UITextFieldDelegate>
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UITextField *phone;
@property (nonatomic,weak) UIButton *next;
@end

@implementation login
{
    NSTimer *_scrollTimer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [WXApi registerApp:WechatAppID];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    [self setUINoLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(LoginAndExitNoticeFuc:)
                                                 name:LoginAndExitNotice
                                               object:nil];

}
#pragma --mark<登录退出的通知>
- (void)LoginAndExitNoticeFuc:(NSNotification *)user{
    //    NSDictionary *dic = user.userInfo;
    if ([[tourHelper sharedInstance]judgeisLogin]) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            EMError *err=nil;
//            EMPushOptions *option =  [[EMClient sharedClient] getPushOptionsFromServerWithError:&err];
//            if(!err && option.displayStyle != EMPushDisplayStyleMessageSummary)
//            {
//                option.displayStyle = EMPushDisplayStyleMessageSummary;
//                option.noDisturbStatus =  EMPushNoDisturbStatusClose;
//                appS *decodedBag = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_userForApp];
//                option.displayName = decodedBag.nickName;
//                
//                EMError *error = [[EMClient sharedClient] updatePushOptionsToServer];
//                if (error) {
//                    NSLog(@"fail");
//                } else {
//                    NSLog(@"Ok");
//                }
//            }else{
//                //上报错误
//                return;
//            }
//        });
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        
    }
}

#pragma  -mark<键盘消失>
- (void)closeKey:(UIGestureRecognizer *)sender{
    if ([self.phone isFirstResponder]) {
        [self.phone resignFirstResponder];
    }
}
- (void)setUINoLoad{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKey:)];
    [self.view addGestureRecognizer:tap];
    UIImageView *image = [[UIImageView alloc]init];
    self.image = image;
    IMAGEsetCONTENTMODE(image);
    [self.view addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
        make.width.mas_equalTo(image.mas_height).multipliedBy(4426.0/2943.0);
//        make.width.equalTo(@(4426.0*WIDTHICON));
    }];
    
    UIImageView *imageBack = [[UIImageView alloc]init];
    imageBack.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageBack];
    [imageBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];

    UIButton *chanLogin = [[UIButton alloc]init];
    [self.view addSubview:chanLogin];
    
    UIImageView *icon = [[UIImageView alloc]init];
    [self.view addSubview:icon];
    
    UITextField *phone = [[UITextField alloc]init];
    phone.keyboardType = UIKeyboardTypePhonePad;
    self.phone = phone;
    phone.delegate = self;
    [self.phone setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
    [phone addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:phone];
    
    UIView *line = [[UIView alloc]init];
    [self.view addSubview:line];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeCustom];
    self.next = next;
    [self.view addSubview:next];
    
    UILabel *other = [[UILabel alloc]init];
    [self.view addSubview:other];
    
    UIView *lineL = [[UIView alloc]init];
    [self.view addSubview:lineL];
    
    UIView *lineR = [[UIView alloc]init];
    [self.view addSubview:lineR];
    
    UIButton *btnL = [[UIButton alloc]init];
    [self.view addSubview:btnL];
    
    UIButton *btnM = [[UIButton alloc]init];
    [self.view addSubview:btnM];
    
    UIButton *btnR = [[UIButton alloc]init];
    [self.view addSubview:btnR];
    
    [chanLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view).offset(5);
        make.width.equalTo(@(44));
        make.height.equalTo(@(44));
    }];
    
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(88*HEIGHTICON);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(155*WIDTHICON));
        make.height.equalTo(@(65*WIDTHICON));
        //        make.height.mas_equalTo(icon.mas_width).multipliedBy(65/155);
    }];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(icon.mas_bottom).offset(90*HEIGHTICON);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(274*WIDTHICON));
        make.height.equalTo(@(44));
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phone.mas_bottom).offset(3);
        make.centerX.equalTo(phone);
        make.width.equalTo(phone);
        make.height.equalTo(@(1));
    }];
    [next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(45*HEIGHTICON);
        make.centerX.equalTo(line);
        make.width.equalTo(@(275));
        make.height.equalTo(@(50));
//        make.height.mas_equalTo(next.mas_width).multipliedBy(50/275);
    }];
    [btnM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-50*HEIGHTICON);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(44));
        make.height.equalTo(@(44));
    }];
    [btnL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(btnM.mas_left).offset(-71*WIDTHICON);
        make.centerY.equalTo(btnM);
        make.width.equalTo(btnM);
        make.height.equalTo(btnM);
    }];
    [btnR mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnM.mas_right).offset(71*WIDTHICON);
        make.centerY.equalTo(btnM);
        make.width.equalTo(btnM);
        make.height.equalTo(btnM);
    }];
    [other mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(btnM.mas_top).offset(-50*HEIGHTICON);
        make.centerX.equalTo(btnM);
    }];
    [lineL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(other.mas_left).offset(-5);
        make.centerY.equalTo(other);
        make.width.equalTo(@(12));
        make.height.equalTo(@(0.5));
    }];
    [lineR mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(other.mas_right).offset(5);
        make.centerY.equalTo(lineL);
        make.width.equalTo(lineL);
        make.height.equalTo(lineL);
    }];
    //set
    lineL.backgroundColor = ColorWithHex(0xFFFFFF, 0.3);
    lineR.backgroundColor = ColorWithHex(0xFFFFFF, 0.3);
    other.text = @"其他登录方式";
    other.font = PingFangSC_Regular(11);
    other.textColor = ColorWithHex(0xFFFFFF, 0.58);
    [btnL setImage:ImageNamed(@"QQlogin") forState:UIControlStateNormal];
    [btnM setImage:ImageNamed(@"微信login") forState:UIControlStateNormal];
    [btnR setImage:ImageNamed(@"微博login") forState:UIControlStateNormal];
    [btnL addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    [btnM addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    [btnR addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    btnL.tag = QQ_btnlogin_ENMU;
    btnM.tag = WX_btnlogin_ENMU;
    btnR.tag = WB_btnlogin_ENMU;
    
    chanLogin.tag = Quxiao_btnlogin_ENMU;
    next.tag = next_btnlogin_ENMU;
    [chanLogin setImage:ImageNamed(@"NOlogon") forState:UIControlStateNormal];
    [next setBackgroundImage:ImageNamed(@"nextBtndenglu") forState:UIControlStateHighlighted];
    [next setBackgroundImage:ImageNamed(@"nextBtndenglu") forState:UIControlStateNormal];
    [next setTitle:@"下一步" forState:UIControlStateNormal];
    [next setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    next.titleLabel.font = PingFangSC_Regular(16);
    [chanLogin addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    [next addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    line.backgroundColor = ColorWithHex(0xFFFFFF, 0.3);
    phone.placeholder = @"输入你的手机号";
    phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    phone.font = PingFangSC_Regular(14);
    phone.textColor = ColorWithHex(0xFFFFFF, 1.0);
    icon.image = ImageNamed(@"logo");
    image.image = ImageNamed(@"pic_hd");
    imageBack.image = ImageNamed(@"背景色");
    self.next.enabled = NO;
    
    if (![WXApi isWXAppInstalled]) {
        btnM.hidden = YES;
    }
    
//#ifndef DEBUG
//    appcommonglobalS *datea = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
//    if ([datea.IOSSpecialD.IsShowWb isEqualToString:@"0"]) {
//        btnR.hidden = YES;
//    }else{
//        btnR.hidden = NO;
//    }
//#endif
//    if (![WeiboSDK isWeiboAppInstalled]) {
//        btnR.hidden = YES;
//    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self timerRunning];
    [self creatTimer];
    NSString *phoneTmp = [SFHFKeychainUtils getPasswordForUsername:@"oldPhoneUsername" andServiceName:@"oldPhone" error:nil];
    if (phoneTmp && phoneTmp.length) {
        self.phone.text = phoneTmp;
        self.next.enabled = YES;
    }
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeTimer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  -mark--输入了电话
-(void)textFieldDidChange :(UITextField *)textField{
    if (textField.text.length == 11) {
        self.next.enabled = YES;
    }else{
        self.next.enabled = NO;
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{
    NSUInteger length = textField.text.length + string.length;
    if (length > 11) {
//        [textField resignFirstResponder];
        [MBProgressHUD showPrompt:@"最多输入11位手机号"];
        return NO;
    }
    return YES;
}
//loginWithMobile
#pragma  -mark--点击按钮
- (void)btnClickL:(UIButton *)btn{
    if (btn.tag == Quxiao_btnlogin_ENMU) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (btn.tag == next_btnlogin_ENMU){
        if ([self.phone isFirstResponder]) {
            [self.phone resignFirstResponder];
        }
        if ([NSString checkTelNumber:self.phone.text]) {
            kWeakSelf(self);
            loginSms *vc = [[loginSms alloc]init];
            vc.loginSucces = ^(){
                [weakself dismissViewControllerAnimated:YES completion:nil];
            };
            vc.phone = self.phone.text;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            [MBProgressHUD showPrompt:@"请输入正确的手机号" toView:self.view];
        }
    } else if (btn.tag == QQ_btnlogin_ENMU){
        [self QQ_Or_Sina_loginPlatform:UMSocialPlatformType_QQ];
    } else if (btn.tag == WX_btnlogin_ENMU){
        [self QQ_Or_Sina_loginPlatform:UMSocialPlatformType_WechatSession];
        
//        [MBProgressHUD showLoadingMessage:@"登录中..."];
//        SendAuthReq *req = [[SendAuthReq alloc] init];
//        req.scope = @"snsapi_userinfo";
//        req.state = @"banyou";
//        [WXApi sendReq:req];
    } else if (btn.tag == WB_btnlogin_ENMU){
        [self QQ_Or_Sina_loginPlatform:UMSocialPlatformType_Sina];
    }
}

- (void)QQ_Or_Sina_loginPlatform:(UMSocialPlatformType)platformType{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"登录中..."];
//    [[tourHelper sharedInstance]getUserInfoForPlatform:platformType loginSuccess:^(NSString *msg) {
    [self getUserInfoForPlatform:platformType loginSuccess:^(NSString *msg) {
        [weakself dismissViewControllerAnimated:YES completion:nil];
        [weakself.navigationController popToRootViewControllerAnimated:NO];
        [MBProgressHUD hideHUD];
        [MBProgressHUD showPrompt:msg];
    } loginFailure:^(NSString *msg) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showPrompt:msg];
    }];
}

- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType loginSuccess:(loginSuccess)block  loginFailure:(loginFailure)Failblock
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        if (resp) {
            // 第三方登录数据(为空表示平台未提供)
            // 授权数据
            NSLog(@" uid: %@", resp.uid);
            NSLog(@" openid: %@", resp.openid);
            NSLog(@" accessToken: %@", resp.accessToken);
            NSLog(@" refreshToken: %@", resp.refreshToken);
            NSLog(@" expiration: %@", resp.expiration);
            
            // 用户数据
            NSLog(@" name: %@", resp.name);
            NSLog(@" iconurl: %@", resp.iconurl);
            NSLog(@" gender: %@", resp.gender);
            
            // 第三方平台SDK原始数据
            NSLog(@" originalResponse: %@", resp.originalResponse);
            
            NSString *ttype;
            if (platformType == UMSocialPlatformType_Sina) {
                ttype = @"weibo";
            } else if (platformType == UMSocialPlatformType_WechatSession){
                ttype = @"weixin";
            } else if (platformType == UMSocialPlatformType_QQ){
                ttype = @"qq";
            }
            NSString *gender;
            if ([resp.gender isEqualToString:@"M"] || [resp.gender isEqualToString:@"m"] || [resp.gender isEqualToString:@"男"]) {
                gender = @"男";
            } else {
                gender = @"女";
            }
            [[ToolRequest sharedInstance]apploginsubmit_wxWithavatar:resp.iconurl city:@"" address:@"" country:@"" gender:gender nickname:resp.name openId:resp.openid?resp.openid:resp.uid openIdType:ttype province:@"" unionid:resp.uid success:^(id dataDict, NSString *msg, NSInteger code) {

                [[tourHelper sharedInstance]Hylogin:dataDict msg:msg code:code loginSuccess:^(NSString *msg) {
                    block(msg);
                } loginFailure:^(NSString *msg) {
                    Failblock(msg);
                }];
            } failure:^(NSInteger errorCode, NSString *msg) {
                Failblock(msg);
            }];
        } else {
            NSString *dic = error.userInfo[@"NSLocalizedDescription"];
            Failblock(dic);
        }
    }];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)customBackButton{}
- (void)hideBottomBarWhenPush{}

#pragma mark----创建定时器
-(void)creatTimer
{
    _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(timerRunning) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
}
-(void)timerRunning{
    kWeakSelf(self);
    [UIView animateWithDuration:10.0 animations:^{
        if (weakself.image.frame.origin.x == 0) {
            weakself.image.transform = CGAffineTransformMakeTranslation(ScreenWidth - 4426.0/2943.0*ScreenHeight, 0);
        } else {
            weakself.image.transform = CGAffineTransformIdentity;
        }
    } completion:nil];
}
#pragma mark----移除定时器
-(void)removeTimer
{
    [_scrollTimer invalidate];
    _scrollTimer = nil;
}

@end
