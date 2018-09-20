//
//  ActivePage.h
//  TourismT
//
//  Created by Store on 2017/8/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"

@interface ActivePage : windosView
/**
 *  点击了活动
 */
@property (nonatomic, copy) void (^btnClick)(NSURL *url);
@property (nonatomic, strong) appcommonglobalS *data;

@end
