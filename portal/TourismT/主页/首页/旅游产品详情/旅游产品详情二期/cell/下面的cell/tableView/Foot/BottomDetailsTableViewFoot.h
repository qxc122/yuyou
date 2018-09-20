//
//  BottomDetailsTableViewFoot.h
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BottomDetailsTableViewFoot_type)
{
    Consultation_BottomDetailsTableViewFoot_type,//收藏
    WantGo_BottomDetailsTableViewFoot_type,//分享
};

@interface BottomDetailsTableViewFoot : UIView
/**
 *  点击了 上拉 和下拉  按钮
 */
@property (copy,nonatomic) void (^btnClick)(BottomDetailsTableViewFoot_type type);


@property (nonatomic, assign) BOOL wanTogoIsenabel;
@end
