//
//  homeTwoTypeCoCell.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoTypeCoCell.h"

@interface homeTwoTypeCoCell ()
@property (nonatomic,weak) UIImageView *tyep;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIImageView *icon;
@end

@implementation homeTwoTypeCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *tyep = [UIImageView new];
        [self.contentView addSubview:tyep];
        
        UILabel *title = [UILabel new];
        [self.contentView addSubview:title];
        
        UIImageView *icon = [UIImageView new];
        [self.contentView addSubview:icon];
        
        [tyep mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(20);
            make.centerX.equalTo(self.contentView);
            make.height.equalTo(@(45*HEIGHTICON));
            make.width.equalTo(@(45*HEIGHTICON));
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(tyep.mas_bottom).offset(12);
        }];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.width.equalTo(@(8));
            make.height.equalTo(@(6));
        }];
        self.tyep= tyep;
        self.title= title;
        self.icon= icon;
        IMAGEsetCONTENTMODE(tyep);
        IMAGEsetCONTENTMODE(icon);
        title.textAlignment = NSTextAlignmentCenter;
        title.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x000000, 0.87);
        title.highlightedTextColor = ColorWithHex(0x789BF1 , 1.0);
        icon.highlightedImage = ImageNamed(@"Triangle 4");
        //test
//        title.text = @"1sdf";
//        tyep.image = ImageNamed(@"背景色");
    }
    return self;
}
- (void)setIsShake:(BOOL)isShake{
    _isShake = isShake;
    if (isShake) {
        CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        shake.fromValue = [NSNumber numberWithFloat:-5];
        shake.toValue = [NSNumber numberWithFloat:5];
        shake.duration = 0.1;//执行时间
        shake.autoreverses = YES; //是否重复
        shake.repeatCount = 1;//次数
        [self.tyep.layer addAnimation:shake forKey:@"shakeAnimation"];
    }
}

- (void)setDate:(homeDataV2_Type *)date{
    if (date) {
        _date = date;
        [self.tyep sd_setImageWithURL:[NSURL URLWithString:date.imageUrl] placeholderImage:ImageNamed(place_image_image)];
        self.title.text = date.name;
    }
}
@end
