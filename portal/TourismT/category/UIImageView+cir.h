//
//  UIImageView+cir.h
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (cir)
+(UIImage *)GetScreenShotWithScreen:(UIView *)Screen andFrame:(CGRect)frame;

//2、先将画布截取成圆形，然后重新绘图

+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;


//拉申图片中间 保证不变形
+ (UIImage *)stretchingWith:(UIImage *)sourceImage;
@end
