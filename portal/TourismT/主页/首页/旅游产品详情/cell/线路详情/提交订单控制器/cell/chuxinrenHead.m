//
//  chuxinrenHead.m
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "chuxinrenHead.h"

@interface chuxinrenHead ()
@property (weak,nonatomic) UIView *backBottom;
@end

@implementation chuxinrenHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *back = [[UIView alloc]init];
        back.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        LRViewRadius(back, cornerRadius_width);
        [self addSubview:back];
        
        UIView *backBottom = [[UIView alloc]init];
        back.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        self.backBottom = backBottom;
        backBottom.hidden = YES;
        [self addSubview:backBottom];
        
        UILabel *label = [[UILabel alloc]init];
        [self addSubview:label];
        
        UILabel *labelRight = [[UILabel alloc]init];
        [self addSubview:labelRight];
        
        UIImageView *more = [[UIImageView alloc]init];
        [self addSubview:more];
        
        UIButton *moreBtn = [[UIButton alloc]init];
        [self addSubview:moreBtn];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(self).offset(15);
            make.bottom.equalTo(self).offset(0);
        }];
        [backBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(0);
            make.right.equalTo(back).offset(0);
            make.height.equalTo(@(cornerRadius_width*2));
            make.bottom.equalTo(back).offset(0);
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.centerY.equalTo(back);
        }];
        [labelRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(more.mas_left).offset(-5.3);
            make.centerY.equalTo(back);
        }];
//        [more mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(back).offset(0);
//            make.centerY.equalTo(back);
//            make.width.equalTo(@(7+37));
//            make.height.equalTo(@(12+31));
//        }];
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(back).offset(-15);
            make.centerY.equalTo(back);
            make.width.equalTo(@(7));
            make.height.equalTo(@(12));
        }];
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(back);
            make.left.equalTo(back);
            make.top.equalTo(back);
            make.bottom.equalTo(back);
        }];
        //set
        labelRight.textColor = ColorWithHex(0x000000, 1.0);
        label.textColor = ColorWithHex(0x000000, 0.87);
        labelRight.font = PingFangSC_Regular(14);
        label.font = PingFangSC_Regular(14);
        more.image = ImageNamed(@"点击");
//        [moreBtn setImage:ImageNamed(@"点击") forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
        label.text = @"出行人";
        labelRight.text = @"常用旅客";
    }
    return self;
}
- (void)moreClick:(UIButton *)btn{
    if (self.moreCXRClick) {
        self.moreCXRClick();
    }
}

@end
