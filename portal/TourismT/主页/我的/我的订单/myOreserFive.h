//
//  myOreserFive.h
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"

typedef NS_ENUM(NSInteger, myOreserFive_type)
{
    one_myOreserFive_type = 1,//
    two_myOreserFive_type,//
    three_myOreserFive_type,//
    four_myOreserFive_type,//
};

@interface myOreserFive : basicVc
@property (nonatomic,assign)NSInteger index;
/**
 *  查看了某一个类型的订单
 */
@property (nonatomic, copy) void (^lookType)(myOreserFive_type type);
@end
