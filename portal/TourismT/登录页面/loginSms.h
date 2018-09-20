//
//  loginSms.h
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"

@interface loginSms : basicVc
/**
 *  登录成功
 */
@property (nonatomic, copy) void (^loginSucces)();
@property (nonatomic,strong) NSString *phone;
@end
