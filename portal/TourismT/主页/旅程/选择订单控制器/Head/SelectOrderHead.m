//
//  SelectOrderHead.m
//  TourismT
//
//  Created by Store on 2017/8/14.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "SelectOrderHead.h"

@implementation SelectOrderHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *title = [UILabel new];
        [self addSubview:title];
        title.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x000000, 0.54);
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self);
            make.top.equalTo(self).offset(17);
            make.bottom.equalTo(self).offset(-2);
            make.height.equalTo(@(15));
        }];
        title.text = @"请选择旅程对应的订单";
    }
    return self;
}

@end
