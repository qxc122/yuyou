//
//  SqCoCell.m
//  TourismT
//
//  Created by Store on 2017/6/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "SqCoCell.h"

@interface SqCoCell ()
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIImageView *icon;

@property (nonatomic,weak) UIView *lineTop;
@property (nonatomic,weak) UIView *lineBottom;
@property (nonatomic,weak) UIView *lineLeft;
@property (nonatomic,weak) UIView *lineRight;
@end


@implementation SqCoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *icon = [[UIImageView alloc]init];
        self.icon = icon;
        [self.contentView addSubview:icon];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        self.title = title;
        
        UIView *lineTop = [[UIView alloc]init];
        [self.contentView addSubview:lineTop];
        self.lineTop = lineTop;
        
        UIView *lineBottom = [[UIView alloc]init];
        [self.contentView addSubview:lineBottom];
        self.lineBottom = lineBottom;
        
        UIView *lineLeft = [[UIView alloc]init];
        [self.contentView addSubview:lineLeft];
        self.lineLeft = lineLeft;
        
        UIView *lineRight = [[UIView alloc]init];
        [self.contentView addSubview:lineRight];
        self.lineRight = lineRight;
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView).offset(-(12+17)*0.5);
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-17);
            make.height.equalTo(@(12));
        }];
        [lineTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
        [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
        [lineLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.width.equalTo(@(0.5));
        }];
        [lineRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.width.equalTo(@(0.5));
        }];
        
        lineTop.backgroundColor = ColorWithHex(0x979797, 0.3);
        lineBottom.backgroundColor = ColorWithHex(0x979797, 0.3);
        lineLeft.backgroundColor = ColorWithHex(0x979797, 0.3);
        lineRight.backgroundColor = ColorWithHex(0x979797, 0.3);
        
//        lineTop.backgroundColor = [UIColor redColor];
//        lineBottom.backgroundColor = [UIColor redColor];
//        lineLeft.backgroundColor = [UIColor redColor];
//        lineRight.backgroundColor = [UIColor redColor];
        IMAGEsetCONTENTMODE(icon);
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor =  ColorWithHex(0x000000, 0.8);
        title.font = PingFangSC_Regular(12);
    }
    return self;
}
- (void)setDate:(myhome *)date{
    _date =date;
    self.title.text = date.titleStr;
    self.icon.image = ImageNamed(date.iconStr);
}
- (void)setTop:(bool)Top{
    _Top = Top;
   self.lineTop.hidden = Top;
}
- (void)setBottom:(bool)Bottom{
    _Bottom = Bottom;
    self.lineBottom.hidden = Bottom;
}
- (void)setLeft:(bool)Left{
    _Left = Left;
    self.lineLeft.hidden = Left;
}
- (void)setRight:(bool)Right{
    _Right = Right;
    self.lineRight.hidden = Right;
}
@end
