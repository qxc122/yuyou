//
//  aboutBanyou.m
//  TourismT
//
//  Created by Store on 2017/1/11.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "aboutBanyou.h"
#import "myDeVcSehzhiCell.h"
#import "headTableaa.h"
#import "secHead.h"
#import "shareTo.h"
#import "Wxapi.h"
#import "lookWkweb.h"
#import "NSString+check.h"
@interface aboutBanyou ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *arryFour;
@property (nonatomic,weak) shareTo *shareview;
@end

@implementation aboutBanyou
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  =@"关于与游";
//    self.tel = @"13034297670";
    self.arryFour = [NSMutableArray array];
    NSArray *arr1;
#ifdef DEBUG
    arr1 =@[@"检查更新",@"联系我们",@"软件许可使用协议"];
#else
    arr1 =@[@"联系我们",@"软件许可使用协议"];
//    appcommonglobalS *datea = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
//    if ([datea.IOSSpecialD.IsDisplayUpdate isEqualToString:@"0"]) {
//    } else{
//        arr1 =@[@"检查更新",@"联系我们",@"软件许可使用协议"];
//    }
#endif

    NSArray *arr2 =@[@"把与游分享给朋友"];
    [self.arryFour addObject:arr1];
    [self.arryFour addObject:arr2];
    [self setUitableViewstyle:UITableViewStyleGrouped];
    
    [self.basicTableView registerClass:[myDeVcSehzhiCell class] forCellReuseIdentifier:NSStringFromClass([myDeVcSehzhiCell class])];
    //    self.view.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
    self.basicTableView.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
    self.basicTableView.delegate = self;
    self.basicTableView.dataSource = self;
    
    headTableaa *head = [[headTableaa alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 187)];
    self.basicTableView.tableHeaderView = head;
    // Do any additional setup after loading the view.
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatShareStateCan:) name:wechatShareState object:nil];
    
    UILabel *des = [[UILabel alloc]init];
    des.numberOfLines = 0;
    [self.view addSubview:des];
    des.attributedText = [NSString creatStrWithText:[NSString stringWithFormat:@"IOS%@\nCopyright2014-2017\n与游版权所有",app_Version] Font:PingFangSC_Regular(12) Color:ColorWithHex(0x000000, 0.87) LineSpacing:5.f Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByWordWrapping firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0.0];

    [self.basicTableView  mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    [des mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.basicTableView.mas_bottom);
        make.bottom.equalTo(self.view).offset(-15);
    }];
    
}

//#pragma  -mark<分享>
//- (void)wechatShareStateCan:(NSNotification *)user{
//    [self.shareview closeClisck];
//}


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
#pragma --mark<配置登录后 第一个cell>
- (void)configuremyDeVcSehzhiCell:(myDeVcSehzhiCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.arryFour[indexPath.section][indexPath.row];
    cell.tit = title;
    cell.isHiemore = NO;
    cell.isHiedes = YES;
    cell.isHieswifp = YES;
    if ([title isEqualToString:@"联系我们"]) {
        appcommonglobalS *datea = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
        cell.dessTwo = datea.phone;
        cell.isHiedessTwo = NO;
    }else{
        cell.isHiedessTwo = YES;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section== 1) {
        return 10;
    }
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    secHead *head = [[secHead alloc]init];
    return head;
}
#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = self.arryFour[indexPath.section][indexPath.row];
    kWeakSelf(self);
    if ([title isEqualToString:@"检查更新"]) {
        [MBProgressHUD showLoadingMessage:@"检查更新中..." toView:self.view];
        [[ToolRequest sharedInstance]checkRheAppVersionWithAppId:AppIdAppStore progress:^(NSProgress *uploadProgress) {
        } success:^(id dataDict, NSString *msg, NSInteger code) {
            [MBProgressHUD hideHUDForView:weakself.view];
            if (dataDict) {
                XAlertView *alert = [[XAlertView alloc]initWithTitle:msg message:nil clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
                    if (!canceled) {
                        NSString *str = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/gb/app/yi-dong-cai-bian/id%@?mt=8",AppIdAppStore];
                        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:str]]) {
                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
                        }
                    }
                } cancelButtonTitle:@"取消" otherButtonTitles:@"去升级", nil];
                [alert show];
            }else{
                [MBProgressHUD showPrompt:msg toView:weakself.view];
            }
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
            
        }];
    } else if([title isEqualToString:@"联系我们"]){
        appcommonglobalS *datea = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
        NSString * str=[[NSString alloc] initWithFormat:@"telprompt://%@",datea.phone];
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:str]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }else{
            [MBProgressHUD showPrompt:@"无效电话号码" toView:self.view];
        }
    } else if([title isEqualToString:@"软件许可使用协议"]){
        appcommonglobalS *datea = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
        lookWkweb *webVc = [[lookWkweb alloc]init];
        webVc.title = title;
        webVc.url = datea.license;
        [self.navigationController pushViewController:webVc animated:YES];
    } else if([title isEqualToString:@"把与游分享给朋友"]){
        shareTo *view = [[shareTo alloc]init];
        self.shareview = view;
        view.shareClick = ^(int index){
            appcommonglobalS *datea = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
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
        [view windosViewshow];
    }
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myDeVcSehzhiCell *cell = [myDeVcSehzhiCell returnCellWith:tableView];
    [self configuremyDeVcSehzhiCell:cell atIndexPath:indexPath];
    return  cell;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
