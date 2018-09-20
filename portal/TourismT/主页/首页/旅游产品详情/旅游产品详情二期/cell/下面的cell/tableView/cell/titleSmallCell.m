//
//  titleCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "titleSmallCell.h"


@interface titleSmallCell ()
@property (nonatomic,weak) UILabel *title;

@property (nonatomic,weak) UIImageView *startPlaceImage;
@property (nonatomic,weak) UIImageView *timeImage;
@property (nonatomic,weak) UIImageView *endPlaceImage;

@property (nonatomic,weak) UILabel *startPlace;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *endPlace;

@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) UILabel *price;


@property (nonatomic,weak) UIView *stages;
@property (nonatomic,weak) UIImageView *stagesImage;
@property (nonatomic,weak) UILabel *stagesTitle;
@property (nonatomic,weak) UILabel *stagesContent;
@property (nonatomic,weak) UILabel *stagesMore;
@property (nonatomic,weak) UIImageView *stagesMoreImage;

@property (nonatomic,weak) UIView *lineBottom;
@end

@implementation titleSmallCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    titleSmallCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[titleSmallCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
        
        UIView *stages = [UIView new];
        [self.contentView addSubview:stages];
        
        UIImageView *stagesImage = [UIImageView new];
        [self.contentView addSubview:stagesImage];
        
        UILabel *stagesTitle = [UILabel new];
        [self.contentView addSubview:stagesTitle];
        
        UILabel *stagesContent = [UILabel new];
        [self.contentView addSubview:stagesContent];
        
        UILabel *stagesMore = [UILabel new];
        [self.contentView addSubview:stagesMore];
        
        UIImageView *stagesMoreImage = [UIImageView new];
        [self.contentView addSubview:stagesMoreImage];
        
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
        [stages mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(price.mas_bottom).offset(14);
            make.height.equalTo(@40);
        }];
        [stagesImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.centerY.equalTo(stages);
            make.width.equalTo(@18);
            make.height.equalTo(@18);
        }];
        [stagesTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(stagesImage.mas_right).offset(6);
            make.centerY.equalTo(stages);
            make.width.equalTo(@50);
        }];
        [stagesContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(stagesTitle.mas_right).offset(20);
            make.right.equalTo(stagesMore.mas_left).offset(-10);
            make.centerY.equalTo(stages);
        }];
        
        [stagesMore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(stagesMoreImage.mas_left).offset(-9);
            make.centerY.equalTo(stages);
        }];
        [stagesMoreImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(stages);
            make.width.equalTo(@6);
            make.height.equalTo(@12);
        }];
        [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(stages.mas_bottom);
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
        self.stages = stages;
        self.stagesImage = stagesImage;
        self.stagesTitle = stagesTitle;
        self.stagesContent = stagesContent;
        self.stagesMore = stagesMore;
        self.stagesMoreImage = stagesMoreImage;
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
        
//        price.font = PingFangSC_Regular(14);
//        price.textColor = ColorWithHex(0x000000, 0.87);
        stagesTitle.font = PingFangSC_Regular(12);
        stagesTitle.textColor = ColorWithHex(0xFB704B, 1.0);
        stagesContent.font = PingFangSC_Regular(12);
        stagesContent.textColor = ColorWithHex(0x000000, 0.54);
        
        stagesMore.font = PingFangSC_Regular(12);
        stagesMore.textColor = ColorWithHex(0x000000, 0.54);
        
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        stages.backgroundColor = ColorWithHex(0xFFF2EF, 1.0);
        lineBottom.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        self.startPlaceImage.image = ImageNamed(@"出发");
        self.timeImage.image = ImageNamed(@"时间3");
        self.endPlaceImage.image = ImageNamed(@"目的地");
        self.stagesImage.image = ImageNamed(@"分期付款");
        self.stagesMoreImage.image = ImageNamed(@"向右灰色");
        
        self.stagesTitle.text = @"免息分期";
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
    
    self.stagesContent.text = data.minPriceStr;
    self.stagesMore.text = data.periodTypeNum;
}
@end
