//
//  cancel.h
//  TourismT
//
//  Created by Store on 2017/8/21.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, toPayHead_enum)
{
    payType_chage_toPayHead,//支付方式的改变
    cancel_chage_toPayHead,//取消订单
};


@interface cancel : UIView
@property (nonatomic,weak) UIView *foot;
@property (nonatomic,assign) BOOL isExpre; //订单是否过期
/**
 *  更换支付方式的回调
 */
@property (nonatomic, copy) void (^chagePayTypeClick)(toPayHead_enum btnType,NSString *Paytype);
@end
