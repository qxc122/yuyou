//
//  UITabBar+XSDExt.h
//  TourismT
//
//  Created by Store on 2017/2/14.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (XSDExt)
- (void)showBadgeOnItemIndex:(NSInteger)index;   ///<显示小红点

- (void)hideBadgeOnItemIndex:(NSInteger)index;  ///<隐藏小红点
@end
