//
//  homeTwoTypeListCocell.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoTypeListCocell.h"

@interface homeTwoTypeListCocell ()
@property (nonatomic,weak) UIImageView *tyep;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIImageView *timeIcon;
@property (nonatomic,weak) UIView *startPlaceBack;
@property (nonatomic,weak) UILabel *startPlace;

@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UIImageView *endPlaceImage;
@property (nonatomic,weak) UILabel *endPlace;
@end

@implementation homeTwoTypeListCocell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *tyep = [UIImageView new];
        [self.contentView addSubview:tyep];
        
        UIView *startPlaceBack = [UIView new];
        [self.contentView addSubview:startPlaceBack];
        
        UILabel *startPlace = [UILabel new];
        [self.contentView addSubview:startPlace];
        
        UILabel *title = [UILabel new];
        [self.contentView addSubview:title];
        
        UIImageView *timeIcon = [UIImageView new];
        [self.contentView addSubview:timeIcon];
        
        UILabel *time = [UILabel new];
        [self.contentView addSubview:time];
        
        UIImageView *endPlaceImage = [UIImageView new];
        [self.contentView addSubview:endPlaceImage];
        
        UILabel *endPlace = [UILabel new];
        [self.contentView addSubview:endPlace];
        
        
        [tyep mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.height.equalTo(@(250*HEIGHTICON));
            make.width.equalTo(@(180*WIDTHICON));
        }];
        [startPlaceBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(startPlace).offset(-5);
            make.right.equalTo(startPlace).offset(5);
            make.top.equalTo(startPlace).offset(-5);
            make.bottom.equalTo(startPlace).offset(5);
            
        }];
        [startPlace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10);
            make.top.equalTo(tyep).offset(10);
            make.width.mas_lessThanOrEqualTo(@(180*WIDTHICON-20));
        }];
        
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(tyep.mas_bottom).offset(16);
        }];
        [timeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.top.equalTo(title.mas_bottom).offset(13);
            make.width.equalTo(@(12));
            make.height.equalTo(@(12));
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeIcon.mas_right).offset(5);
            make.centerY.equalTo(timeIcon);
        }];
        [endPlaceImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(time.mas_right).offset(12);
            make.centerY.equalTo(timeIcon);
            make.width.equalTo(@(9));
            make.height.equalTo(@(13));
        }];
        [endPlace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(endPlaceImage.mas_right).offset(5);
            make.centerY.equalTo(timeIcon);
        }];
        self.tyep= tyep;
        self.title= title;
        self.timeIcon= timeIcon;
        self.startPlaceBack= startPlaceBack;
        self.startPlace= startPlace;
        self.time= time;
        self.endPlaceImage= endPlaceImage;
        self.endPlace= endPlace;
        
        
        IMAGEsetCONTENTMODE(tyep);
        IMAGEsetCONTENTMODE(timeIcon);
        IMAGEsetCONTENTMODE(endPlaceImage);
        LRViewRadius(startPlaceBack, cornerRadius_width);
        LRViewRadius(tyep, cornerRadius_width);
        title.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x000000, 0.87);
        startPlaceBack.backgroundColor  =ColorWithHex(0x000000, 0.3);
        timeIcon.image = ImageNamed(@"时间全灰");
        endPlaceImage.image = ImageNamed(@"目的地全灰");
        startPlace.font = PingFangSC_Regular(10);
        startPlace.textColor = ColorWithHex(0xFFFFFF, 1.0);
        
        time.font = PingFangSC_Regular(12);
        time.textColor = ColorWithHex(0x000000, 0.54);
        endPlace.font = PingFangSC_Regular(12);
        endPlace.textColor = ColorWithHex(0x000000, 0.54);
        
        //test
        title.text = @"1sdf";
        tyep.image = ImageNamed(@"背景色");
        startPlace.text = @"chufa";
        time.text = @"chufa";
        endPlace.text = @"endPlace";
    }
    return self;
}

- (void)setDate:(contentS *)date{
    if (date) {
        _date = date;
        self.title.text = date.name;
        [self.tyep sd_setImageWithURL:[NSURL URLWithString:date.coverImage] placeholderImage:ImageNamed(place_image_image)];
        self.startPlace.text = date.fromCityCh;
        self.time.text = date.dayCh;
        self.endPlace.text = date.toCityCh;
        
    }
}
@end
