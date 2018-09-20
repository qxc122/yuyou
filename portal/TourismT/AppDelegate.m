//
//  AppDelegate.m
//  TourismT
//
//  Created by Store on 16/11/14.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "AppDelegate.h"
#import "mainVc.h"
#import "AppDelegate+Umeng.h"
#import "AppDelegate+EaseMob.h"
#import "IQKeyboardManager.h"
#import "WXApi.h"
#import <UserNotifications/UserNotifications.h>
#import "ChatDemoHelper.h"
#import "AppTools.h"
#import "MZGuidePages.h"

#import "teachingPage.h"
@interface AppDelegate ()<UNUserNotificationCenterDelegate,WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if (NSClassFromString(@"UNUserNotificationCenter")) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    }
    
    [application setStatusBarStyle:UIStatusBarStyleLightContent];

    //appid
    if ([[tourHelper sharedInstance]judgeIsHaveAppid]) {    //有appid
        if ([[tourHelper sharedInstance]judgeBeOverdueAppid]) {    //appid过期了
            [tourInfo sharedInstance].UserInfo = nil;
            [[tourHelper sharedInstance]getToken];
        }
    }else{  //没有appid
        [[tourHelper sharedInstance]getAppidAndAppSecret];
    }

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    self.mainController = [[mainVc alloc] init];
    self.window.rootViewController = self.mainController;
    [self.window makeKeyAndVisible];


    //第三方平台初始化
    [self setupUMeng];
    [self easemobApplication:application didFinishLaunchingWithOptions:launchOptions appkey:EaseMobAppKey apnsCertName:EaseMobapnsCertName otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];


//    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
      //  [UIImage returnImageWithImage:ImageNamed(IMAGE_NavcBack) WithInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
        
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:IMAGE_NavcBack] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    }
    
    [WXApi registerApp:WechatAppID];
   
#ifdef  DEBUG
    [IQKeyboardManager sharedManager].enableDebugging = YES;
#else
    [IQKeyboardManager sharedManager].enableDebugging = NO;
#endif
    [IQKeyboardManager sharedManager].toolbarDoneBarButtonItemText = @"完成";
//    [IQKeyboardManager sharedManager] ;
//    [[IQKeyboardManager sharedManager] disableToolbarInViewControllerClass:[EaseMessageViewController class]];
    
    [AppTools onFirstStartForCurrentVersion:^(BOOL isFirstStartForCurrentVersion) {
        if (isFirstStartForCurrentVersion) {
            [self guidePages];
            NSLog(@"首次启动显示App引导页");
        }
    }];
//    [self guidePages];
//#ifdef DEBUG
//    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
//        if (type == JPCallbackTypeJSException) {
//            NSAssert(NO, data[@"msg"]);
//        }
//    }];
//#endif
//    [JSPatch startWithAppKey:@"3c76a820445d258d"];
//#ifdef DEBUG
//    [JSPatch setupDevelopment];
//#endif
    return YES;
}
#pragma --mark<3D_TOUCH>
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if([shortcutItem.type isEqualToString:@"出发"]){
        NSLog(@"出发");
        [self.mainController jumpToHomePageVc];
    }else if ([shortcutItem.type isEqualToString:@"分享"]){
        NSLog(@"分享");
        [self.mainController jumpToPublishShare];
    }
}
#pragma --mark<添加教学页>
- (void)AddTeachingPage{
    teachingPage *page = [teachingPage new];
    [page windosViewshow];
}
#pragma --mark<引导页信息>
- (void)guidePages
{
    [self AddTeachingPage];
    NSArray *imageArray = @[ @"引导页1", @"引导页2", @"引导页3" ];
    MZGuidePages *mzgpc = [[MZGuidePages alloc] init];
    mzgpc.imageDatas = imageArray;
    __weak typeof(MZGuidePages) *weakMZ = mzgpc;
    mzgpc.buttonAction = ^{
        [UIView animateWithDuration:1.0f
                         animations:^{
                             weakMZ.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [weakMZ removeFromSuperview];
                         }];
    };
    [self.window addSubview:mzgpc];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}
#pragma --mark<环信代理   账号被登录  删除  自动登录>
- (void)didAutoLoginWithError:(EMError *)aError{
    if (!aError) {
        NSLog(@"环信自动登录成功");
    }
}




// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[EMClient sharedClient] applicationWillEnterForeground:application];
    if ([[tourHelper sharedInstance]judgeBeOverdueAppid]) {    //appid过期了
        [[tourHelper sharedInstance]getToken];
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
//    [JSPatch sync];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];  //[[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
        result = [WXApi handleOpenURL:url delegate:self];
    }
    if (!result) {
        // 其他如支付等SDK的回调
        result = [self Tpay:url];
    }
    
    return result;
}

- (BOOL)Tpay:(NSURL *)url{  //T钱包支付
    BOOL tmp;
    if ([[url absoluteString] hasPrefix:@"Tourism"]) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSData *imageData = [pasteboard dataForPasteboardType:@"dataToZeji"];
        if (imageData) {
            NSDictionary *data = [self returnDictionaryWithDataPath:imageData];
            NSString *strMsg = data[@"mmssgg"];
            
            int errCode=0;
            if ([strMsg isEqualToString:@"支付成功"]) {
                errCode = WXSuccess;
                [MBProgressHUD showPrompt:@"支付成功"];
            } else if ([strMsg isEqualToString:@"用户取消"]){
                errCode = WXErrCodeUserCancel;
                [MBProgressHUD showPrompt:@"您已经取消支付"];
            }else if ([strMsg isEqualToString:@"支付失败"]){
                errCode = WXErrCodeCommon;
                [MBProgressHUD showPrompt:@"支付失败"];
            }
            NSDictionary *dictTmp = @{wechatPayState:[NSString stringWithFormat:@"%d",errCode]};
            NSNotification *notification = [NSNotification notificationWithName:wechatPayState object:nil userInfo:dictTmp];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            [UIPasteboard removePasteboardWithName:@"dataToZeji"];
        }
        tmp = YES;
    }else{
        tmp = NO;
    }
    return  tmp;
}
-(NSDictionary*)returnDictionaryWithDataPath:(NSData*)data

{
    
    //  NSData* data = [[NSMutableData alloc]initWithContentsOfFile:path]; 拿路径文件
    
    NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    NSDictionary* myDictionary = [unarchiver decodeObjectForKey:@"talkData"];
    
    [unarchiver finishDecoding];
    
    return myDictionary;
    
}
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//    return [WXApi handleOpenURL:url delegate:self];
//}
#pragma --mark<微信登录>
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if (_mainController) {
        [_mainController jumpToChatList];
    }
    [self easemobApplication:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    if (_mainController) {
        [_mainController didReceiveLocalNotification:notification];
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    NSDictionary *userInfo = notification.request.content.userInfo;
    [self easemobApplication:[UIApplication sharedApplication] didReceiveRemoteNotification:userInfo];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{

    if (_mainController) {
        [_mainController didReceiveUserNotification:response.notification];
    }
    completionHandler();
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
#ifdef DEBUG
    [MBProgressHUD showPrompt:userActivity.webpageURL.path];
#endif
    return YES;
}

#pragma mark---微信登录
- (void)onResp:(BaseResp *)resp
{
//    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
//        SendMessageToWXResp *response = (SendMessageToWXResp *)resp;
//        if (response.errCode == WXSuccess) {
//            [MBProgressHUD showPrompt:@"分享成功"];
//        } else if (response.errCode == WXErrCodeUserCancel) {
//            [MBProgressHUD showPrompt:@"您已经取消分享"];
//        } else {
//            [MBProgressHUD showPrompt:@"分享失败"];
//        }
//        NSDictionary *dictTmp = @{wechatShareState:@(response.errCode)};
//        NSNotification *notification = [NSNotification notificationWithName:wechatShareState object:nil userInfo:dictTmp];
//        [[NSNotificationCenter defaultCenter] postNotification:notification];
//    }else
    if ([resp isKindOfClass:[PayResp class]]) {
        PayResp *response = (PayResp *)resp;
        if (response.errCode == WXSuccess) {
            [MBProgressHUD showPrompt:@"支付成功"];
        } else if (response.errCode == WXErrCodeUserCancel) {
            [MBProgressHUD showPrompt:@"您已经取消支付"];
        } else {
            [MBProgressHUD showPrompt:@"支付失败"];
        }
        NSDictionary *dictTmp = @{wechatPayState:[NSString stringWithFormat:@"%d",response.errCode]};
        NSNotification *notification = [NSNotification notificationWithName:wechatPayState object:nil userInfo:dictTmp];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
    
    
    else if ([resp isKindOfClass:[SendAuthResp class]]) {
        SendAuthResp *aresp = (SendAuthResp *)resp;
        if (aresp.errCode == WXSuccess) {
            NSDictionary *dictTmp = @{wechatlogin:aresp.code};
            NSNotification *notification = [NSNotification notificationWithName:wechatlogin object:nil userInfo:dictTmp];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
        } else if (aresp.errCode == WXErrCodeUserCancel) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:@"微信登录失败"];
        } else {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:@"微信登录失败"];
        }
    }
    

}


//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
//    if (!result) {
//        // 其他如支付等SDK的回调
//    }
//    return result;
//}
@end
