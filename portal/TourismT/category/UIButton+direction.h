//
//  UIButton+direction.h
//  TourismT
//
//  Created by Store on 16/12/13.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (direction)

+ (void)setdirectionV:(UIButton *)advice withSpa:(CGFloat)space;//文字下，图片上
+ (void)setdirectionH:(UIButton *)btn withSpa:(CGFloat)space;//文字左，图片右
- (void)setBtnWithImage:(NSString *)Image font:(UIFont *)font Title:(NSString *)Title color:(NSInteger )hex alpa:(CGFloat)alpa forState:(UIControlState)State;
@end
