//
//  NavigationBarDetais.h
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NavigationBarDetais_Click_ENMU)
{
    keep_NavigationBarDetais_Click_ENMU,//收藏
    share_NavigationBarDetais_Click_ENMU,//分享
    back_NavigationBarDetais_Click_ENMU,//返回
};
@interface NavigationBarDetais : UIView
@property (nonatomic, assign) CGFloat alpaImage; //背景图片 透明度

@property (nonatomic, assign) BOOL isHiden; //是否隐藏 分享 和收藏按钮

@property (nonatomic, assign) BOOL isFavorite; //是否 已经收藏了

@property (copy,nonatomic) void (^brnClickType)(NavigationBarDetais_Click_ENMU type);
@end
