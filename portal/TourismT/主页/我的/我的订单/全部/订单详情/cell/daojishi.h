//
//  daojishi.h
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOrDetailTabHeadLine.h"

@interface daojishi : myOrDetailTabHeadLine
@property (nonatomic,assign) int endTime;
/**
 *  倒计时结束
 */
@property (nonatomic, copy) void (^endDaojishi)();
@end
