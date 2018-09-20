//
//  NODiscountStage.h
//  TourismT
//
//  Created by Store on 2017/8/7.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "titleSmallBasicCell.h"

@interface NODiscountStage : titleSmallBasicCell
@property (nonatomic,weak) UIView *stages;
@property (copy,nonatomic) void (^lookWebUrl)(NSURL *url);
@end
