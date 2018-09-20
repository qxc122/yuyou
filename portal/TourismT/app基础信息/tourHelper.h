//
//  tourHelper.h
//  TourismT
//
//  Created by Store on 16/11/25.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tourInfo.h"
//#import "ToolModeldata.h"
#import "ToolRequest+common.h"
#import "SuPhotoManager.h"
#import <UMSocialCore/UMSocialCore.h>
typedef void (^photoSHouquanSuccess)();
typedef void (^photoSHouquanFailure)();
typedef void (^loginSuccess)(NSString *msg);
typedef void (^loginFailure)(NSString *msg);
typedef void (^ImageSuccess)(UIImage *tmpIMage);

typedef void (^ShareSuccess)(NSString *messg);
typedef void (^ShareFailure)(NSString *error);



@interface tourHelper : NSObject
+ (tourHelper *)sharedInstance;


- (BOOL)judgeisLogin;

- (BOOL)judgeIsHaveAppid;
- (BOOL)judgeBeOverdueAppid;

- (void)getAppidAndAppSecret;
- (void)getToken;
//- (void)RefreshToken;

//退出登录
-(void)logUrlOutView:(UIView *)view;
//第三方登录
//- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType loginSuccess:(loginSuccess)block  loginFailure:(loginFailure)Failblock;

- (void)WXShareWithtitle:(NSString *)title description:(NSString *)description webpageUrl:(NSString *)webpageUrl ThumbImage:(UIImage *)thumbImage  ThumbImage:(NSString *)thumbImageUrl scene:(int )scene;

//相册授权
- (void)photoSHouquan;

//相册授权访问
- (void)photoSHouquanOKsuccess:(photoSHouquanSuccess)successBlock failure:(photoSHouquanFailure)failureBlock;

- (void)Hylogin:(id)dataDict msg:(NSString *)msg code:(NSInteger)code loginSuccess:(loginSuccess)block  loginFailure:(loginFailure)Failblock;//环信登录

- (void)HylogOutmsg:(NSString *)msg  isToken:(BOOL )isToken loginSuccess:(loginSuccess)block  loginFailure:(loginFailure)Failblock;//环信退出


- (void )blurryGPUImage:(NSString *)ImageUrl :(NSString *)ImageName success:(ImageSuccess)block;
- (UIImage *)image:(UIImage*)image withBlurLevel:(CGFloat)blur;
//- (void )blurryWithImage:(UIImage *)ImageName withblur:(CGFloat)blur success:(ImageSuccess)block;

- (void)loadImageWithPhset:(PHAsset *)PHAssetDate Success:(ImageSuccess)block;

//判断图片缓存是否存在
- (UIImage *)TodeterminewhetherthereisacacheWith:(NSString *)url;

#pragma --mark< 获取全局参数 >
- (void)appcommonglobal_paramssuccess;

- (void)appcommonglobal_paramWithsuccess:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock;
    
- (void)tPayMethod:(NSDictionary *)thirdPayment;

@end
