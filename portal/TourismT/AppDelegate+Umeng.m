//
//  AppDelegate+Umeng.m
//  Tourism
//
//  Created by Store on 16/11/9.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "AppDelegate+Umeng.h"

@implementation AppDelegate (Umeng)
-(void)setupUMeng{
    [self setupUMengShare];
    [self setupUMengStatistics];
}
-(void)setupUMengShare{

#ifdef DEBUG
    //打开调试日志
    [[UMSocialManager defaultManager] openLog:NO];
#else
    //关闭调试日志
    [[UMSocialManager defaultManager] openLog:NO];
#endif
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:UmengAppKey];
    
    // 获取友盟social版本号
    //NSLog(@"UMeng social version: %@", [UMSocialGlobal umSocialSDKVersion]);
    
    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WechatAppID appSecret:WechatAppSecret redirectURL:@"http://mobile.umeng.com/social"];

    //设置分享到QQ互联的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAppid  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
    
    //设置新浪的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:sinaAPPKEY  appSecret:sinaSECRET redirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    //支付宝的appKey
   // [[UMSocialManager defaultManager] setPlaform: UMSocialPlatformType_AlipaySession appKey:AlipayKEY appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
}
-(void)setupUMengStatistics{
    UMConfigInstance.appKey = UmengAppKey;
#ifdef DEBUG
    UMConfigInstance.channelId = @"测试";
#else
    UMConfigInstance.channelId = @"App Store";
#endif
    

    
    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK！
}

@end
