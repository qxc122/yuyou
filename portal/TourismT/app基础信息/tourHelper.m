//
//  tourHelper.m
//  TourismT
//
//  Created by Store on 16/11/25.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "tourHelper.h"
#import "DateTools.h"
#import "WXApi.h"
#import "SDWebImageManager.h"
#import "NSDictionary+toData.h"
#import <Accelerate/Accelerate.h> 
#import "NSString+check.h"

@interface tourHelper ()
@end

@implementation tourHelper
+ (tourHelper *)sharedInstance
{
    static tourHelper *_shareInstance = nil;
    static dispatch_once_t cityTableToken;
    dispatch_once(&cityTableToken, ^{
        _shareInstance = [[tourHelper alloc] init];
    });
    return _shareInstance;
}

- (BOOL)judgeIsHaveAppid{
    BOOL tmp = YES;
    tourInfo *data = [tourInfo sharedInstance];
    if (data.toutInfoModed && data.tokenInfoModed) {
        tmp = YES;
    } else {
        tmp = NO;
    }
    return tmp;
}
- (BOOL)judgeBeOverdueAppid{
    tokenInfoMode *data = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_Token];
    NSTimeInterval time=[data.expireTime longLongValue]/1000;
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    NSInteger ttt = [[NSDate date] minutesEarlierThan:detaildate];
    if (ttt>60) {
        return NO; //NO TODo
    } else {
        return YES;
    }
    return YES;
}
- (BOOL)judgeisLogin{ //yes 已经登陆
    if ([tourInfo sharedInstance].UserInfo) {//登录
        return YES;
    }
    return NO;
}


- (void)getAppidAndAppSecret{
    kWeakSelf(self);
    NSLog(@"获取appid中");
    [[ToolRequest sharedInstance]getAppIdWithsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        toutInfoMode *data = [toutInfoMode mj_objectWithKeyValues:dataDict];
        [tourInfo sharedInstance].toutInfoModed = data;
        [weakself getToken];
    } failure:^(NSInteger errorCode, NSString *msg) {
//        [weakself getAppidAndAppSecret];
        [weakself performSelector:@selector(getAppidAndAppSecret) withObject:nil afterDelay:1.5f];
        NSLog(@"获取appid 失败 重新获取中");
    }];
}
- (void)getToken{
    kWeakSelf(self);
    NSLog(@"获取Token中");
    [[ToolRequest sharedInstance]getTokenWithAppId:[tourInfo sharedInstance].toutInfoModed.appId success:^(id dataDict, NSString *msg, NSInteger code) {
        tokenInfoMode *data = [tokenInfoMode mj_objectWithKeyValues:dataDict];
        [tourInfo sharedInstance].tokenInfoModed = data;
        
        NSNotification *notification =[NSNotification notificationWithName:TOKENSUCCESS object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    } failure:^(NSInteger errorCode, NSString *msg) {
//        [weakself getToken];
        [weakself performSelector:@selector(getToken) withObject:nil afterDelay:1.5f];
         NSLog(@"获取Token 失败 重新获取中");
    }];
}
/*
- (void)RefreshToken{
    kWeakSelf(self);
   [[ToolRequest sharedInstance]refreshTokenTokenWithsuccess:^(id dataDict, NSString *msg, NSInteger code) {
       tokenInfoMode *dataNew = [tokenInfoMode mj_objectWithKeyValues:dataDict];
       tokenInfoMode *dataOle = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_Token];
       dataNew.sessionKey = dataOle.sessionKey;
       dataNew.sessionSecret = dataOle.sessionSecret;
       [tourInfo sharedInstance].tokenInfoModed = dataNew;
   } failure:^(NSInteger errorCode, NSString *msg) {
       [weakself performSelector:@selector(RefreshToken) withObject:nil afterDelay:0.5f];
//       [weakself RefreshToken];
       NSLog(@"刷新Token 失败 重新获取中");
   }];
}
*/




- (void)WXShareWithtitle:(NSString *)title description:(NSString *)description webpageUrl:(NSString *)webpageUrl ThumbImage:(UIImage *)thumbImage  ThumbImage:(NSString *)thumbImageUrl scene:(int )scene{
        if(![WXApi isWXAppInstalled]) {
            [MBProgressHUD showPrompt:@"您还没有安装微信客户端哦"];
        }else{
            if (thumbImage) {
                [self SendMessageToWXReqShareWithTitle:title description:description scene:scene iamgeDate:thumbImage webpageUrl:webpageUrl];
            }else if (thumbImageUrl){
                kWeakSelf(self);
                [MBProgressHUD showLoadingMessage:@"准备分享中..."];
                [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:thumbImageUrl] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize)
                 {
                     //处理下载进度
                 } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                     [MBProgressHUD hideHUD];
                     if (finished) {
                         [weakself SendMessageToWXReqShareWithTitle:title description:description scene:scene iamgeDate:image webpageUrl:webpageUrl];
                     } else {
                         [MBProgressHUD showPrompt:@"准备分享图片失败"];
                     }
                 }];
            }else{
                [self SendMessageToWXReqShareWithTitle:title description:description scene:scene iamgeDate:ImageNamed(@"logo关于") webpageUrl:webpageUrl];
            }
        }
}
//退出登录
-(void)logUrlOutView:(UIView *)view{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"退出中..." toView:view];
    [[ToolRequest sharedInstance]apploginlogoutsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        // 创建文件管理对象
        [[tourHelper sharedInstance]HylogOutmsg:msg  isToken:NO  loginSuccess:^(NSString *msg) {
            [MBProgressHUD hideHUDForView:view];
            [MBProgressHUD showPrompt:msg];
        } loginFailure:^(NSString *msg) {
            [tourInfo sharedInstance].UserInfo = nil;
            [MBProgressHUD hideHUDForView:view];
            [MBProgressHUD showPrompt:msg toView:view];
        }];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:view];
        [MBProgressHUD showPrompt:msg toView:view];
        [weakself performSelector:@selector(logUrlOutView:) withObject:view afterDelay:0.1f];
    }];
}


//- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType loginSuccess:(loginSuccess)block  loginFailure:(loginFailure)Failblock
//{
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
//        
//        UMSocialUserInfoResponse *resp = result;
//        if (resp) {
//            // 第三方登录数据(为空表示平台未提供)
//            // 授权数据
//            NSLog(@" uid: %@", resp.uid);
//            NSLog(@" openid: %@", resp.openid);
//            NSLog(@" accessToken: %@", resp.accessToken);
//            NSLog(@" refreshToken: %@", resp.refreshToken);
//            NSLog(@" expiration: %@", resp.expiration);
//            
//            // 用户数据
//            NSLog(@" name: %@", resp.name);
//            NSLog(@" iconurl: %@", resp.iconurl);
//            NSLog(@" gender: %@", resp.gender);
//            
//            // 第三方平台SDK原始数据
//            NSLog(@" originalResponse: %@", resp.originalResponse);
//            
//            NSString *ttype;
//            if (platformType == UMSocialPlatformType_Sina) {
//                ttype = @"weibo";
//            } else if (platformType == UMSocialPlatformType_WechatSession){
//                ttype = @"weixin";
//            } else if (platformType == UMSocialPlatformType_QQ){
//                ttype = @"qq";
//            }
//            [[ToolRequest sharedInstance]apploginsubmit_wxWithavatar:resp.iconurl city:@"" address:@"" country:@"" gender:[resp.gender integerValue] nickname:resp.name openId:resp.openid?resp.openid:resp.uid openIdType:ttype province:@"" unionid:resp.uid success:^(id dataDict, NSString *msg, NSInteger code) {
//                
//                [[tourHelper sharedInstance]Hylogin:dataDict msg:msg code:code loginSuccess:^(NSString *msg) {
//                    block(msg);
//                } loginFailure:^(NSString *msg) {
//                    Failblock(msg);
//                }];
//            } failure:^(NSInteger errorCode, NSString *msg) {
//                Failblock(msg);
//            }];
//        } else {
//            Failblock(@"登录失败");
//        }
//    }];
//}
/**
 *  等比缩放本图片大小
 *
 *  @param newImageWidth 缩放后图片宽度，像素为单位
 *
 *  @return self-->(image)
 */
- (UIImage *)compressImage:(UIImage *)image newWidth:(CGFloat)newImageWidth
{
    if (!image) return nil;
    float imageWidth = image.size.width;
    float imageHeight = image.size.height;
    float width = newImageWidth;
    float height = image.size.height/(image.size.width/width);
    
    float widthScale = imageWidth /width;
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
    }
    else {
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
    }
    
    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

- (void)SendMessageToWXReqShareWithTitle:(NSString *)title  description:(NSString *)description scene:(int )scene  iamgeDate:(UIImage *)imageDate webpageUrl:(NSString *)webpageUrl{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    
    WXWebpageObject *webpageObject = [WXWebpageObject object];
    webpageObject.webpageUrl = webpageUrl;
    message.mediaObject = webpageObject;
    
    CGFloat width = 100.0;
    UIImage *tmp =[self compressImage:imageDate newWidth:width];
    NSData *imageDataTmp = UIImageJPEGRepresentation(tmp,1.0);//进行图片压缩
    while (imageDataTmp.length > 31*1024) {
//        tmp = imageDate;
        UIImage *tmp =[self compressImage:imageDate newWidth:width-10];
        imageDataTmp = UIImageJPEGRepresentation(tmp, 1.0);
    }
//    NSData *imageData = UIImageJPEGRepresentation(imageDate,1.0);//进行图片压缩
//    if (imageData.length > 31*1000) {
//        imageData = UIImageJPEGRepresentation(imageDate, 31*1000/imageData.length); asdf
//    }
    
    message.thumbData = imageDataTmp;
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    [WXApi sendReq:req];
}

- (void)photoSHouquan{
    PHAuthorizationStatus authoriation = [PHPhotoLibrary authorizationStatus];
    if (authoriation == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            //这里非主线程，选择完成后会出发相册变化代理方法
        }];
    }
}

- (void)photoSHouquanOKsuccess:(photoSHouquanSuccess)successBlock failure:(photoSHouquanFailure)failureBlock{
    PHAuthorizationStatus authoriation = [PHPhotoLibrary authorizationStatus];
    if (authoriation == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            //这里非主线程，选择完成后会出发相册变化代理方法
            if (status == PHAuthorizationStatusAuthorized) {
                successBlock();
            } else {
                XAlertView *tmp = [[XAlertView alloc]initWithTitle:@"不能预览图片" message:@"应用程序无访问照片权限" clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
                    if (canceled) {
                        failureBlock();
                    } else {
                        // 去设置权限
                        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                        if ([[UIApplication sharedApplication] canOpenURL:url]) {
                            [[UIApplication sharedApplication] openURL:url];
                        }
                    }
                } cancelButtonTitle:@"取消" otherButtonTitles:@"去设置", nil];
                [tmp show];
            }
        }];
    }else if (authoriation == PHAuthorizationStatusAuthorized) {
        // Do any additional setup after loading the view.
        successBlock();
    }else {
        XAlertView *tmp = [[XAlertView alloc]initWithTitle:@"不能预览图片" message:@"应用程序无访问照片权限" clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
            if (canceled) {
                failureBlock();
            } else {
                // 去设置权限
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
        } cancelButtonTitle:@"取消" otherButtonTitles:@"去设置", nil];
        [tmp show];
    }
}

- (void)Hylogin:(id)dataDict msg:(NSString *)msg code:(NSInteger)code loginSuccess:(loginSuccess)block  loginFailure:(loginFailure)Failblock {
    
    kWeakSelf(self);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        appS *dataapp = [appS mj_objectWithKeyValues:dataDict];
            BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
            if (!isAutoLogin) {
                EMError *error = [[EMClient sharedClient] loginWithUsername:dataapp.emChatId password:Hypassword];
                if (!error)
                {
                    
                    [tourInfo sharedInstance].UserInfo = dataapp;
                    [[EMClient sharedClient].options setIsAutoLogin:YES];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakself storeInformationAndSendNotificationsWith:dataapp WithMsg:msg Withblock:block];
                    });
                }else{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        Failblock(error.errorDescription);
                    });
                }
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakself storeInformationAndSendNotificationsWith:dataapp WithMsg:msg Withblock:block];
                });
            }
    });
}

- (void)storeInformationAndSendNotificationsWith:(appS *)userInfo WithMsg:(NSString *)msg Withblock:(loginSuccess)block{
    [tourInfo sharedInstance].UserInfo = userInfo;
    
    NSDictionary *dictTmp = @{LoginAndExitNotice:@(YES),};
    NSNotification *notification =[NSNotification notificationWithName:LoginAndExitNotice object:nil userInfo:dictTmp];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    NSLog(@"PATH_userForApp=%@",PATH_userForApp);
    // 解档
//                    appS *ddf = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_userForApp];
//    appS *ddf2 = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_userForApp];
//    appS *ddf3 = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_userForApp];
    block(msg);
}

- (void)HylogOutmsg:(NSString *)msg isToken:(BOOL )isToken loginSuccess:(loginSuccess)block  loginFailure:(loginFailure)Failblock {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        EMError *error = [[EMClient sharedClient] logout:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error || isToken) {
                [tourInfo sharedInstance].UserInfo = nil;
                block(msg);
            }else{
                Failblock(error.errorDescription);
            }
        });
    });
}

- (void )blurryGPUImage:(NSString *)ImageUrl :(NSString *)ImageName success:(ImageSuccess)block{
    if (ImageUrl) {
        [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:ImageUrl]  options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
             if (image) {
                 kWeakSelf(self);
                 dispatch_async(dispatch_get_global_queue(0, 0), ^{
                     UIImage *blurImage = [weakself blurryImage:image withBlurLevel:FuzzyCoefficient];
                     dispatch_async(dispatch_get_main_queue(), ^{
                         block(blurImage);
                     });
                 });
             }
        }];

    }else{
        kWeakSelf(self);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            UIImage *blurImage = [weakself blurryImage:[UIImage imageNamed:ImageName] withBlurLevel:0.15];
            dispatch_async(dispatch_get_main_queue(), ^{
                block(blurImage);
            });
        });
    }

//    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithURL:[NSURL URLWithString:inputImage]];
//    GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
//    [stillImageSource addTarget:stillImageFilter];
//    [stillImageFilter useNextFrameForImageCapture];
//    [stillImageSource processImage];
//    UIImage *currentFilteredVideoFrame = [stillImageFilter imageFromCurrentFramebuffer];
//    return currentFilteredVideoFrame;
}

- (void)loadImageWithPhset:(PHAsset *)PHAssetDate Success:(ImageSuccess)block{
//    MWPhoto *photo = [[MWPhoto alloc]initWithAsset:PHAssetDate targetSize:CGSizeMake(1000, 1000)];
//    UIImage *image = [self.photoBrowser imageForPhoto:photo];
//    if (image) {
//        block(image);
//    }else{
//        block(nil);
//    }
//    - (void)getImageDataLength:(PHAsset *)asset completeBlock:(void(^)(CGFloat length))completeBlock{

//    [[SuPhotoManager manager] fetchImageInAsset:PHAssetDate size:CGSizeMake(1024, 1024) isResize:YES completeBlock:^(UIImage *image, NSDictionary *info) {
//        if (image) {
//            block(image);
//        }else{
//            block(nil);
//        }
//    }];
    
    NSMutableArray *mua = [NSMutableArray array];
    [mua addObject:PHAssetDate];
    [[SuPhotoManager manager]fetchImagesWithAssetsArray:mua  isOriginal:YES completeBlock:^(NSArray *images) {
        // 回到主线程显示图片
        if (images) {
            block(images[0]);
        }else{
            block(nil);
        }
    }];
}

- (UIImage *)TodeterminewhetherthereisacacheWith:(NSString *)url{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSString* key = [manager cacheKeyForURL:[NSURL URLWithString:url]];
    SDImageCache* cache = [SDImageCache sharedImageCache];
    //此方法会先从memory中取。
    return [cache imageFromDiskCacheForKey:key];
}

#pragma --mark< 获取全局参数,有回调函数>
- (void)appcommonglobal_paramWithsuccess:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock{
    [[ToolRequest sharedInstance]appcommonglobal_paramssuccess:^(id dataDict, NSString *msg, NSInteger code) {
        appcommonglobalS *datea = [appcommonglobalS mj_objectWithKeyValues:dataDict];
        [NSKeyedArchiver archiveRootObject:datea toFile:PATH_appcommonglobal];
        
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
        successBlock(dataDict,msg,code);
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showError:msg];
        failureBlock(errorCode,msg);
    }];
}


#pragma --mark< 获取全局参数 >
- (void)appcommonglobal_paramssuccess{
    [self appcommonglobal_paramWithsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        
    } failure:^(NSInteger errorCode, NSString *msg) {
        
    }];
}
- (void)tPayMethod:(NSDictionary *)thirdPayment{
    
//    NSDictionary *datajsonData = thirdPayment;
    NSString *TUlr = @"togetherTPay://";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:TUlr]]){
        
//        NSNumber *mone = [];
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSDictionary *data = @{
                               @"WhoCalls":@"Tourism",
                               @"businessID":thirdPayment[@"businessID"],
                               @"businessType":thirdPayment[@"businessType"],
                               @"businessName":thirdPayment[@"businessName"],
                               @"money":[NSString stringWithFormat:@"%@",thirdPayment[@"money"]],
                               @"supportTcoin":thirdPayment[@"supportTcoin"],
                               };
        [pasteboard setData:[NSDictionary returnDataWithDictionary:data] forPasteboardType:@"data"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:TUlr]];
    }else{
#ifdef DEBUG
        NSString *title;
        NSString *message;
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"testwalletTbi"]] || [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"testwallet"]]) {
            title = @"您当前的T钱包版本不支持该操作";
            message = @"去升级";
        } else {
            title = @"您还没有安装T钱包客户端哦";
            message = @"去安装";
        }
        XAlertView *alert = [[XAlertView alloc]initWithTitle:title message:message clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
            if (!canceled) {
                NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/t-qian-bao/id1061514008?mt=8"];
                if ([[UIApplication sharedApplication] canOpenURL:url]){
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
        } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
#else
        appcommonglobalS *datea = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appcommonglobal];
        if (![datea.IOSSpecialD.IsInstallTPay isEqualToString:@"0"]) {
            NSString *title;
            NSString *message;
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"testwalletTbi"]] || [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"testwallet"]]) {
                title = @"您当前的T钱包版本不支持该操作";
                message = @"去升级";
            } else {
                title = @"您还没有安装T钱包客户端哦";
                message = @"去安装";
            }
            XAlertView *alert = [[XAlertView alloc]initWithTitle:title message:message clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
                if (!canceled) {
                    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/t-qian-bao/id1061514008?mt=8"];
                    if ([[UIApplication sharedApplication] canOpenURL:url]){
                        [[UIApplication sharedApplication] openURL:url];
                    }
                }
            } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }else{
            [MBProgressHUD showPrompt:@"您没有安装T钱包客户端~"];
        }
#endif
    }
}


//- (void )blurryWithImage:(UIImage *)ImageName withblur:(CGFloat)blur success:(ImageSuccess)block{
//    CIImage *inputImage = [CIImage imageWithCGImage:ImageName.CGImage];
//    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:kCIInputImageKey,inputImage,@"inputRadius", @(blur), nil];
//    
//
//    CIContext *tpmContext = [[CIContext alloc]init];
//    
//    CIImage *outputImage = filter.outputImage;
//    CGImageRef outImage = [tpmContext createCGImage:outputImage fromRect:[outputImage extent]];
//    block([UIImage imageWithCGImage:outImage]);
//}



//- (void)vImageImplement {
//    UIImage *image = [UIImage imageNamed:@"456"];
//    UIImage *blurImage = [self blurryImage:image withBlurLevel:0.1];
//    //    self.view.backgroundColor = [UIColor colorWithPatternImage:blurImage];
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:blurImage];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.frame = self.view.bounds;
//    [self.view addSubview:imageView];
//}

#pragma --mark<缩小图片>  对于那些怎么压缩都超过1M的，用于图片上传，PS，图片模糊也可以用这个来实现
- (UIImage *)image:(UIImage*)image withBlurLevel:(CGFloat)blur{
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    CGSize sourceSize = sourceImage.size;
    CGSize newSize = CGSizeMake(sourceSize.width*blur*scale_screen, sourceSize.height*blur*scale_screen);
    UIGraphicsBeginImageContext(newSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size  = newSize;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage ;
}


- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    
    
    return [self image:image withBlurLevel:blur];
    
/*
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 100);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL){
        if (pixelBuffer) {
            free(pixelBuffer);
        }
        if (inBitmapData) {
            CFRelease(inBitmapData);
        }
        return image;
        NSLog(@"error from convolution %ld", error);
        NSLog(@"No pixelbuffer");
    }
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    
    if (error) {
        if (pixelBuffer) {
            free(pixelBuffer);
        }
        if (inBitmapData) {
            CFRelease(inBitmapData);
        }
        return image;
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    if (ctx) {
        CGContextRelease(ctx);
    }
    if (colorSpace) {
        CGColorSpaceRelease(colorSpace);
    }
    if (pixelBuffer) {
        free(pixelBuffer);
    }
    if (inBitmapData) {
        CFRelease(inBitmapData);
    }
    if (colorSpace) {
        CGColorSpaceRelease(colorSpace);
    }
    if (imageRef) {
        CGImageRelease(imageRef);
    }
    
    return returnImage;
 */
}

@end

