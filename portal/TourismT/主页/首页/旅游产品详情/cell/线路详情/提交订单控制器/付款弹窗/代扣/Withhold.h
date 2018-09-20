//
//  Withhold.h
//  TourismT
//
//  Created by Store on 2017/8/16.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"

@interface Withhold : windosView
@property (nonatomic,strong) orderInfo *orderinfoData;//订单信息

@property (nonatomic,strong) myStageHome *date; //分期信息
@property (nonatomic,strong) orderOk *orderok; //

@property (nonatomic,strong) NSString *code;//选择的分期

@property (nonatomic,weak) UIView *line2;
@property (nonatomic,weak) UILabel *name1;
@property (nonatomic,strong) NSString *payType;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *money1;

@property (nonatomic,weak) UILabel *type;
@property (nonatomic,weak) UILabel *type1;
@property (nonatomic,weak) UIView *line3;
/**
 *  选择支付方式
 */
@property (nonatomic, copy) void (^GOPayMode)(NSString *type);


/**
 *  点击了暂不支付按钮
 */
@property (nonatomic, copy) void (^noPay)();
@end
