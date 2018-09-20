//
//  lastOk.h
//  TourismT
//
//  Created by Store on 16/12/27.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"

typedef NS_ENUM(NSInteger, btnlastOk_ENMU)
{
    left_btnlastOk_ENMU,//左按钮
    right_btnlastOk_ENMU,//右啊扭
};


@interface lastOk : windosView
/**
 *  点击了暂不支付按钮
 */
@property (nonatomic, copy) void (^TemporaryPaymentClick)(btnlastOk_ENMU type);
@property (nonatomic,strong) orderOk *orderok;
@property (nonatomic,strong) orderInfo *orderinfoData;//订单信息
@property (nonatomic,strong) NSString *payType;

@property (nonatomic,strong) NSString *code;//选择的分期
@end
