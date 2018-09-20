//
//  kaiqiPopView.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "kaiqiPopView.h"


typedef NS_ENUM(NSInteger, kaiqiPopView_btntag)
{
    close_kaiqiPopView_btntag,//关闭
    kaiqi_kaiqiPopView_btntag,//开启
};



@interface kaiqiPopView ()


@end

@implementation kaiqiPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *blcak = [[UIView alloc]init];
        blcak.backgroundColor = ColorWithHex(0x000000, 0.5);
        [self addSubview:blcak];

        UIView *blcakWhite = [[UIView alloc]init];
        blcakWhite.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        [self addSubview:blcakWhite];
        
        UILabel *title = [[UILabel alloc]init];
        [self addSubview:title];
        
        UILabel *des = [[UILabel alloc]init];
        [self addSubview:des];

        UIView *line = [[UIView alloc]init];
        [self addSubview:line];
        
        UIView *suXian = [[UIView alloc]init];
        [self addSubview:suXian];
        
        UIButton *close = [[UIButton alloc]init];
        [self addSubview:close];
        
        UIButton *kaiqi = [[UIButton alloc]init];
        [self addSubview:kaiqi];
        
        
        [blcak mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [blcakWhite mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
            make.height.equalTo(@(160));
            make.width.equalTo(@(285));
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blcakWhite).offset(20);
            make.centerX.equalTo(self);
            make.height.equalTo(@(14));
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(title.mas_bottom).offset(20);
            make.left.equalTo(blcakWhite).offset(15);
            make.right.equalTo(blcakWhite).offset(-15);
            make.height.equalTo(@(40));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(des.mas_bottom).offset(20);
            make.left.equalTo(blcakWhite).offset(15);
            make.right.equalTo(blcakWhite).offset(-15);
            make.height.equalTo(@(0.5));
        }];
        
        
        [close mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom);
            make.bottom.equalTo(blcakWhite);
            make.left.equalTo(blcakWhite);
            make.width.equalTo(kaiqi);
        }];
        
        [kaiqi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(close);
            make.bottom.equalTo(close);
            make.left.equalTo(close.mas_right);
            make.right.equalTo(blcakWhite);
        }];
        
        
        [suXian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(kaiqi);
            make.centerX.equalTo(self);
            make.width.equalTo(@(0.5));
            make.height.equalTo(@(18));
        }];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeClisck)];
        [blcak addGestureRecognizer:tap];
        
        blcakWhite.layer.cornerRadius = cornerRadius_width;
        blcakWhite.layer.masksToBounds = YES;
        blcakWhite.layer.borderColor = ColorWithHex(0x000000, 0.5).CGColor;
        blcakWhite.layer.borderWidth = 0.5;
        
        title.textColor = ColorWithHex(0x000000, 0.87);
        title.font = PingFangSC_Regular(15);
        title.text = @"开启分期支付功能";
        
        des.numberOfLines = 0;
        des.textColor = ColorWithHex(0x000000, 0.54);
        des.font = PingFangSC_Regular(12);
        des.text = @"您尚未开通与游分期功能，完善个人信息，轻松开启分期功能。";
        
        line.backgroundColor = ColorWithHex(0x000000, 0.2);
        suXian.backgroundColor = ColorWithHex(0x000000, 0.09);
        
        close.tag = close_kaiqiPopView_btntag;
        kaiqi.tag = kaiqi_kaiqiPopView_btntag;
        
        [close setTitle:@"稍后再说" forState:UIControlStateNormal];
        [kaiqi setTitle:@"立即开启" forState:UIControlStateNormal];
        
        [close setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
        [kaiqi setTitleColor:ColorWithHex(0x7692F3, 1.0) forState:UIControlStateNormal];
        
        close.titleLabel.font = PingFangSC_Regular(14);
        kaiqi.titleLabel.font = PingFangSC_Regular(14);
        
        [close addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [kaiqi addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        close.tag = giveUp_kaiqiPopView;
        kaiqi.tag = go_kaiqiPopView;
        
    }
    return self;
}
- (void)BtnClick:(UIButton *)sender{
    [self removeFromSuperview];
    if (self.goToRealNameAuthentication) {
        self.goToRealNameAuthentication(sender.tag);
    }
    if (sender.tag == giveUp_kaiqiPopView) {
         [MobClick event:shzakqsfsdfsf];
    } else if (sender.tag == go_kaiqiPopView) {
         [MobClick event:ewrwer234];
    }
}
- (void)closeClisck{
    [self removeFromSuperview];
}
- (void)windosViewshow{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(window);
        make.right.equalTo(window);
        make.top.equalTo(window);
        make.bottom.equalTo(window);
    }];
}

@end
