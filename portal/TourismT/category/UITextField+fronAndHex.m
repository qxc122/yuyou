//
//  UITextField+fronAndHex.m
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UITextField+fronAndHex.h"

@implementation UITextField (fronAndHex)
- (void)settextColorhex:(NSInteger)hex alpa:(CGFloat)alpa font:(UIFont *)font{
    if (alpa > 0) {
        self.textColor = ColorWithHex(hex, alpa);
    }
    if (font) {
        self.font = font;
    }
}
@end
