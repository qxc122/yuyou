//
//  homeTwoShareCellHead.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoShareCellHead.h"


@interface homeTwoShareCellHead ()
@property (nonatomic,weak) UIView *lineTop;
@property (nonatomic,weak) UIView *icon;

@property (nonatomic,weak) UIView *lineBottom;
@end

@implementation homeTwoShareCellHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *lineTop = [UIView new];
        [self addSubview:lineTop];
        
        UIView *icon = [UIView new];
        [self addSubview:icon];
        
        UILabel *title = [UILabel new];
        [self addSubview:title];
        
        UIView *lineBottom = [UIView new];
        [self addSubview:lineBottom];
        
        [lineTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.equalTo(@10);
        }];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(lineTop.mas_bottom).offset(21);
            make.width.equalTo(@6);
            make.height.equalTo(@18);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon.mas_right).offset(12);
            make.centerY.equalTo(icon);
        }];
        [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@0.5);
        }];
        
        self.lineTop = lineTop;
        self.icon = icon;
        self.title = title;
        self.lineBottom = lineBottom;
        //set
        title.font = PingFangSC_Medium(17);
        title.textColor = ColorWithHex(0x000000, 0.87);
        icon.backgroundColor = ColorWithHex(0x789BF1, 1.0);
        LRViewRadius(icon, cornerRadius_width);
        lineTop.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        lineBottom.backgroundColor = ColorWithHex(0x979797, 0.3);
        title.text = @"旅程分享";
    }
    return self;
}

@end
