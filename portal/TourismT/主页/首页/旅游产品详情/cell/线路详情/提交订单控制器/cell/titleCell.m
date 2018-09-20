//
//  titleCell.m
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "titleCell.h"

@interface titleCell ()
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *label1;
@property (nonatomic,weak) UILabel *label2;

@end

@implementation titleCell

+ (instancetype)returnCellWith:(UITableView *)tableView
{
    titleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[titleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIView *back = [[UIView alloc]init];
        back.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        LRViewRadius(back, cornerRadius_width);
        [self.contentView addSubview:back];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *label1 = [[UILabel alloc]init];
        [self.contentView addSubview:label1];
        
        UIImageView *image1 = [[UIImageView alloc]init];
        [self.contentView addSubview:image1];
        
        UILabel *label2 = [[UILabel alloc]init];
        [self.contentView addSubview:label2];
        
        UIImageView *image2 = [[UIImageView alloc]init];
        [self.contentView addSubview:image2];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(0);
        }];

        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.right.equalTo(back).offset(-15);
            make.top.equalTo(back).offset(15);
//            make.height.equalTo(label1);
        }];
        [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.centerY.equalTo(label1);
            make.width.equalTo(@(11));
            make.height.equalTo(@(15));
        }];
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image1.mas_right).offset(6);
            make.top.equalTo(title.mas_bottom).offset(15);
            make.bottom.equalTo(back).offset(-15);
        }];
        
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image2.mas_right).offset(6);
            make.centerY.equalTo(label1);
            make.height.equalTo(@(44));
        }];
        [image2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label1.mas_right).offset(30);
            make.centerY.equalTo(label1);
            make.width.equalTo(@(15));
            make.height.equalTo(@(15));
        }];
        //set
        title.textColor = ColorWithHex(0x000000, 0.87);
        title.numberOfLines = 0;
        label1.textColor = ColorWithHex(0x000000, 0.54);
        label2.textColor = ColorWithHex(0x000000, 0.54);
        
        title.font = PingFangSC_Medium(16);
        label1.font = PingFangSC_Regular(14);
        label2.font = PingFangSC_Regular(14);
        
        image1.image = ImageNamed(@"定位绿色");
        image2.image = ImageNamed(@"日历绿色");
        self.title = title;
        self.label1 = label1;
        self.label2 = label2;
        label2.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick:)];
        [label2 addGestureRecognizer:tap];
        //test
        
//        title.text = @"普吉岛清迈芽庄岘港 6天5晚";
//        label1.text = @"常用";
//        label2.text = @"2016-5-5";
    }
    return self;
}
#pragma  --mark<更换日期>
- (void)labelClick:(UIGestureRecognizer *)tap{
    if (self.priceMonthsA.count) {
//        dateSelect *dateselect;
//        if (self.isPeriod) {
//            dateselect = [dateSelectForStaue new];
//        } else {
//            dateselect = [[dateSelect alloc]init];
//        }
//        dateselect.btnTitle  =@"确定";
//        dateselect.arryA = self.priceMonthsA;
//        kWeakSelf(self)
//        kWeakSelf(dateselect);
//        dateselect.nextClick = ^(NSInteger index,NSString *startDate){
//            weakself.label2.text = startDate;
//            [weakdateselect closeClisck];
//            if (weakself.reselectDateClick) {
//                weakself.reselectDateClick(startDate);
//            }
//        };
//        [dateselect windosViewshow];
    }
}
- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.title.text = titleStr;
}
- (void)setStartTime:(NSString *)startTime{
    _startTime = startTime;
    self.label2.text = startTime;
}
- (void)setStartPlace:(NSArray *)startPlace{
    _startPlace = startPlace;
    if (startPlace) {
        NSString *str = @"";
        for (CityS *cityOne in startPlace) {
            str = [str stringByAppendingString:[NSString stringWithFormat:@"%@,",cityOne.name]];
        }
        str = [str substringWithRange:NSMakeRange(0, (str.length-1))];
        self.label1.text = str;
    }
}
@end
