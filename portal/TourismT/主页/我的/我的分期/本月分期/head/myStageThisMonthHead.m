//
//  myStageThisMonthHead.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myStageThisMonthHead.h"


@interface myStageThisMonthHead ()
@property (nonatomic,weak) UILabel *num;
@property (nonatomic,weak) UILabel *money;
@end


@implementation myStageThisMonthHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label1 = [UILabel new];
        [self addSubview:label1];
        
        UILabel *num = [UILabel new];
        [self addSubview:num];
        
        UILabel *label2 = [UILabel new];
        [self addSubview:label2];
        
        UILabel *money = [UILabel new];
        [self addSubview:money];
        
        UILabel *label3 = [UILabel new];
        [self addSubview:label3];
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label1.mas_right);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(num.mas_right);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label2.mas_right);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(money.mas_right);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        num.font = PingFangSC_Regular(14);
        num.textColor = ColorWithHex(0x000000, 0.87);
        money.font = PingFangSC_Regular(14);
        money.textColor = ColorWithHex(0x000000, 0.87);
        
        
        label1.font = PingFangSC_Regular(14);
        label1.textColor = ColorWithHex(0x000000, 0.54);
        label2.font = PingFangSC_Regular(14);
        label2.textColor = ColorWithHex(0x000000, 0.54);
        label3.font = PingFangSC_Regular(14);
        label3.textColor = ColorWithHex(0x000000, 0.54);
        label1.text = @"已入账订单共 ";
        label2.text = @" 笔，共 ";
        label3.text = @" 元";
        self.num = num;
        self.money = money;
        //test
//        num.text = @"2";
//        money.text = @"4320.00";
    }
    return self;
}
- (void)setDate:(myStageHome *)date{
    if (date) {
        _date = date;
        self.num.text = [NSString stringWithFormat:@"%@",date.count];
        self.money.text = date.orderTotals;
    }
}
@end
