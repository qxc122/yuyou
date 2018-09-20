//
//  shareCoCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "shareCoCell.h"
#import "UIImageView+CornerRadius.h"

@interface shareCoCell ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UIView *back;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *content;

@end

@implementation shareCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *back = [UIView new];
        [self.contentView addSubview:back];
        
        UIImageView *image = [UIImageView new];
        [self.contentView addSubview:image];
        
        UIImageView *icon = [UIImageView new];
        [self.contentView addSubview:icon];
        
        UILabel *name = [UILabel new];
        [self.contentView addSubview:name];
        
        UILabel *content = [UILabel new];
        [self.contentView addSubview:content];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(0.5);
            make.right.equalTo(self.contentView).offset(-0.5);
            make.top.equalTo(self.contentView).offset(0.5);
            make.height.equalTo(@(144*HEIGHTICON));
        }];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(image.mas_bottom).offset(9*HEIGHTICON);
            make.bottom.equalTo(back).offset(-9*HEIGHTICON);
            make.width.mas_equalTo(icon.mas_height);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon.mas_right).offset(14);
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(icon);
        }];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image).offset(15);
            make.right.equalTo(image).offset(-15);
            make.centerY.equalTo(image);
        }];
        
        //set
        self.back = back;
        self.image = image;
        self.icon = icon;
        self.name = name;
        self.content = content;
        self.image.backgroundColor = ColorWithHex(0xD0D0D0, 1.0);
        LRViewRadius(back, cornerRadius_width);
        LRViewBorder(back, 0.5, ColorWithHex(0xD0D0D0, 1.0));
        content.textAlignment = NSTextAlignmentCenter;
        name.font = PingFangSC_Regular(14);
        name.textColor = ColorWithHex(0x000000, 0.54);
        content.font = PingFangSC_Regular(16);
        content.textColor = ColorWithHex(0xFFFFFF, 1.0);
        [icon zy_cornerRadiusAdvance:32*HEIGHTICON rectCornerType:UIRectCornerAllCorners];
        [image zy_cornerRadiusAdvance:cornerRadius_width rectCornerType:UIRectCornerTopLeft|UIRectCornerTopRight];
        IMAGEsetCONTENTMODE(image);
        //test
//        content.backgroundColor = [UIColor redColor];
//        name.text = @"阿斯顿发的";
//        content.text = @"水淀粉";
//        image.image = ImageNamed(@"背景色");
//        icon.image = ImageNamed(@"背景色");
    }
    return self;
}

- (void)setData:(travelSharingsS *)data{
    _data = data;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:data.userAvatar] placeholderImage:ImageNamed(place_image_image)];
    [self.image sd_setImageWithURL:[NSURL URLWithString:data.coverImage] placeholderImage:ImageNamed(place_image_image)];
    self.name.text = data.username;
    self.content.text = data.title;
}
@end
