//
//  UILabel+fronAndColor.m
//  TourismT
//
//  Created by Store on 17/1/7.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UILabel+fronAndColor.h"

@implementation UILabel (fronAndColor)
- (void)settextColorhex:(NSInteger)hex alpa:(CGFloat)alpa font:(UIFont *)font{
    if (alpa > 0) {
        self.textColor = ColorWithHex(hex, alpa);
    }
    if (font) {
        self.font = font;
    }
    self.numberOfLines = 0;
}
@end
