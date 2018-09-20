//
//  payType.h
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"

@interface payType : windosView
/**
 *  选择支付方式
 */
@property (nonatomic, copy) void (^SelectionPayMode)(NSString *type);
@property (nonatomic,strong) NSString *payType;
@end
