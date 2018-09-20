//
//  CustomNavigationBarForHome.m
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "CustomNavigationBarForHome.h"

@interface CustomNavigationBarForHome ()
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIImageView *avtor;
@end

@implementation CustomNavigationBarForHome

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
//        self.backgroundColor = [UIColor whiteColor];
        UIView *su = [[UIView alloc]init];
        [self addSubview:su];
        
        UIImageView *back = [[UIImageView alloc]init];
        [self addSubview:back];
        
        UILabel *title = [[UILabel alloc]init];
        [self addSubview:title];
        
        UIImageView *avtor = [[UIImageView alloc]init];
        [self addSubview:avtor];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self).offset((36+15)*0.5);
            make.bottom.equalTo(self).offset(-11);
            make.width.lessThanOrEqualTo(@(ScreenWidth-36-50-50-15));
        }];
        
        [avtor mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(title.mas_left).offset(-15);
            make.centerY.equalTo(title);
            make.width.equalTo(@(36));
            make.height.equalTo(@(36));
        }];
        
        //set
        self.title = title;
        self.avtor = avtor;
        LRViewRadius(avtor, 36/2.0);
        LRViewBorder(avtor, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        title.font = PingFangSC_Medium(17);
        title.textColor = ColorWithHex(0xFFFFFF, 1.0);
        avtor.contentMode = UIViewContentModeScaleAspectFill;
        back.contentMode = UIViewContentModeScaleAspectFill;
        back.image = ImageNamed(IMAGE_NavcBack);
        //test
//        self.title.text = @"sdfsd";
//        self.avtor.image = ImageNamed(@"1");
    }
    return self;
}
- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.title.text = titleStr;
}
- (void)setAvtorStr:(NSString *)avtorStr{
    _avtorStr = avtorStr;
    [self.avtor sd_setImageWithURL:[NSURL URLWithString:avtorStr] placeholderImage:ImageNamed(place_image_image)];
}
@end
