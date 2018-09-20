//
//  payOk.m
//  TourismT
//
//  Created by Store on 2017/1/11.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "payOk.h"
#import "toOrderVc.h"
#import "shareTo.h"
#import "myOreserDetail.h"
#import "ChatViewController.h"
#import "WXapi.h"
#import "myOreserDetail.h"

@interface payOk ()
@property (nonatomic,weak) shareTo *shareview;
@end

@implementation payOk

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"付款完成";
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
    
/*   去掉分享
    UIBarButtonItem *rightOk = [[UIBarButtonItem alloc]initWithImage:ImageNamed(@"分享白色") style:UIBarButtonItemStylePlain target:self action:@selector(shareee)];
    self.navigationItem.rightBarButtonItem = rightOk;
*/
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatShareStateCan:) name:wechatShareState object:nil];
}
//#pragma  -mark<分享>
//- (void)wechatShareStateCan:(NSNotification *)user{
//    [self.shareview closeClisck];
//    NSDictionary *dic = user.userInfo;
//    NSString *code = dic[wechatShareState];
//    if ([code intValue] == WXSuccess) {
//        [self popSelf];
//    }
//}


#pragma --mark<重写父控制器 返回 按钮>
- (void)customBackButton{
    UIBarButtonItem *rightOk = [[UIBarButtonItem alloc]initWithCustomView:[UILabel new]];
    self.navigationItem.leftBarButtonItem = rightOk;
}
#pragma --mark<分享去吧>
- (void)shareee{
    kWeakSelf(self);
    shareTo *shareview = [[shareTo alloc]init];
    self.shareview = shareview;
    shareview.shareClick = ^(int index){
        [weakself shareWebPageToPlatformType:index withTitle:weakself.thirdPayment.shareTitle withDescr:weakself.thirdPayment.shareContent  withWebpageUrl:weakself.thirdPayment.shareUrl withThumImage:weakself.thirdPayment.shareImage success:^(NSString *error) {
            [MBProgressHUD showPrompt:@"分享成功"];
            [weakself popSelf];
        } failure:^(NSString *messg) {
            [MBProgressHUD showPrompt:@"分享失败"];
        }];

//        [[tourHelper sharedInstance]WXShareWithtitle:weakself.thirdPayment.shareTitle description:weakself.thirdPayment.shareContent  webpageUrl:weakself.thirdPayment.shareUrl ThumbImage:nil  ThumbImage:weakself.thirdPayment.shareImage scene:index];
    };
    [shareview windosViewshow];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSMutableArray *muArry =[self.navigationController.viewControllers mutableCopy];
    for (UIViewController *vc in muArry) {
        if ([vc isKindOfClass:[toOrderVc class]] || [vc isKindOfClass:[myOreserDetail class]] ) {
            [muArry removeObject:vc];
            self.navigationController.viewControllers = muArry;
            break;
        }
    }
}

- (void)setUI{
    UIImageView *iamge = [[UIImageView alloc]init];
    [self.view addSubview:iamge];
    
    UILabel *des = [[UILabel alloc]init];
    [self.view addSubview:des];
    
    UIButton *btnLeft = [[UIButton alloc]init];
    [self.view addSubview:btnLeft];
    
    UIButton *btnRithg = [[UIButton alloc]init];
    [self.view addSubview:btnRithg];
    
    [iamge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
    }];
    [des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iamge.mas_bottom).offset(25);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    [btnLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(des.mas_bottom).offset(80);
        make.right.equalTo(self.view.mas_centerX).offset(-35);
        make.width.equalTo(@(90));
        make.height.equalTo(@(35));
    }];
    
    [btnRithg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(des.mas_bottom).offset(80);
        make.left.equalTo(self.view.mas_centerX).offset(35);
        make.width.equalTo(@(90));
        make.height.equalTo(@(35));
    }];
    //set
    [btnLeft setBtnWithImage:nil font:PingFangSC_Regular(17) Title:@"订单详情" color:0x7692F3 alpa:1.0 forState:UIControlStateNormal];
    [btnRithg setBtnWithImage:nil font:PingFangSC_Regular(17) Title:@"前往聊天" color:0x7692F3 alpa:1.0 forState:UIControlStateNormal];
    LRViewBorder(btnLeft, 0.5, ColorWithHex(0x7692F3, 1.0));
    LRViewBorder(btnRithg, 0.5, ColorWithHex(0x7692F3, 1.0));
    LRViewRadius(btnLeft, cornerRadius_width);
    LRViewRadius(btnRithg, cornerRadius_width);
    [des settextColorhex:0x7692F3 alpa:1.0 font:PingFangSC_Regular(14)];
    des.textAlignment = NSTextAlignmentCenter;
    [btnLeft addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    [btnRithg addTarget:self action:@selector(btnClickL:) forControlEvents:UIControlEventTouchUpInside];
    btnLeft.tag =1;
    btnRithg.tag =2;
    //test
    des.text = @"恭喜付款成功，\n收拾行囊准备出发吧！";
    IMAGEsetCONTENTMODE(iamge);
    iamge.image = ImageNamed(@"Group");
}
- (void)btnClickL:(UIButton *)btn{
    if (btn.tag == 1) {//看订单
        [MobClick event:ewrwer23432342];
        myOreserDetail *vc = [[myOreserDetail alloc]init];
        vc.classNmae = [self class];
//        vc.type = toGo_myOreserFiveAll_type;
        orderlistForOneS *datess  =[[orderlistForOneS alloc]init];
        datess.idd = self.thirdPayment.orderId;
        vc.datess = datess;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == 2){//去聊天
        [MobClick event:worinima];
        ChatViewController *chatController = [[ChatViewController alloc]
                          initWithConversationChatter:self.thirdPayment.emChatGroupId conversationType:EMConversationTypeGroupChat];
        chatController.classNmae = [self class];
        chatController.title = self.thirdPayment.shareTitle;
        chatController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:chatController animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
