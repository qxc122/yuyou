//
//  kaiqiPopView.h
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, kaiqiPopView_enmu)
{
    giveUp_kaiqiPopView,//放弃认证
    go_kaiqiPopView,//去认证
};

@interface kaiqiPopView : UIView
/**
 *  去开启实名认证
 */
@property (copy,nonatomic) void (^goToRealNameAuthentication)(kaiqiPopView_enmu type);
- (void)windosViewshow;
@end
