//
//  heartCarIdHead.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "heartCarIdHead.h"

@implementation heartCarIdHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *title = [UILabel new];
        [self addSubview:title];
        
        UIView *left = [UIView new];
        [self addSubview:left];
        
        UIView *right = [UIView new];
        [self addSubview:right];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [left mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(title.mas_left).offset(-12);
            make.centerY.equalTo(self);
            make.width.equalTo(@(12));
            make.height.equalTo(@(4));
        }];
        
        [right mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title.mas_right).offset(12);
            make.centerY.equalTo(self);
            make.width.equalTo(@(12));
            make.height.equalTo(@(4));
        }];
        
        left.backgroundColor = RGBACOLOR(87, 162, 240, 1.0);
        right.backgroundColor = RGBACOLOR(87, 162, 240, 1.0);
        right.layer.masksToBounds = YES;
        right.layer.cornerRadius = 4.0;
        left.layer.masksToBounds = YES;
        left.layer.cornerRadius = 4.0;
        title.numberOfLines = 0;
        title.textAlignment = NSTextAlignmentCenter;
        title.font = PingFangSC_Regular(17);
        title.textColor = ColorWithHex(0x779FF6, 1.0);
        title.text = @"分期旅程";
    }
    return self;
}
@end
