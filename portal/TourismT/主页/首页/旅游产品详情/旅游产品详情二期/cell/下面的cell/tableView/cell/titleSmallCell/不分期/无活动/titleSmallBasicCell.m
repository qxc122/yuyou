//
//  titleSmallBasicCell.m
//  TourismT
//
//  Created by Store on 2017/8/7.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "titleSmallBasicCell.h"


@interface titleSmallBasicCell ()
@property (nonatomic,weak) UILabel *title;

@property (nonatomic,weak) UIImageView *startPlaceImage;
@property (nonatomic,weak) UIImageView *timeImage;
@property (nonatomic,weak) UIImageView *endPlaceImage;

@property (nonatomic,weak) UILabel *startPlace;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *endPlace;

@property (nonatomic,weak) UIView *line;

@end

@implementation titleSmallBasicCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    titleSmallBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[titleSmallBasicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *title = [UILabel new];
        [self.contentView addSubview:title];
        
        UIImageView *startPlaceImage = [UIImageView new];
        [self.contentView addSubview:startPlaceImage];
        
        UIImageView *timeImage = [UIImageView new];
        [self.contentView addSubview:timeImage];
        
        UIImageView *endPlaceImage = [UIImageView new];
        [self.contentView addSubview:endPlaceImage];
        
        UILabel *startPlace = [UILabel new];
        [self.contentView addSubview:startPlace];
        
        UILabel *time = [UILabel new];
        [self.contentView addSubview:time];
        
        UILabel *endPlace = [UILabel new];
        [self.contentView addSubview:endPlace];
        
        UIView *line = [UIView new];
        [self.contentView addSubview:line];
        
        UILabel *price = [UILabel new];
        [self.contentView addSubview:price];
        
        UIView *lineBottom = [UIView new];
        [self.contentView addSubview:lineBottom];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(24);
        }];
        [startPlaceImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.top.equalTo(title.mas_bottom).offset(21);
            make.height.equalTo(@[@12,timeImage,endPlaceImage]);
            make.width.equalTo(@[@12,timeImage,endPlaceImage]);
        }];
        
        [startPlace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(startPlaceImage.mas_right).offset(5);
            make.centerY.equalTo(startPlaceImage);
        }];
        
        [timeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(startPlace.mas_right).offset(12);
            make.centerY.equalTo(startPlaceImage);
        }];
        
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeImage.mas_right).offset(5);
            make.centerY.equalTo(startPlaceImage);
        }];
        
        [endPlaceImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(time.mas_right).offset(12);
            make.centerY.equalTo(startPlaceImage);
        }];
        
        [endPlace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(endPlaceImage.mas_right).offset(5);
            make.centerY.equalTo(startPlaceImage);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(startPlaceImage.mas_bottom).offset(20);
            make.height.equalTo(@0.5);
        }];
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(title);
            make.top.equalTo(line.mas_bottom).offset(16);
        }];
        [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(price.mas_bottom).offset(16);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@10);
        }];

        
        self.title = title;
        self.startPlaceImage = startPlaceImage;
        self.timeImage = timeImage;
        self.endPlaceImage = endPlaceImage;
        self.startPlace = startPlace;
        self.time = time;
        self.endPlace = endPlace;
        self.line = line;
        self.price = price;

        self.lineBottom = lineBottom;
        //        [stagesTitle setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        //        [stagesMore setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        //        [stagesContent setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        //set
        title.font = PingFangSC_Medium(18);
        title.textColor = ColorWithHex(0x000000, 0.87);
        startPlace.font = PingFangSC_Regular(12);
        startPlace.textColor = ColorWithHex(0x000000, 0.87);
        time.font = PingFangSC_Regular(12);
        time.textColor = ColorWithHex(0x000000, 0.87);
        endPlace.font = PingFangSC_Regular(12);
        endPlace.textColor = ColorWithHex(0x000000, 0.87);
        
        price.font = PingFangSC_Medium(20);
        price.textColor = ColorWithHex(0xFB704B, 1.0);   

        
        line.backgroundColor = ColorWithHex(0x979797, 0.3);

        lineBottom.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        self.startPlaceImage.image = ImageNamed(@"出发");
        self.timeImage.image = ImageNamed(@"时间3");
        self.endPlaceImage.image = ImageNamed(@"目的地");

        //test
        //        self.title.text = @"123";
        //        self.startPlace.text = @"123";
        //        self.time.text = @"123";
        //        self.endPlace.text = @"123";
        //        self.price.text = @"123";
        //        self.stagesContent.text = @"123";
        //        self.stagesMore.text = @"123";
        
    }
    return self;
}
- (void)setData:(tourDetaisData *)data{
    _data = data;
    self.title.text = data.travel.name;
    self.startPlace.text = data.travel.fromCityCh;
    self.time.text = data.travel.dayCh;
    self.endPlace.text = data.travel.toCityCh;
    self.price.text = data.travel.price;
}
@end
