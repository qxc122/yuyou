//
//  NoneHeartCarIdHead.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "NoneHeartCarIdHead.h"

@implementation NoneHeartCarIdHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *title = [UILabel new];
        [self addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self).offset(40);
            make.bottom.equalTo(self);
        }];
        title.numberOfLines = 0;
        title.textAlignment = NSTextAlignmentCenter;
        title.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x779CF4, 1.0);
        title.text = @"您还没有开通分期服务哦～\n快点击下方按钮申请开通吧";
    }
    return self;
}

@end
