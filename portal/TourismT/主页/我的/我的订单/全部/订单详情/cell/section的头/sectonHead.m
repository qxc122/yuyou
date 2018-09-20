//
//  sectonHead.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "sectonHead.h"
@interface sectonHead ()
@property (nonatomic,weak) UILabel *des;
@property (nonatomic,weak) UILabel *phone;

@end
@implementation sectonHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *head = [[UIView alloc]init];
        [self addSubview:head];

        UILabel *des = [[UILabel alloc]init];
        [self addSubview:des];
        
        UILabel *phone = [[UILabel alloc]init];
        [self addSubview:phone];
        
        [head mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(@(10));
            make.top.equalTo(self);
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(head.mas_bottom);
            make.bottom.equalTo(self);
        }];
        [phone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(des.mas_right).offset(15);
            make.centerY.equalTo(des);
        }];
        //set
        self.des = des;
        self.phone = phone;
        head.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        des.textColor = ColorWithHex(0x000000, 0.54);
        des.font = PingFangSC_Regular(15);
        phone.textColor = ColorWithHex(0x000000, 0.87);
        phone.font = PingFangSC_Regular(14);
        //test
        des.text = @"订单信息";
//        phone.text = @"17004965055";
    }
    return self;
}
- (void)setPhoneStr:(NSString *)phoneStr{
    _phoneStr = phoneStr;
    self.phone.text = phoneStr;
}
- (void)setDesStr:(NSString *)desStr{
    _desStr = desStr;
    self.des.text = desStr;
}
@end
