//
//  heartCarIdFoot.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "heartCarIdFoot.h"
#import "UIImage+cir.h"


@implementation heartCarIdFoot

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *tilte = [UILabel new];
        [self addSubview:tilte];
        
        UIButton *btnGo = [UIButton new];
        [self addSubview:btnGo];
        
        [tilte mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self);
        }];
        
        [btnGo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(tilte.mas_bottom).offset(12);
            make.bottom.equalTo(self);
            make.height.equalTo(@(50));
        }];
        
        tilte.font = PingFangSC_Regular(12);
        tilte.textColor = ColorWithHex(0x779CF4, 1.0);
        tilte.text = @"3秒钟完成审核";
        
        btnGo.titleLabel.font = PingFangSC_Regular(17);
        [btnGo setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0x779FF6, 1.0)] forState:UIControlStateNormal];
        [btnGo setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        [btnGo setTitle:@"限额免费申请" forState:UIControlStateNormal];
        [btnGo addTarget:self action:@selector(btnGoClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)btnGoClick:(UIButton *)sender{
//    NSLog(@"sdfsdf  GOGOG");
    if (self.btnClick) {
        [MobClick event:xiangeminfeisehgnq];
        self.btnClick();
    }
}
@end
