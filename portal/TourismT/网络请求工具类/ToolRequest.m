//
//  ToolRequest.m
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "ToolRequest.h"
#import "AFNetworking.h"
#import "MACRO_ENUM.h"
#import "MACRO_URL.h"
#import "tourInfo.h"
#import "DateTools.h"
#import "NSString+check.h"
#import "NSUserDefaults+storage.h"

#define REAUESRTIMEOUT      10    //网络请求超时时间

#ifdef DEBUG
#define PROMPT_FAIL         @"加载失败 wo"
#define PROMPT_NOTJSON      @"服务器返回数据格式有误 wo"
#define PROMPT_NOTCONNECT   @"请检查您的网络设置 wo"
#else
#define PROMPT_FAIL         @"加载失败"
#define PROMPT_NOTJSON      @"服务器返回数据格式有误"
#define PROMPT_NOTCONNECT   @"请检查您的网络设置"
#endif

@interface ToolRequest ()
@property (strong, nonatomic) NSString *baseURLStr;
@property (assign, atomic) AFNetworkReachabilityStatus status;
@end

@implementation ToolRequest
+ (ToolRequest *)sharedInstance
{
    static ToolRequest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        
        //1.创建网络状态监测管理者
        AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];
        //开启监听，记得开启，不然不走block
        [manger startMonitoring];
        //2.监听改变
        [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            instance.status = status;
            /*
             AFNetworkReachabilityStatusUnknown = -1,
             AFNetworkReachabilityStatusNotReachable = 0,
             AFNetworkReachabilityStatusReachableViaWWAN = 1,
             AFNetworkReachabilityStatusReachableViaWiFi = 2,
             */
//            switch (status) {
//                case AFNetworkReachabilityStatusUnknown:
//                    NSLog(@"未知");
//                    break;
//                case AFNetworkReachabilityStatusNotReachable:
//                    NSLog(@"没有网络");
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWWAN:
//                    NSLog(@"3G|4G");
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWiFi:
//                    NSLog(@"WiFi");
//                    break;
//                default:
//                    break;
//            }
        }];
    });
#ifdef DEBUG
    NSString *strles = [NSUserDefaults getObjectWithKey:URLAddress];
    if (!strles) {
        [NSUserDefaults setObject:tesetURLAddress withKey:URLAddress];
        strles = tesetURLAddress;
    }else{
        strles = strles;
    }
    instance.baseURLStr = strles;
#else
    instance.baseURLStr = URLBASIC;
#endif
    
    return instance;
}
- (void)getWithPath:(NSString *)path
         parameters:(NSMutableDictionary *)parameters
            success:(RequestSuccess)successBlock
            failure:(RequestFailure)failureBlock
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", self.baseURLStr, path];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = REAUESRTIMEOUT;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    [manager GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
            [self parseResponseData:result
                            success:^(id dataDict, NSString *msg, NSInteger code) {
                                
                                successBlock(dataDict, msg, code);
                            }
                            failure:^(NSInteger errorCode, NSString *msg) {
                                failureBlock(errorCode, msg);
                            }
             ifRespondDataEncrypted:NO];
        }else{
            failureBlock(KRespondCodeNone, @"服务器返回数据为空");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.status == AFNetworkReachabilityStatusNotReachable) {
            failureBlock(KRespondCodeNotConnect, PROMPT_NOTCONNECT);
        }else{
            NSDictionary *tmp = error.userInfo;
            NSString *tmpStr = tmp[@"NSLocalizedDescription"];
            failureBlock(KRespondCodeFail, tmpStr);
        }
    }];
}


- (void)postJsonWithPath:(NSString *)path
              parameters:(NSMutableDictionary *)parameters
                 success:(RequestSuccess)successBlock
                 failure:(RequestFailure)failureBlock
{
    NSString *sign = @"1";
//    NSString *timestamp = [NSString stringWithFormat:@"%ld",(NSUInteger)[[NSDate date]timeIntervalSince1970InMilliSecond]];
//    NSString *timestamp = @"1231233123";
    NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[NSDate date].timeIntervalSince1970];
    NSString *token = [tourInfo sharedInstance].tokenInfoModed.accessToken?[tourInfo sharedInstance].tokenInfoModed.accessToken:@"";
    if (([path isEqualToString:URLBASIC_applyAppId] || [path isEqualToString:URLBASIC_applyToken]) || token.length) {
        NSDictionary *head = @{
                               @"sign":sign,
                               @"timestamp":timestamp,
                               @"token":token,
                               };
//        NSLog(@"token=%@\n\n\n",token);
        [parameters setObject:head forKey:@"head"];
        NSLog(@"path=%@\n\n\n parameters=%@\n\n\n",path ,parameters );
        NSString *urlStr = [NSString stringWithFormat:@"%@%@", self.baseURLStr, path];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = REAUESRTIMEOUT;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
#ifdef DEBUG
        NSString *strTmp = [NSString dictionaryToJson:parameters];
        NSLog(@"strTmp=%@  path=%@",strTmp,path);
#endif
        manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json", @"application/json",@"text/html", nil];
        
        [manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (responseObject) {
                id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
                [self parseResponseData:result
                                success:^(id dataDict, NSString *msg, NSInteger code) {
                                    
                                    successBlock(dataDict, msg, code);
                                }
                                failure:^(NSInteger errorCode, NSString *msg) {
                                    failureBlock(errorCode, msg);
                                }
                 ifRespondDataEncrypted:NO];
            }else{
                failureBlock(KRespondCodeNone, @"服务器返回数据为空");
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (self.status == AFNetworkReachabilityStatusNotReachable) {
                failureBlock(KRespondCodeNotConnect, PROMPT_NOTCONNECT);
            }else{
                NSDictionary *tmp = error.userInfo;
                NSString *tmpStr = tmp[@"NSLocalizedDescription"];
                failureBlock(KRespondCodeFail, tmpStr);
            }
        }];
    }else{
        failureBlock(appTOKENING, @"申请TOKEN中");
    }
}

//验证返回数据是否正确
- (void)parseResponseData:(id)responseData
                  success:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock
   ifRespondDataEncrypted:(BOOL)encryptedReponse
{
    NSDictionary *jsonRootObject = (NSDictionary *)responseData;
    if (jsonRootObject == nil) {
        failureBlock(kRespondCodeNotJson, PROMPT_NOTJSON);
    }else {
        NSInteger code = [[jsonRootObject valueForKeyPath:@"head.code"] integerValue];
        NSString *msg = [jsonRootObject valueForKeyPath:@"head.msg"];
        id data = [jsonRootObject objectForKey:@"data"];
        if (code == kRespondCodeSuccess || code == kRespondCodeWaring) {
            successBlock(data, msg, code);
        }else if (code == kRespondCodeOutDateAccessToken) {    /** 缺少Token */
            failureBlock(code, msg);
            [[tourHelper sharedInstance]getToken];
        }else if (code == kRespondCodeExoipDateAccessToken) {    /** Token无效 */
            [[tourHelper sharedInstance]HylogOutmsg:msg  isToken:YES  loginSuccess:^(NSString *msg) {

            } loginFailure:^(NSString *msg) {

            }];
            failureBlock(code, msg);
            [[tourHelper sharedInstance]getToken];
        }else if (code == kRespondCodeFial) {
            failureBlock(code, msg);
        }else if (code == KRespondCodeLoginTimeOut) {
            failureBlock(code, msg);
        }else if (code == KRespondCodeAppidinvalid) { //appid 无效
            [[tourHelper sharedInstance]getAppidAndAppSecret];
            failureBlock(code, msg);
        }else if (code == kRespondCodeloOut) {    //用户未登录
            failureBlock(code, msg);
            [tourInfo sharedInstance].UserInfo = nil;
        }else {
            failureBlock(code, msg);
        }
        
    }
}
- (void)uploadWithPath:(NSString *)path
        avatarFile:(UIImage *)avatarFile
        parameters:(NSMutableDictionary *)parameters
        progress:(RequestProgress)progressBlock
           success:(RequestSuccess)successBlock
           failure:(RequestFailure)failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = REAUESRTIMEOUT;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    
    //2.上传文件
    [manager POST:[NSString stringWithFormat:@"%@%@", self.baseURLStr, path] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        NSData *imageData = UIImageJPEGRepresentation(avatarFile,0.5);//进行图片压缩
//        //上传文件参数
//        if (imageData) {
//                [formData appendPartWithFileData:imageData name:@"file" fileName:@"avatarFile.png" mimeType:@"image/jpeg"];
//        }
        
        UIImage *tmp = avatarFile;
        NSData *imageData = UIImageJPEGRepresentation(tmp,1.0);//进行图片压缩
        CGFloat yasou=0.99;
        while (imageData.length > 1024*1024) {
            tmp = avatarFile;
            NSLog(@"太大了  imageData.leng=%ld K  yasou=%f",imageData.length/(1024),yasou);
            imageData = UIImageJPEGRepresentation(tmp, yasou);
            yasou -=0.01;
        }
        NSLog(@"imageData.leng=%ld k",imageData.length/1024);
        if (imageData.length) {
            [formData appendPartWithFileData:imageData name:@"files" fileName:@"files.png" mimeType:@"image/png"];
        }else{
            failureBlock(KRespondImageCodeFail, @"图片压缩失败");
        }
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印上传进度
        progressBlock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        if (responseObject) {
            id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
            [self parseResponseData:result
                            success:^(id dataDict, NSString *msg, NSInteger code) {
                                
                                successBlock(dataDict, msg, code);
                            }
                            failure:^(NSInteger errorCode, NSString *msg) {
                                failureBlock(errorCode, msg);
                            }
             ifRespondDataEncrypted:NO];
        }else{
            failureBlock(KRespondCodeNone, @"服务器返回数据为空");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.status == AFNetworkReachabilityStatusNotReachable) {
            failureBlock(KRespondCodeNotConnect, PROMPT_NOTCONNECT);
        }else{
            NSDictionary *tmp = error.userInfo;
            NSString *tmpStr = tmp[@"NSLocalizedDescription"];
            failureBlock(KRespondCodeFail, tmpStr);
        }
    }];
}






//旅游分享 数组
- (void)travelsharingaddsWithfiles:(NSArray *)files
                             title:(NSString *)title
                          travelId:(NSInteger )travelId
                          idd:(NSInteger )idd
                travelSharingItems:(NSArray *)travelSharingItems
              progress:(RequestProgress)progressBlock
               success:(RequestSuccess)successBlock
               failure:(RequestFailure)failureBlock{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *sign = @"1";
    NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[NSDate date].timeIntervalSince1970];
    NSString *token = [tourInfo sharedInstance].tokenInfoModed.accessToken?[tourInfo sharedInstance].tokenInfoModed.accessToken:@"";
    NSDictionary *head = @{
                           @"sign":sign,
                           @"timestamp":timestamp,
                           @"token":token,
                           };
    [parameters setObject:head forKey:@"head"];
    [parameters setObject:title forKey:@"title"];

    if (travelId) {
        [parameters setObject:@(travelId) forKey:@"orderId"];
    }
    if (idd) {
        [parameters setObject:@(idd) forKey:@"id"];
    }
    
    [parameters setObject:travelSharingItems forKey:@"travelSharingItems"];

    NSDictionary *appRequest = @{
                           @"appRequest":[NSString dictionaryToJson:parameters],
                           };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = REAUESRTIMEOUT;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    //2.上传文件
    [manager POST:[NSString stringWithFormat:@"%@%@", self.baseURLStr, URLBASIC_appv2usersharingsaves] parameters:appRequest constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (UIImage *image in files) {
            UIImage *tmp = image;
            NSData *imageData = UIImageJPEGRepresentation(tmp,1.0);//进行图片压缩
            
            if (!imageData) {
                imageData = UIImagePNGRepresentation(image);
            }

            CGFloat yasou=1.0;
            NSLog(@"原来的大小 imageData.leng=%ld k",imageData.length/1024);
            while (imageData.length > 1024*1024) {
                tmp = image;
                NSLog(@"太大了 分享  imageData.leng=%ld   yasou=%f",imageData.length/(1024*1024),yasou);
                imageData = UIImageJPEGRepresentation(tmp, yasou);
                if (imageData.length > 10*1024*1024) {
                    yasou *=0.1;
                } else if (imageData.length > 5*1024*1024){
                    yasou *=0.2;
                } else if (imageData.length > 4*1024*1024){
                    yasou *=0.6;
                } else if (imageData.length > 3*1024*1024){
                    yasou *=0.7;
                } else if (imageData.length > 2*1024*1024){
                    yasou *=0.8;
                } else if (imageData.length > 1*1024*1024){
                    yasou *=0.9;
                }
                NSLog(@"压小后 分享  imageData.leng=%ld   yasou=%f",imageData.length/(1024*1024),yasou);
            }
            NSLog(@"imageData.leng=%ld k",imageData.length/1024);
            if (imageData.length) {
                [formData appendPartWithFileData:imageData name:@"files" fileName:@"files.png" mimeType:@"image/png"];
            }else{
                failureBlock(KRespondImageCodeFail, @"图片压缩失败");//取消请求  TODO
            }
        }
        //上传文件参数
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印上传进度
        progressBlock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        if (responseObject) {
            id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
            [self parseResponseData:result
                            success:^(id dataDict, NSString *msg, NSInteger code) {
                                
                                successBlock(dataDict, msg, code);
                            }
                            failure:^(NSInteger errorCode, NSString *msg) {
                                failureBlock(errorCode, msg);
                            }
             ifRespondDataEncrypted:NO];
        }else{
            failureBlock(KRespondCodeNone, @"服务器返回数据为空");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.status == AFNetworkReachabilityStatusNotReachable) {
            failureBlock(KRespondCodeNotConnect, PROMPT_NOTCONNECT);
        }else{
            NSDictionary *tmp = error.userInfo;
            NSString *tmpStr = tmp[@"NSLocalizedDescription"];
            failureBlock(KRespondCodeFail, tmpStr);
        }
    }];
}

//更新个人资料
- (void)appuserupdateWithnickName:(NSString *)nickName
                             gender:(NSString *)gender
                          signature:(NSString *)signature
                avtor:(UIImage *)avtor
                          progress:(RequestProgress)progressBlock
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *sign = @"1";
    NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[NSDate date].timeIntervalSince1970];
    NSString *token = [tourInfo sharedInstance].tokenInfoModed.accessToken?[tourInfo sharedInstance].tokenInfoModed.accessToken:@"";
    NSDictionary *head = @{
                           @"sign":sign,
                           @"timestamp":timestamp,
                           @"token":token,
                           };

    [parameters setObject:head forKey:@"head"];
    
    if (nickName && nickName.length) {
        [parameters setObject:nickName forKey:@"nickName"];
    }
    if (gender && gender.length) {
        [parameters setObject:gender forKey:@"gender"];
    }
    if (signature && signature.length) {
        [parameters setObject:signature forKey:@"signature"];
    }
    
    NSDictionary *appRequest = @{
                                 @"appRequest":[NSString dictionaryToJson:parameters],
                                 };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = REAUESRTIMEOUT;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    
    //2.上传文件
    [manager POST:[NSString stringWithFormat:@"%@%@", self.baseURLStr, URLBASIC_appuserupdate] parameters:appRequest constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        UIImage *tmp = avtor;
//            UIImage *tmp = [UIImage imageNamed:@"1"];
            NSData *imageData = UIImageJPEGRepresentation(tmp,1.0);//进行图片压缩
            CGFloat yasou=0.99;
            while (imageData.length > 1024*1024) {
                tmp = avtor;
                NSLog(@"太大了 评价  imageData.leng=%ld   yasou=%f",imageData.length/(1024*1024),yasou);
                imageData = UIImageJPEGRepresentation(tmp, yasou);
                if (imageData.length > 10*1024*1024) {
                    yasou *=0.1;
                } else if (imageData.length > 5*1024*1024){
                    yasou *=0.2;
                } else if (imageData.length > 4*1024*1024){
                    yasou *=0.6;
                } else if (imageData.length > 3*1024*1024){
                    yasou *=0.7;
                } else if (imageData.length > 2*1024*1024){
                    yasou *=0.8;
                } else if (imageData.length > 1*1024*1024){
                    yasou *=0.9;
                }
                NSLog(@"压小后 评价  imageData.leng=%ld   yasou=%f",imageData.length/(1024*1024),yasou);
            }
            NSLog(@"imageData.leng=%ld k",imageData.length/1024);
            
            if (imageData.length) {
                [formData appendPartWithFileData:imageData name:@"file" fileName:@"files.png" mimeType:@"image/png"];
            }
        
        
//            [formData appendPartWithFileData:imageData name:@"file" fileName:@"file.png" mimeType:@"image/png"];

        //上传文件参数
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印上传进度
        progressBlock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        if (responseObject) {
            id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
            [self parseResponseData:result
                            success:^(id dataDict, NSString *msg, NSInteger code) {
                                
                                successBlock(dataDict, msg, code);
                            }
                            failure:^(NSInteger errorCode, NSString *msg) {
                                failureBlock(errorCode, msg);
                            }
             ifRespondDataEncrypted:NO];
        }else{
            failureBlock(KRespondCodeNone, @"服务器返回数据为空");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.status == AFNetworkReachabilityStatusNotReachable) {
            failureBlock(KRespondCodeNotConnect, PROMPT_NOTCONNECT);
        }else{
            NSDictionary *tmp = error.userInfo;
            NSString *tmpStr = tmp[@"NSLocalizedDescription"];
            failureBlock(KRespondCodeFail, tmpStr);
        }
    }];
}



- (void)apptravelcommentsavesWithcontent:(NSString *)content
                                   files:(NSArray *)files
                                travelId:(NSInteger )travelId
                                progress:(RequestProgress)progressBlock
                                 success:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSString *sign = @"1";
    NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[NSDate date].timeIntervalSince1970];
    NSString *token = [tourInfo sharedInstance].tokenInfoModed.accessToken?[tourInfo sharedInstance].tokenInfoModed.accessToken:@"";
    NSDictionary *head = @{
                           @"sign":sign,
                           @"timestamp":timestamp,
                           @"token":token,
                           };
    [parameters setObject:head forKey:@"head"];
    [parameters setObject:@(travelId) forKey:@"orderId"];
    [parameters setObject:content forKey:@"content"];
    
    NSDictionary *appRequest = @{
                                 @"appRequest":[NSString dictionaryToJson:parameters],
                                 };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = REAUESRTIMEOUT;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    
    //2.上传文件
    [manager POST:[NSString stringWithFormat:@"%@%@", self.baseURLStr, URLBASIC_apptravelcommentsaves] parameters:appRequest constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (UIImage *image in files) {
            UIImage *tmp = image;
            NSData *imageData = UIImageJPEGRepresentation(tmp,1.0);//进行图片压缩
            CGFloat yasou=0.99;
            while (imageData.length > 1024*1024) {
                tmp = image;
                NSLog(@"太大了 评价  imageData.leng=%ld   yasou=%f",imageData.length/(1024*1024),yasou);
                imageData = UIImageJPEGRepresentation(tmp, yasou);
                if (imageData.length > 10*1024*1024) {
                    yasou *=0.1;
                } else if (imageData.length > 5*1024*1024){
                    yasou *=0.2;
                } else if (imageData.length > 4*1024*1024){
                    yasou *=0.6;
                } else if (imageData.length > 3*1024*1024){
                    yasou *=0.7;
                } else if (imageData.length > 2*1024*1024){
                    yasou *=0.8;
                } else if (imageData.length > 1*1024*1024){
                    yasou *=0.9;
                }
                NSLog(@"压小后 评价  imageData.leng=%ld   yasou=%f",imageData.length/(1024*1024),yasou);
            }
            NSLog(@"imageData.leng=%ld k",imageData.length/1024);

            if (imageData.length) {
                [formData appendPartWithFileData:imageData name:@"files" fileName:@"files.png" mimeType:@"image/png"];
            }else{
                failureBlock(KRespondImageCodeFail, @"图片压缩失败");
            }
        }
        //上传文件参数
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印上传进度
        progressBlock(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        if (responseObject) {
            id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
            [self parseResponseData:result
                            success:^(id dataDict, NSString *msg, NSInteger code) {
                                
                                successBlock(dataDict, msg, code);
                            }
                            failure:^(NSInteger errorCode, NSString *msg) {
                                failureBlock(errorCode, msg);
                            }
             ifRespondDataEncrypted:NO];
        }else{
            failureBlock(KRespondCodeNone, @"服务器返回数据为空");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.status == AFNetworkReachabilityStatusNotReachable) {
            failureBlock(KRespondCodeNotConnect, PROMPT_NOTCONNECT);
        }else{
            NSDictionary *tmp = error.userInfo;
            NSString *tmpStr = tmp[@"NSLocalizedDescription"];
            failureBlock(KRespondCodeFail, tmpStr);
        }
    }];
}


- (void)checkRheAppVersionWithAppId:(NSString *)AppId
                             progress:(RequestProgress)progressBlock
                              success:(RequestSuccess)successBlock
                              failure:(RequestFailure)failureBlock{
    //    NSString *str =  app_Version;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/javascript", @"application/json",@"text/html", nil];
    
    [manager POST:[@"https://itunes.apple.com/cn/lookup?id=" stringByAppendingString:AppId] parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
        if (result[@"results"]) {
            NSArray *arryDic = result[@"results"];
            if (arryDic.count) {
                NSDictionary *verDic = [arryDic firstObject];
                if (verDic[@"version"]) {
                    NSString *ver = verDic[@"version"];
                    ver = [ver stringByReplacingOccurrencesOfString:@"." withString:@""];
                    
                    NSString *tmp = app_Version;
                    tmp = [tmp stringByReplacingOccurrencesOfString:@"." withString:@""];

                    if ([app_Version floatValue]<[ver floatValue]) {
                        successBlock(ver,[NSString stringWithFormat:@"发现新版本%@",verDic[@"version"]],0);
                        return ;
                    }else{
                        successBlock(nil,@"您已是最新版本",0);
                        return ;
                    }
                }
            }
        }
        failureBlock(1,@"检查更新失败");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.status == AFNetworkReachabilityStatusNotReachable) {
            failureBlock(KRespondCodeNotConnect, PROMPT_NOTCONNECT);
        }else{
            NSDictionary *tmp = error.userInfo;
            NSString *tmpStr = tmp[@"NSLocalizedDescription"];
            failureBlock(KRespondCodeFail, tmpStr);
        }
    }];
}



//- (void)post123123JsonWithPath:(NSString *)path
//              parameters:(NSMutableDictionary *)parameters
//                 success:(RequestSuccess)successBlock
//                 failure:(RequestFailure)failureBlock
//{
//
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//        manager.requestSerializer.timeoutInterval = REAUESRTIMEOUT;
//        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//        manager.requestSerializer = [AFJSONRequestSerializer serializer];
//        //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json", @"application/json",@"text/html", nil];
//        
//        [manager POST:@"http://zeji.tempus.cn/tour-app/travel/detail/49" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
//            
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            if (responseObject) {
//                id result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:NULL];
//                [self parseResponseData:result
//                                success:^(id dataDict, NSString *msg, NSInteger code) {
//                                    
//                                    successBlock(dataDict, msg, code);
//                                }
//                                failure:^(NSInteger errorCode, NSString *msg) {
//                                    failureBlock(errorCode, msg);
//                                }
//                 ifRespondDataEncrypted:NO];
//            }else{
//                failureBlock(KRespondCodeNone, @"服务器返回数据为空");
//            }
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            if ([[AFNetworkReachabilityManager sharedManager]isReachable]) {
//                failureBlock(KRespondCodeNotConnect, PROMPT_FAIL);
//            }else{
//                failureBlock(KRespondCodeFail, PROMPT_NOTCONNECT);
//            }
//        }];
//
//}
@end
