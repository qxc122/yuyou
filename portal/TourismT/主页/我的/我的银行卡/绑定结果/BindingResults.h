//
//  BindingResults.h
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"

@interface BindingResults : windosView
@property (nonatomic,strong) RiskVerification *date;
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^endCountDown)();
@end
