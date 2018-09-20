//
//  headTableaa.m
//  TourismT
//
//  Created by Store on 2017/1/11.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "headTableaa.h"

@interface headTableaa ()
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UIImageView *iconSmall;
@property (nonatomic,weak) UILabel *title;
@end

@implementation headTableaa

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *icon = [[UIImageView alloc]init];
        [self addSubview:icon];
        
        UIImageView *iconSmall = [[UIImageView alloc]init];
        [self addSubview:iconSmall];
        
        UILabel*title = [[UILabel alloc]init];
        [self addSubview:title];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(30);
            make.centerX.equalTo(self).offset(0);
            make.width.equalTo(@(70));
            make.height.equalTo(@(70));
        }];
        [iconSmall mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(icon.mas_bottom).offset(10);
            make.centerX.equalTo(self).offset(0);
            make.width.equalTo(@(43));
            make.height.equalTo(@(20));
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconSmall.mas_bottom).offset(15);
            make.centerX.equalTo(self).offset(0);
        }];
        IMAGEsetCONTENTMODE(icon);
        IMAGEsetCONTENTMODE(iconSmall);
        [title settextColorhex:0x7692F3 alpa:1.0 font:PingFangSC_Regular(12)];
        title.text  =@"腾邦集团旗下APP";
        

        icon.image = ImageNamed(@"logo关于");
        iconSmall.image = ImageNamed(@"文字关于");
    }
    return self;
}

@end
