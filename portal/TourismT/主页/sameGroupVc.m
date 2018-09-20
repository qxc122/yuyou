//
//  sameGroupVc.m
//  TourismT
//
//  Created by Store on 16/11/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "sameGroupVc.h"
#import "myContactsPeoples.h"
#import "ConversationListController.h"
#import "ChatDemoHelper.h"
@interface sameGroupVc ()
@property (nonatomic,weak) UILabel *Titlelabel;
@end

@implementation sameGroupVc

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *Titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth-100, 24)];
    self.navigationItem.titleView = Titlelabel;

    [Titlelabel settextColorhex:0xFFFFFF alpa:1.0 font:PingFangSC_Medium(17)];
    self.Titlelabel = Titlelabel;
    Titlelabel.textAlignment = NSTextAlignmentCenter;
    NSInteger num = [self setupUnreadMessageCount];
    if (num) {
        Titlelabel.text = [NSString stringWithFormat:@"同团游友(%ld)",(long)num];
    } else {
        Titlelabel.text = @"同团游友";
    }
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:ImageNamed(@"通讯录liaot") style:UIBarButtonItemStylePlain target:self action:@selector(rightCcicl:)];
   self.navigationItem.rightBarButtonItem = right;
    
    ConversationListController *list = [[ConversationListController alloc]init];
    [self addChildViewController:list];
    [self.view addSubview:list.view];
    [list.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    [ChatDemoHelper shareHelper].conversationListVC = list;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(HyunreadCountFuc:)
                                                 name:HyunreadCount
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(LoginAndExitNoticeFuc:)
                                                 name:LoginAndExitNotice
                                               object:nil];

}
#pragma --mark<消息数量>
- (void)HyunreadCountFuc:(NSNotification *)user{
    NSDictionary *dic = user.userInfo;
    NSString *messge = dic[HyunreadCount];
    if ([messge integerValue]) {
        self.Titlelabel.text = [NSString stringWithFormat:@"同团游友(%@)",messge];
    }else{
        self.Titlelabel.text = @"同团游友";
    }
}


#pragma --mark<登录退出的通知>
- (void)LoginAndExitNoticeFuc:(NSNotification *)user{
    [self setupUnreadMessageCount];
    if ([tourInfo sharedInstance].UserInfo) {
        
    } else {   //退出了
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma --mark<点击了我的 联系人>
- (void)rightCcicl:(UIBarButtonItem *)btn{
    if ([[tourHelper sharedInstance]judgeisLogin]) {
        myContactsPeoples *vc =[[myContactsPeoples alloc]init];
        vc.type = peo_myContactsPeoples_ENMU;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [MBProgressHUD showPrompt:@"请先登录"];
        [self openLoginView];
    }
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
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
