//
//  UIButton+direction.m
//  TourismT
//
//  Created by Store on 16/12/13.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "UIButton+direction.h"

@implementation UIButton (direction)
+ (void)setdirectionV:(UIButton *)advice  withSpa:(CGFloat)space{
    CGFloat totalHeight = (advice.imageView.frame.size.height + advice.titleLabel.frame.size.height);
    [advice setImageEdgeInsets:UIEdgeInsetsMake(-(totalHeight - advice.imageView.frame.size.height)-space, 0.0, 0.0, -advice.titleLabel.frame.size.width)];
    [advice setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -advice.imageView.frame.size.width, -(totalHeight - advice.titleLabel.frame.size.height+space),0.0)];
}
+ (void)setdirectionH:(UIButton *)btn  withSpa:(CGFloat)space{
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn.imageView.image.size.width, 0,btn.imageView.image.size.width)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width+space, 0, -btn.titleLabel.bounds.size.width-space)];
}

- (void)setBtnWithImage:(NSString *)Image font:(UIFont *)font Title:(NSString *)Title color:(NSInteger )hex alpa:(CGFloat)alpa forState:(UIControlState)State{
    if (Image) {
        [self setImage:ImageNamed(Image) forState:State];
    }
    if (Title) {
        [self setTitle:Title forState:State];
    }
    if (font) {
        self.titleLabel.font = font;
    }
    if (alpa) {
        [self setTitleColor:ColorWithHex(hex, alpa) forState:State];
    }
}
@end
