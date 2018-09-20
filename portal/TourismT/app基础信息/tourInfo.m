//
//  tourInfo.m
//  TourismT
//
//  Created by Store on 16/11/25.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "tourInfo.h"

@implementation tourInfo
+ (tourInfo *)sharedInstance
{
    
    static tourInfo *_shareInstance = nil;
    static dispatch_once_t cityTableToken;
    dispatch_once(&cityTableToken, ^{
        _shareInstance = [[tourInfo alloc] init];
    });
    return _shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //做一些初始化的事情
        // Decoding
        _UserInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_userForApp];
        _toutInfoModed = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_appid];
        _tokenInfoModed = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_Token];
    }
    return self;
}
- (void)setUserInfo:(appS *)UserInfo{
    _UserInfo = UserInfo;
    if (UserInfo) {
        [NSKeyedArchiver archiveRootObject:UserInfo toFile:PATH_userForApp];
        
    }else{
        NSFileManager *manager = [NSFileManager defaultManager];
        // 删除
        BOOL isDelete = [manager removeItemAtPath:PATH_userForApp error:nil];
        if (isDelete) {
            NSDictionary *dictTmp = @{LoginAndExitNotice:@NO,};
            NSNotification *notification =[NSNotification notificationWithName:LoginAndExitNotice object:nil userInfo:dictTmp];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
        }
    }
}
- (void)setToutInfoModed:(toutInfoMode *)toutInfoModed{
    _toutInfoModed = toutInfoModed;
    [NSKeyedArchiver archiveRootObject:toutInfoModed toFile:PATH_appid];
}
- (void)setTokenInfoModed:(tokenInfoMode *)tokenInfoModed{
    _tokenInfoModed = tokenInfoModed;
    [NSKeyedArchiver archiveRootObject:tokenInfoModed toFile:PATH_Token];
}
@end
