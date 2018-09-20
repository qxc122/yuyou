//
//  UIImageView+cir.m
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UIImageView+cir.h"

@implementation UIImageView (cir)
+(UIImage *)GetScreenShotWithScreen:(UIView *)Screen andFrame:(CGRect)frame
{
    UIGraphicsBeginImageContext(Screen.frame.size);
    [Screen.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * shotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRef shotRef = shotImage.CGImage;
    CGImageRef ResultRef = CGImageCreateWithImageInRect(shotRef, frame);
    UIImage * Result = [UIImage imageWithCGImage:ResultRef];
    CGImageRelease(ResultRef);
    return Result;
}


//2、先将画布截取成圆形，然后重新绘图

+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    
    UIGraphicsBeginImageContext(image.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextClip(context);
    
    
    
    [image drawInRect:rect];
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextStrokePath(context);
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newimg;
    
    
    
}

//拉申图片中间 保证不变形
+ (UIImage *)stretchingWith:(UIImage *)sourceImage{
    CGFloat top = 8; // 顶端盖高度
    CGFloat bottom = 8 ; // 底端盖高度
    CGFloat left = 8; // 左端盖宽度
    CGFloat right = 8; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
    return  [sourceImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}


@end
