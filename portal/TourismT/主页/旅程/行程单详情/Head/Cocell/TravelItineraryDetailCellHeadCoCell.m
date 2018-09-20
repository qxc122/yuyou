//
//  TravelItineraryDetailCellHeadCoCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TravelItineraryDetailCellHeadCoCell.h"
#import "UIImage+cir.h"
@interface TravelItineraryDetailCellHeadCoCell ()
@property (nonatomic,weak) UILabel *day;
@property (nonatomic,weak) UILabel *date;
@property (nonatomic,weak) UIImageView *back;
@end

@implementation TravelItineraryDetailCellHeadCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *back = [[UIImageView alloc]init];
        [self.contentView addSubview:back];
        
        UILabel *day = [[UILabel alloc]init];
        [self.contentView addSubview:day];
        
        UILabel *date = [[UILabel alloc]init];
        [self.contentView addSubview:date];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        
        [day mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(7);
        }];
        
        [date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-4);
        }];
        
        self.back  =back;
        self.day  =day;
        self.date  =date;
        self.day.textAlignment  =NSTextAlignmentCenter;
        self.date.textAlignment  =NSTextAlignmentCenter;
        day.font = PingFangSC_Medium(15);
        date.font = PingFangSC_Regular(10);
        
//        day.font = PingFangSC_Medium(18);
//        date.font = PingFangSC_Regular(12);
        
        day.textColor = ColorWithHex(0x789BF1, 1.0);
        date.textColor = ColorWithHex(0x789BF1, 1.0);
        
        day.highlightedTextColor = ColorWithHex(0xFFFFFF, 1.0);
        date.highlightedTextColor = ColorWithHex(0xFFFFFF, 1.0);
        
        LRViewRadius(back, cornerRadius_width);
        back.image = [UIImage imageWithColor:ColorWithHex(0xEBF1FF, 1.0)];
        back.highlightedImage = [UIImage imageWithColor:ColorWithHex(0x789BF1, 1.0)];
        
        //test
        self.day.text  =@"D1";
        self.date.text  =@"7-12";
    }
    return self;
}
- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        self.day.font = PingFangSC_Medium(18);
        self.date.font = PingFangSC_Regular(12);
    } else {
        self.day.font = PingFangSC_Medium(15);
        self.date.font = PingFangSC_Regular(10);
    }
}
@end
