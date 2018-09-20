//
//  sectionHEADmyContacts.m
//  TourismT
//
//  Created by Store on 2017/1/14.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "sectionHEADmyContacts.h"


@interface sectionHEADmyContacts ()
@property (nonatomic,weak) UILabel *label;
@end

@implementation sectionHEADmyContacts

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]init];
        [self addSubview:label];
        self.label = label;
        [label settextColorhex:0x000000 alpa:0.53 font:PingFangSC_Regular(15)];
        self.backgroundColor  =ColorWithHex(0xF0F1F5, 1.0);
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}
- (void)setLabelStr:(NSString *)labelStr{
    _labelStr = labelStr;
    self.label.text = labelStr;
}
@end
