//
//  loginMoreCell.m
//  TourismT
//
//  Created by Store on 2017/6/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "loginMoreCell.h"


@interface loginMoreCell ()
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIImageView *icon;
@end


@implementation loginMoreCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UIImageView *icon = [[UIImageView alloc]init];
        self.icon = icon;
        [self.contentView addSubview:icon];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        self.title = title;

        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(17);
            make.width.equalTo(@(24));
            make.height.equalTo(@(24));
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(icon);
            make.top.equalTo(icon.mas_bottom).offset(9);
            make.height.equalTo(@(14));
        }];

        IMAGEsetCONTENTMODE(icon);
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor =  ColorWithHex(0xFFFFFF, 0.8);
        title.font = PingFangSC_Regular(12);
    }
    return self;
}
- (void)setDate:(myhome *)date{
    _date =date;
    self.title.text = date.titleStr;
    self.icon.image = ImageNamed(date.iconStr);
}
@end
