//
//  myCodeCell.m
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myCodeCell.h"


@interface myCodeCell ()
@property (nonatomic,weak)UILabel *price;
@property (nonatomic,weak)UILabel *title;
@property (nonatomic,weak)UILabel *priceOk;
@property (nonatomic,weak)UILabel *date;
@property (nonatomic,weak)UIImageView *back;
@property (nonatomic,weak)UIImageView *staue;
@end

@implementation myCodeCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myCodeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myCodeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIImageView *back = [[UIImageView alloc]init];
        [self.contentView addSubview:back];
        
        UILabel *price = [[UILabel alloc]init];
        [self.contentView addSubview:price];
        UILabel *priceLater = [[UILabel alloc]init];
        [self.contentView addSubview:priceLater];
        
        UIImageView *su = [[UIImageView alloc]init];
        [self.contentView addSubview:su];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *priceOk = [[UILabel alloc]init];
        [self.contentView addSubview:priceOk];
        
        UILabel *date = [[UILabel alloc]init];
        [self.contentView addSubview:date];
        
        UIImageView *staue = [[UIImageView alloc]init];
        [self.contentView addSubview:staue];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(-3);
            make.bottom.equalTo(self.contentView).offset(-3);
//            make.height.equalTo(@(100));
        }];
        
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(10);
             make.right.equalTo(su.mas_left).offset(0);
            make.centerY.equalTo(back);
        }];

        [su mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(135*WIDTHICON);
            make.centerY.equalTo(back);
            make.height.equalTo(@(94));
//            make.top.equalTo(back).offset(20);
//            make.bottom.equalTo(back).offset(-20);;
            make.width.equalTo(@(2));
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(su.mas_right).offset(17);
//            make.right.equalTo(staue.mas_left).offset(-1);
            make.right.equalTo(priceOk);
            make.top.equalTo(back).offset(35);
        }];
        
        [staue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(back).offset(-5);
            make.top.equalTo(back).offset(10);
            make.width.equalTo(@(65*WIDTHICON));
            make.height.equalTo(@(65*WIDTHICON));
            //make.bottom.equalTo(priceOk.mas_top).offset(-5);
            //make.width.mas_equalTo(staue.mas_height).multipliedBy(1.0);
        }];
        [priceOk mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(back).offset(-5);
            make.top.equalTo(title.mas_bottom).offset(15);
        }];
        [date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(priceOk);
            make.top.equalTo(priceOk.mas_bottom).offset(5);
            make.bottom.equalTo(back).offset(-35);
        }];
        
        //set
        self.staue  =staue;
        self.back  =back;
        self.price  =price;
        self.title  =title;
        self.priceOk  =priceOk;
        self.date  =date;
        back.highlightedImage = ImageNamed(@"亮色code");
        back.image = ImageNamed(@"灰色code");
        price.textAlignment= NSTextAlignmentCenter;
//        [price settextColorhex:0x779CF4 alpa:1.0 font:PingFangSC_Medium(36)];
        [title settextColorhex:0x000000  alpa:0.51 font:PingFangSC_Medium(14)];
        [priceOk settextColorhex:0x000000 alpa:0.51 font:PingFangSC_Regular(12)];
        [date settextColorhex:0x000000 alpa:0.51 font:PingFangSC_Regular(12)];
        //su.backgroundColor = [UIColor redColor];
        su.image = ImageNamed(@"LineTime");
        IMAGEsetCONTENTMODE(su);
        //test
//        title.text = @"与游新客专享客专享礼券礼券";
//        back.highlighted = YES;
//        price.text = @"100";
//        priceOk.text = @"100可以用";
//        date.text = @"201111111111";
//        staue.image = ImageNamed(@"使用中code");
    }
    return self;
}
- (void)setYHQSoneDate:(YHQoneS *)YHQSoneDate{
    _YHQSoneDate = YHQSoneDate;
    if (YHQSoneDate) {
        if (YHQSoneDate.price) {
            NSString *all = [[NSString stringWithFormat:@"%.0f",YHQSoneDate.price] stringByAppendingString:@"元"];
            NSRange range2 = [all rangeOfString:@"元"];
            NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
            NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Medium(36),NSFontAttributeName,ColorWithHex(0x779CF4, 1.0),NSForegroundColorAttributeName, nil];
            [attri setAttributes:dic1 range:NSMakeRange(0, range2.location)];
            NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x779CF4, 1.0),NSForegroundColorAttributeName, nil];
            [attri setAttributes:dic2 range:range2];
            self.price.attributedText = attri;
        }
        self.priceOk.text = YHQSoneDate.condition;
        self.date.text = YHQSoneDate.expireStr;
        self.title.text = YHQSoneDate.name;
        if ([YHQSoneDate.status isEqualToString:Staueusable_youhuiquan_saues]) {
            self.back.highlighted = YES;
            self.staue.hidden = YES;
        }else if ([YHQSoneDate.status isEqualToString:using_youhuiquan_saues]) {
            self.back.highlighted = NO;
            self.staue.hidden = NO;
            self.staue.image = ImageNamed(@"使用中code"); //TODO  使用中是什么？
        }else if ([YHQSoneDate.status isEqualToString:StaueisUsed_youhuiquan_saues]) {
            self.back.highlighted = NO;
            self.staue.hidden = NO;
            self.staue.image = ImageNamed(@"已使用code");
        }else if ([YHQSoneDate.status isEqualToString:Staueexpired_youhuiquan_saues]) {
            self.back.highlighted = NO;
            self.staue.hidden = NO;
            self.staue.image = ImageNamed(@"已过期code");
        }
    }
}

@end
