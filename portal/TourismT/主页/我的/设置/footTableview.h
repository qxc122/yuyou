//
//  footTableview.h
//  TourismT
//
//  Created by Store on 2017/1/11.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface footTableview : UIView
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^btnClick)();


@property (nonatomic,assign) BOOL isenableBtn;//是否禁止按钮点击
@end
