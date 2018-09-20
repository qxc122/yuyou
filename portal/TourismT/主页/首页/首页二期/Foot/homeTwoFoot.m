//
//  homeTwoFoot.m
//  TourismT
//
//  Created by Store on 2017/8/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoFoot.h"


@interface homeTwoFoot ()

@end

@implementation homeTwoFoot

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ColorWithHex(0xF7F7F7, 1.0);
        UILabel *label = [UILabel new];
        [self addSubview:label];
        
        UIView *left = [UIView new];
        [self addSubview:left];
        
        UIView *right = [UIView new];
        [self addSubview:right];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
            make.width.equalTo(@123);
            make.height.equalTo(@12);
        }];
        
        [left mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(label.mas_left).offset(-15);
            make.width.equalTo(@30);
            make.height.equalTo(@0.5);
        }];
        
        [right mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label.mas_right).offset(15);
            make.centerY.equalTo(self);
            make.width.equalTo(@30);
            make.height.equalTo(@0.5);
        }];
        left.backgroundColor = ColorWithHex(0xB6B6B6, 1.0);
        right.backgroundColor = ColorWithHex(0xB6B6B6, 1.0);
        label.font = PingFangSC_Regular(12);
        label.textColor = ColorWithHex(0xB6B6B6, 1.0);
        label.text = @"一人精彩，不如与游";
    }
    return self;
}

@end
