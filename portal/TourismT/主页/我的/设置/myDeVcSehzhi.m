//
//  myDeVcSehzhi.m
//  TourismT
//
//  Created by Store on 2017/1/11.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myDeVcSehzhi.h"
#import "myDeVcSehzhiCell.h"
#import "secHead.h"
#import "footTableview.h"
#import "eidtMyInfo.h"
#import "shareTo.h"
#import "login.h"
#import "aboutBanyou.h"
#import "LBToAppStore.h"
#import "WXapi.h"

@interface myDeVcSehzhi ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *arryFour;
@property (nonatomic,weak) shareTo *shareview;
@property (nonatomic,weak) footTableview *foot;

//@property (nonatomic,assign) BOOL isClear;
@end

@implementation myDeVcSehzhi

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  =@"设置";

    self.arryFour = [NSMutableArray array];
    NSArray *arr1 =@[@"个人资料设置",@"消息推送"];
    NSArray *arr2 =@[@"当前版本",@"清除缓存"];
    NSArray *arr3 =@[@"把与游分享给朋友",@"赞美与游",@"关于与游"];
    [self.arryFour addObject:arr1];
    [self.arryFour addObject:arr2];
    [self.arryFour addObject:arr3];
    [self setUitableViewstyle:UITableViewStyleGrouped];

    [self.basicTableView registerClass:[myDeVcSehzhiCell class] forCellReuseIdentifier:NSStringFromClass([myDeVcSehzhiCell class])];
//    self.view.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
    self.basicTableView.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
    self.basicTableView.delegate = self;
    self.basicTableView.dataSource = self;
    
    footTableview *foot = [[footTableview alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 90)];
    self.foot =foot;
    if ([[tourHelper sharedInstance]judgeisLogin]) {
        foot.isenableBtn = YES;
    }else{
        foot.isenableBtn = NO;
    }
    kWeakSelf(self);
    foot.btnClick = ^(){
        [weakself logoInOrOut];
    };
    self.basicTableView.tableFooterView = foot;
    // Do any additional setup after loading the view.
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatShareStateCan:) name:wechatShareState object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(LoginAndExitNoticeFuc:)
                                                 name:LoginAndExitNotice
                                               object:nil];
    
    [[tourHelper sharedInstance] appcommonglobal_paramssuccess];
    
}

- (void)logoInOrOut{
    if ([[tourHelper sharedInstance]judgeisLogin]) {
        [self logOut];
    }else{
        [self openLoginView];
    }
}

#pragma  -mark<登录了>
- (void)LoginAndExitNoticeFuc:(NSNotification *)user{
    if ([[tourHelper sharedInstance]judgeisLogin]) {
        self.foot.isenableBtn = YES;
    }else{
        self.foot.isenableBtn = NO;
    }
}

//#pragma  -mark<分享>
//- (void)wechatShareStateCan:(NSNotification *)user{
//    [self.shareview closeClisck];
//}

#pragma --mark< 推出 >
- (void)logOut{
    kWeakSelf(self);
    XAlertView *alert = [[XAlertView alloc]initWithTitle:@"确认退出登录吗？" message:nil clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
        if (canceled) {
            //推出
            [[tourHelper sharedInstance]logUrlOutView:weakself.view];
        }
    } cancelButtonTitle:@"忍痛离开" otherButtonTitles:@"不离不弃", nil];
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myDeVcSehzhiCell class]) configuration:^(myDeVcSehzhiCell *cell) {
        [weakself configuremyDeVcSehzhiCell:cell atIndexPath:indexPath];
    }];
    return 0;
}
- (BOOL)isAllowedNotification {
    //iOS8 check if user allow notification
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (UIUserNotificationTypeNone != setting.types) {
        return YES;
    }
    return NO;
}

#pragma --mark<配置登录后 第一个cell>
- (void)configuremyDeVcSehzhiCell:(myDeVcSehzhiCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.arryFour[indexPath.section][indexPath.row];
    cell.tit = title;
    if ([title isEqualToString:@"个人资料设置"] || [title isEqualToString:@"把与游分享给朋友"] || [title isEqualToString:@"赞美与游"] || [title isEqualToString:@"关于与游"]) {
        cell.isHiemore = NO;
        cell.isHiedes = YES;
        cell.isHieswifp = YES;
        cell.isHiedessTwo = YES;
    } else if([title isEqualToString:@"消息推送"]){
        cell.isAllowNotication = [self isAllowedNotification];
        cell.isHiemore = YES;
        cell.isHiedes = YES;
        cell.isHieswifp = NO;
        cell.isHiedessTwo = YES;
    } else if([title isEqualToString:@"当前版本"]){
        cell.isHiemore = YES;
        cell.dess = app_Version;
        cell.isHiedes = NO;
        cell.isHieswifp = YES;
        cell.isHiedessTwo = YES;
    } else if([title isEqualToString:@"清除缓存"]){
        cell.isHiemore = YES;
        cell.isHiedes = NO;
        cell.isHieswifp = YES;
        cell.isHiedessTwo = YES;
        NSInteger tmp = [[SDImageCache sharedImageCache] getSize];
        cell.dess = [NSString stringWithFormat:@"%ldM",tmp/(1024*1024)];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 10;
    }
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == (self.arryFour.count-1)) {
        return 10;
    }
    return 0.001;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *tmp = self.arryFour[section];
    return tmp.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arryFour.count;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    secHead *foot = [[secHead alloc]init];
    return foot;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    secHead *head = [[secHead alloc]init];
    return head;
}
#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = self.arryFour[indexPath.section][indexPath.row];
    appcommonglobalS *datea = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
    kWeakSelf(self);
    if ([title isEqualToString:@"个人资料设置"]) {
        if ([[tourHelper sharedInstance]judgeisLogin]) {
            eidtMyInfo *vc = [[eidtMyInfo alloc]init];
            vc.decodedBag = self.decodedBag;
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            [MBProgressHUD showPrompt:@"请先登录"];
            login *losgin = [[login alloc]init];
            UINavigationController *nnvc = [[UINavigationController alloc]initWithRootViewController:losgin];;
            [self presentViewController:nnvc animated:YES completion:nil];
        }
    } else if([title isEqualToString:@"消息推送"]){
        
    } else if([title isEqualToString:@"当前版本"]){
        
    } else if([title isEqualToString:@"清除缓存"]){
        [MBProgressHUD showLoadingMessage:@"清除中..." toView:self.view];
        [[SDImageCache sharedImageCache]clearDiskOnCompletion:^{
            [[SDImageCache sharedImageCache]cleanDiskWithCompletionBlock:^{
                NSIndexPath *pat = [NSIndexPath indexPathForRow:1 inSection:2];
                [self.basicTableView reloadRowsAtIndexPaths:@[pat] withRowAnimation:UITableViewRowAnimationNone];
                [MBProgressHUD hideHUDForView:weakself.view];
                [MBProgressHUD showPrompt:@"清除成功" toView:weakself.view];
                [weakself.basicTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }];
    } else if([title isEqualToString:@"赞美与游"]){
        //用户好评系统
        LBToAppStore *toAppStore = [[LBToAppStore alloc]init];
        toAppStore.myAppID = AppIdAppStore;
        [toAppStore alertUserCommentView:self];
    } else if([title isEqualToString:@"关于与游"]){
        aboutBanyou *vc = [[aboutBanyou alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if([title isEqualToString:@"把与游分享给朋友"]){
        shareTo *shareview = [[shareTo alloc]init];
        self.shareview = shareview;
        shareview.shareClick = ^(int index){
            if (!datea.shareContent || !datea.shareImage || !datea.shareTitle || !datea.shareUrl || !datea.shareContent.length || !datea.shareImage.length || !datea.shareTitle.length || !datea.shareUrl.length) {
                [MBProgressHUD showPrompt:@"没有获取到要分享的内容～" toView:weakself.view];
            }else{
                [weakself shareWebPageToPlatformType:index withTitle:datea.shareTitle withDescr:datea.shareContent  withWebpageUrl:datea.shareUrl withThumImage:datea.shareImage success:^(NSString *error) {
                    [MBProgressHUD showPrompt:@"分享成功"];
                } failure:^(NSString *messg) {
                    [MBProgressHUD showPrompt:@"分享失败"];
                }];
                
//                [[tourHelper sharedInstance]WXShareWithtitle:datea.shareTitle description:datea.shareContent  webpageUrl:datea.shareUrl ThumbImage:nil  ThumbImage:datea.shareImage scene:index];
            }
        };
        [shareview windosViewshow];
    }
}
//#pragma --mark< 获取全局参数 >
//- (void)appcommonglobal_paramssuccess{
//    kWeakSelf(self);
//    [[ToolRequest sharedInstance]appcommonglobal_paramssuccess:^(id dataDict, NSString *msg, NSInteger code) {
//        appcommonglobalS *datea = [appcommonglobalS mj_objectWithKeyValues:dataDict];
//        [NSKeyedArchiver archiveRootObject:datea toFile:PATH_appcommonglobal];
//    } failure:^(NSInteger errorCode, NSString *msg) {
//        [weakself appcommonglobal_paramssuccess];
//    }];
//}

#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myDeVcSehzhiCell *cell = [myDeVcSehzhiCell returnCellWith:tableView];
    [self configuremyDeVcSehzhiCell:cell atIndexPath:indexPath];
    return  cell;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.basicTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}
@end
