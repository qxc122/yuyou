//
//  toOrderVcFootTool.h
//  TourismT
//
//  Created by Store on 2017/4/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+check.h"

typedef NS_ENUM(NSInteger, toOrderVcFootTool_btnEnum)
{
    next_toOrderVcFootTool_btnEnum,//点击提交订单
    view_toOrderVcFootTool_btnEnum,//点击查看分期明细
};

@interface toOrderVcFootTool : UIView
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^btnClick)(toOrderVcFootTool_btnEnum type);


- (void)nextbtnClick:(UIButton *)sender;

@property (strong,nonatomic) NSString *priceStr;



@property (weak,nonatomic) UILabel *price;
@property (weak,nonatomic) UIButton *nextbtn;
@end
