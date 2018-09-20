//
//  ToolRequest.h
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PayTypepayment @"payment"  //付款  payment
#define PayTyperepayment @"repayment"   //还款 repayment

typedef void (^RequestSuccess)(id dataDict, NSString *msg, NSInteger code);
typedef void (^RequestFailure)(NSInteger errorCode, NSString *msg);
typedef void (^RequestProgress)(NSProgress *uploadProgress);

typedef void (^WXRequestSuccess)(id dataDict);
typedef void (^WXRequestFailure)(NSString *msg);


@interface ToolRequest : NSObject
+ (ToolRequest *)sharedInstance;

- (void)getWithPath:(NSString *)path
         parameters:(NSMutableDictionary *)parameters
            success:(RequestSuccess)successBlock
            failure:(RequestFailure)failureBlock;

- (void)postJsonWithPath:(NSString *)path
              parameters:(NSMutableDictionary *)parameters
                 success:(RequestSuccess)successBlock
                 failure:(RequestFailure)failureBlock;

- (void)uploadWithPath:(NSString *)path
            avatarFile:(UIImage *)avatarFile
            parameters:(NSMutableDictionary *)parameters
              progress:(RequestProgress)progressBlock
               success:(RequestSuccess)successBlock
               failure:(RequestFailure)failureBlock;

//旅游分享 数组
- (void)travelsharingaddsWithfiles:(NSArray *)files
                             title:(NSString *)title
                          travelId:(NSInteger )travelId
                          idd:(NSInteger )idd
                travelSharingItems:(NSArray *)travelSharingItems
                          progress:(RequestProgress)progressBlock
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock;

//更新个人资料
- (void)appuserupdateWithnickName:(NSString *)nickName
                               gender:(NSString *)gender
                            signature:(NSString *)signature
                                avtor:(UIImage *)avtor
                             progress:(RequestProgress)progressBlock
                              success:(RequestSuccess)successBlock
                              failure:(RequestFailure)failureBlock;
//评论
- (void)apptravelcommentsavesWithcontent:(NSString *)content
                                   files:(NSArray *)files
                                travelId:(NSInteger )travelId
                                progress:(RequestProgress)progressBlock
                                 success:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock;
    

- (void)checkRheAppVersionWithAppId:(NSString *)AppId
                           progress:(RequestProgress)progressBlock
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;

@end
