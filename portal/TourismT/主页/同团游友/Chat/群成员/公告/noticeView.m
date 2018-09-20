//
//  noticeView.m
//  TourismT
//
//  Created by Store on 2017/6/22.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "noticeView.h"

@interface noticeView ()
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) UILabel *content;
@property (nonatomic,weak) UIView *back;
@end

@implementation noticeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = NO;
        
        UIView *back = [[UIView alloc]init];
        [self addSubview:back];
        
        UIImageView *icon = [[UIImageView alloc]init];
        [self addSubview:icon];
        UILabel *title = [[UILabel alloc]init];
        [self addSubview:title];
        
        UILabel *time = [[UILabel alloc]init];
        [self addSubview:time];
        UIView *line = [[UIView alloc]init];
        [self addSubview:line];
        UILabel *content = [[UILabel alloc]init];
        [self addSubview:content];

        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.top.equalTo(back).offset(12);
            make.width.equalTo(@(10));
            make.height.equalTo(@(10));
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(icon);
            make.left.equalTo(icon.mas_right).offset(6);
            make.height.equalTo(@(16));
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(icon);
            make.right.equalTo(back).offset(-15);
            make.height.equalTo(@(16));
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.right.equalTo(back).offset(-15);
            make.top.equalTo(title.mas_bottom).offset(12);
            make.height.equalTo(@(1));
        }];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.right.equalTo(back).offset(-15);
            make.top.equalTo(line.mas_bottom).offset(12);
            make.bottom.equalTo(self).offset(-12);
        }];
        LRViewRadius(self, cornerRadius_width);

        title.textColor = ColorWithHex(0x000000, 0.87);
        title.font = PingFangSC_Regular(16);
        time.textColor = ColorWithHex(0x000000, 0.3);
        time.font = PingFangSC_Regular(12);
        content.textColor = ColorWithHex(0x000000, 0.87);
        content.font = PingFangSC_Regular(14);
        line.backgroundColor = ColorWithHex(0x000000, 0.05);
        back.backgroundColor = ColorWithHex(0x000000, 0.05);
        content.numberOfLines = 0;
        icon.image = ImageNamed(@"公告");
        title.text = @"公告提醒";
        self.time = time;
        self.content = content;
        //test
//        time.text = @"sdfsddff15";
//        content.text = @"sdasdfasdfadfasdfasasdfasdfasdfadfadfadfadfadfddfasdfasddfasdfasddfasdfasdsdfasdfasdfasdfasdffsdf";
    }
    return self;
}
- (void)setDate:(Arry_notices_one *)date{
    _date = date;
    self.time.text = date.date;
   self.content.text = date.notice;
}
@end
