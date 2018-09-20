//
//  StagingDetailsListCell.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "StagingDetailsListCell.h"


@interface StagingDetailsListCell ()
@property (nonatomic,weak) UILabel *index;
@property (nonatomic,weak) UILabel *money;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *statue;
@property (nonatomic,weak) UILabel *interest;

@end

@implementation StagingDetailsListCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    StagingDetailsListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[StagingDetailsListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        
        UILabel *index = [UILabel new];
        [self.contentView addSubview:index];
        
        UILabel *money = [UILabel new];
        [self.contentView addSubview:money];
        
        UILabel *time = [UILabel new];
        [self.contentView addSubview:time];
        UILabel *interest = [UILabel new];
        [self.contentView addSubview:interest];

        UILabel *statue = [UILabel new];
        [self.contentView addSubview:statue];
        
        UIView *line = [UIView new];
        [self.contentView addSubview:line];

        [index mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(16);
        }];
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(index);
        }];
        [interest mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(money);
            make.height.equalTo(@11);
            make.top.equalTo(money.mas_bottom).offset(5);
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(index);
            make.top.equalTo(interest.mas_bottom).offset(4);
        }];
        [statue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(money);
            make.top.equalTo(time);
            make.bottom.equalTo(time);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.top.equalTo(time.mas_bottom).offset(15);
            make.height.equalTo(@0.5);
        }];
            //set
        index.font = PingFangSC_Regular(14);
        index.textColor = ColorWithHex(0x00000, 0.54);
        money.font = PingFangSC_Regular(14);
        money.textColor = ColorWithHex(0x00000, 0.54);
        time.font = PingFangSC_Regular(14);
        time.textColor = ColorWithHex(0x00000 , 0.54);
        
        statue.font = PingFangSC_Medium(14);
        statue.textColor = ColorWithHex(0x00000, 0.54);

        interest.font = PingFangSC_Regular(11);
        interest.textColor = ColorWithHex(0x00000, 0.54);
        interest.highlightedTextColor = ColorWithHex(0xFB704B, 1.0);
        index.highlightedTextColor = ColorWithHex(0x00000, 0.87);
        money.highlightedTextColor = ColorWithHex(0x00000, 0.87);
        time.highlightedTextColor = ColorWithHex(0x00000, 0.87);
        statue.highlightedTextColor = ColorWithHex(0x779FF6 , 1.0);
        
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        
        
        self.interest  =interest;
        self.index  =index;
        self.money  =money;
        self.time  =time;
        self.statue  =statue;
        
        //test
//        index.text = @"01/12";
//        money.text = @"420.00";
//        time.text = @"2017-05-12";
//        statue.text = @"已还清";
//        
//        
//        index.highlighted = YES;
//        money.highlighted = YES;
//        time.highlighted = YES;
//        statue.highlighted = YES;
        
//        interest.text = @"sdf";
    }
    return self;
}
- (void)setDate:(periodItemListAForONeS *)date{
    if (date) {
        _date = date;
        self.index.text = date.idx;
        self.money.text = date.repayment;
        if ([date.paidDate rangeOfString:@"还款日"].location == NSNotFound) {
            date.paidDate = [@"还款日" stringByAppendingString:date.paidDate];
        }
        self.time.text = date.paidDate;
        self.statue.text = date.statusCh;
        self.interest.text = date.interest;
        if ([date.status isEqualToString:paid]) {
            NSLog(@"%@",date.status);
            self.index.highlighted = NO;
             self.money.highlighted = NO;
             self.time.highlighted = NO;
             self.statue.highlighted = NO;
            self.interest.highlighted = NO;
        } else {
            self.interest.highlighted = YES;
            self.index.highlighted = YES;
            self.money.highlighted = YES;
            self.time.highlighted = YES;
            self.statue.highlighted = YES;
        }
    }
}
@end
