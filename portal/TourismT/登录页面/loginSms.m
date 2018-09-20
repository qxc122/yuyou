//
//  loginSms.m
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "loginSms.h"
#import "SFHFKeychainUtils.h"

typedef NS_ENUM(NSInteger, loginSms_ENMU)
{
    rest_loginSms_ENMU  = 2,//重发
    next_loginSms_ENMU,//登录
    back_loginSms_ENMU,//返回
};

@interface loginSms ()<UITextFieldDelegate>
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UITextField *sms;
@property (nonatomic,weak) UIButton *login;
@property (nonatomic,weak) UIButton *btnRest;
@property (nonatomic,strong) NSTimer *scrollTimer;
@property (nonatomic,assign) NSInteger num;
@end

@implementation loginSms

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    [self setUINoLoad];
    self.view.clipsToBounds = YES;
}

#pragma  -mark<键盘消失>
- (void)closeKey:(UIGestureRecognizer *)sender{
    if ([self.sms isFirstResponder]) {
        [self.sms resignFirstResponder];
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
    UIButton *btnBack = [[UIButton alloc]init];
    [self.view addSubview:btnBack];
    
    UILabel *tittle = [[UILabel alloc]init];
    [self.view addSubview:tittle];
    
    UIButton *btnRest = [[UIButton alloc]init];
    self.btnRest = btnRest;
    [self.view addSubview:btnRest];
    
    UITextField *sms = [[UITextField alloc]init];
    self.sms = sms;
    sms.delegate =self;
    [self.sms setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
    sms.keyboardType = UIKeyboardTypePhonePad;
    [sms addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:sms];
    
    UIView *line = [[UIView alloc]init];
    [self.view addSubview:line];
    
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    self.login = login;
    [self.view addSubview:login];
    
    [btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(back_btn_left_to_superView);
        make.top.equalTo(self.view).offset(back_btn_top_to_superView);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
    }];
    
    [tittle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btnBack);
        make.centerX.equalTo(self.view);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        if (ScreenHeight==812){
            make.top.equalTo(self.view).offset(99+HEIGHT_NavbarX*HEIGHTICON);
        }else{
            make.top.equalTo(self.view).offset(99+HEIGHT_Navbar*HEIGHTICON);
        }
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).offset(50*WIDTHICON);
        make.right.equalTo(self.view).offset(-50*WIDTHICON);
        make.height.equalTo(@(1));
    }];
    
    [sms mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(line.mas_bottom).offset(-3);
        make.left.equalTo(line).offset(0);
        make.right.equalTo(btnRest.mas_left).offset(-5);
        make.height.equalTo(@(44));
    }];
    [btnRest mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sms).offset(0);
        make.right.equalTo(line).offset(0);
    }];
    
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(45*HEIGHTICON);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(275*WIDTHICON));
        make.height.equalTo(@(50*HEIGHTICON));
    }];

    //set
    line.backgroundColor = ColorWithHex(0xFFFFFF, 0.3);

    btnBack.tag = back_loginSms_ENMU;
    [btnBack setImage:[UIImage imageNamed:IMAGE_back] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    
    login.tag = next_loginSms_ENMU;
    btnRest.tag = rest_loginSms_ENMU;
    [login setBackgroundImage:ImageNamed(@"nextBtndenglu") forState:UIControlStateHighlighted];
    [login setBackgroundImage:ImageNamed(@"nextBtndenglu") forState:UIControlStateNormal];
    
    [btnRest setTitle:@"重新发送" forState:UIControlStateNormal];
//    btnRest.backgroundColor = [UIColor redColor];
    [btnRest setTitleColor:ColorWithHex(0xFFFFFF, 0.7) forState:UIControlStateNormal];
    btnRest.titleLabel.font = PingFangSC_Regular(14);
    [login setTitle:@"下一步" forState:UIControlStateNormal];
    [login setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    login.titleLabel.font = PingFangSC_Regular(16);
    [login addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    [btnRest addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    tittle.text = @"短信验证码登录";
    tittle.font = PingFangSC_Regular(17);
    tittle.textColor = ColorWithHex(0xFFFFFF, 0.7);
    
    sms.placeholder = @"请输入验证码";
    sms.clearButtonMode = UITextFieldViewModeAlways;
    sms.font = PingFangSC_Regular(14);
    sms.textColor = ColorWithHex(0xFFFFFF, 1.0);
    image.image = ImageNamed(@"pic_hd");
    imageBack.image = ImageNamed(@"背景色");
    self.login.enabled = NO;
    self.btnRest.enabled = NO;
    [self timerRunning];
    [self sendSms];
}
#pragma --mark--发送短信验证码
- (void)sendSms{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"发送中..." toView:self.view];
    [[ToolRequest sharedInstance]sendSmsWithmobile:self.phone  type:SendSmsTypeLogin success:^(id dataDict, NSString *msg, NSInteger code) {
        [weakself creatTimer];
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
        weakself.num = 60;
        weakself.btnRest.enabled = NO;
        if ([weakself.sms canBecomeFirstResponder]) {
            [weakself.sms becomeFirstResponder];
        }

        NSError *error;
        BOOL saved = [SFHFKeychainUtils storeUsername:@"oldPhoneUsername" andPassword:self.phone forServiceName:@"oldPhone" updateExisting:YES error:&error];
        if (saved) {
            NSLog(@"YES");
//            NSString *phoneTmp = [SFHFKeychainUtils getPasswordForUsername:@"oldPhoneUsername" andServiceName:@"oldPhone" error:nil];
//            NSLog(@"phoneTmp=%@",phoneTmp);
//            NSLog(@"phoneTmp=%@",phoneTmp);
        }else{
            NSLog(@"No");
        }

        
        //TODO
//        NSCharacterSet* nonDigits =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
//        int remainSecond =[[msg stringByTrimmingCharactersInSet:nonDigits] intValue];
//        weakself.sms.text = [NSString stringWithFormat:@"%d",remainSecond];
//        NSLog(@"remainSecond=%d",remainSecond);
    } failure:^(NSInteger errorCode, NSString *msg) {
        weakself.btnRest.enabled = YES;
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}
#pragma  -mark--输入了电话
-(void)textFieldDidChange :(UITextField *)textField{
    if (textField.text.length >= 4 && textField.text.length <= 6) {
        self.login.enabled = YES;
    }else{
        self.login.enabled = NO;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{
    NSUInteger length = textField.text.length + string.length;
    if (length > 6) {
        [textField resignFirstResponder];
        [MBProgressHUD showPrompt:@"最多输入6位验证码"];
        return NO;
    }
    return YES;
}


#pragma  -mark--点击按钮
- (void)btnClickL:(UIButton *)btn{
    if (btn.tag == rest_loginSms_ENMU) {
        [self sendSms];
    } else if (btn.tag == next_loginSms_ENMU){
        if ([self.sms isFirstResponder]) {
            [self.sms resignFirstResponder];
        }
        if (!self.sms.text.length) {
            [MBProgressHUD showPrompt:@"请输入正确的验证码" toView:self.view];
        }else{
            kWeakSelf(self);
            [MBProgressHUD showLoadingMessage:@"登录中..." toView:self.view];
            [[ToolRequest sharedInstance]loginWithMobile:self.phone andsmsCode:self.sms.text success:^(id dataDict, NSString *msg, NSInteger code) {
                [[tourHelper sharedInstance]Hylogin:dataDict msg:msg code:code loginSuccess:^(NSString *msg) {
                    if (weakself.loginSucces) {
                        weakself.loginSucces();
                    }
                    [weakself.navigationController popToRootViewControllerAnimated:NO];
                    [MBProgressHUD hideHUDForView:weakself.view];
                    [MBProgressHUD showPrompt:msg];
                } loginFailure:^(NSString *msg) {
                    [MBProgressHUD hideHUDForView:weakself.view];
                    [MBProgressHUD showPrompt:msg toView:weakself.view];
                }];
            } failure:^(NSInteger errorCode, NSString *msg) {
                [MBProgressHUD hideHUDForView:weakself.view];
                [MBProgressHUD showPrompt:msg toView:weakself.view];
            }];
        }
    } else if (btn.tag == back_loginSms_ENMU){
        [self popSelf];
    }
}

- (void)customBackButton{}
- (void)hideBottomBarWhenPush{}

-(void)timerRunning{
    kWeakSelf(self);
    [UIView animateWithDuration:10.0 animations:^{
        if (weakself.image.frame.origin.x == 0) {
            weakself.image.transform = CGAffineTransformMakeTranslation(ScreenWidth - 4426.0/2943.0*ScreenHeight, 0);
        } else {
            weakself.image.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        [weakself timerRunning];
    }];
}
#pragma mark----创建定时器
-(void)creatTimer
{
    _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(daojishiRunning) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
    [self.btnRest setTitle:@"60s" forState:UIControlStateNormal];
}
#pragma mark----倒计时
-(void)daojishiRunning{
    self.num--;
    if (self.num == 0) {
        [self removeTimer];
        self.btnRest.enabled = YES;
        [self.btnRest setTitle:@"重新发送" forState:UIControlStateNormal];
    }else{
        [self.btnRest setTitle:[NSString stringWithFormat:@"%lds",(long)self.num] forState:UIControlStateNormal];
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

@end
