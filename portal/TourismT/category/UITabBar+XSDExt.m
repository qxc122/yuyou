//
//  UITabBar+XSDExt.m
//  TourismT
//
//  Created by Store on 2017/2/14.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UITabBar+XSDExt.h"

@implementation UITabBar (XSDExt)
//显示小红点
- (void)showBadgeOnItemIndex:(NSInteger)index{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIImageView *badgeView = [[UIImageView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 8/2.0;//圆形
//    badgeView.backgroundColor = ColorWithHex(0xFB704B, 1.0);//颜色：红色
//    CGRect tabFrame = self.frame;
    badgeView.image = ImageNamed(@"圆点");
    //确定小红点的位置
    CGFloat x = self.frame.size.width/4.0;
    CGFloat y = 6.0;
    badgeView.frame = CGRectMake(x*2.5+12, y, 8.0, 8.0);//圆形大小为10
    badgeView.clipsToBounds = YES;
    [self addSubview:badgeView];
}

//隐藏小红点
- (void)hideBadgeOnItemIndex:(NSInteger)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}

//移除小红点
- (void)removeBadgeOnItemIndex:(NSInteger)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}



@end
