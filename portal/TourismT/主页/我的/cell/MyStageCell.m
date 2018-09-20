//
//  MyStageCell.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "MyStageCell.h"


@interface MyStageCell ()
@property (nonatomic,weak) UILabel *AmountPayable;
@property (nonatomic,weak) UILabel *NumberOfPens;
@property (nonatomic,weak) UILabel *DaysRemaining;
@property (nonatomic,weak) UILabel *DaysRemaining1;
@end

@implementation MyStageCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    MyStageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[MyStageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *more = [[UILabel alloc]init];
        [self.contentView addSubview:more];
        
        UIImageView *icon = [[UIImageView alloc]init];
        [self.contentView addSubview:icon];
        
        UIButton *btnMore = [[UIButton alloc]init];
        [self.contentView addSubview:btnMore];
        
        UIView *btnMoreBack = [[UIView alloc]init];
        [self.contentView addSubview:btnMoreBack];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        
        UILabel *AmountPayable1 = [[UILabel alloc]init];
        [self.contentView addSubview:AmountPayable1];
        
        UILabel *AmountPayable = [[UILabel alloc]init];
        [self.contentView addSubview:AmountPayable];

        UILabel *NumberOfPens1 = [[UILabel alloc]init];
        [self.contentView addSubview:NumberOfPens1];
        
        UILabel *NumberOfPens = [[UILabel alloc]init];
        [self.contentView addSubview:NumberOfPens];
        
        UILabel *DaysRemaining1 = [[UILabel alloc]init];
        [self.contentView addSubview:DaysRemaining1];
        
        UILabel *DaysRemaining = [[UILabel alloc]init];
        [self.contentView addSubview:DaysRemaining];
        
        UIView *lineBottom = [[UIView alloc]init];
        [self.contentView addSubview:lineBottom];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(18);
        }];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(title);
            make.height.equalTo(@(12));
            make.width.equalTo(@(6));
        }];
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(icon);
            make.right.equalTo(icon.mas_left).offset(-17);
        }];
        
        [btnMoreBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(more);
            make.right.equalTo(icon);
            make.centerY.equalTo(icon);
            make.height.equalTo(@(44));
        }];
        [btnMore mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(more);
//            make.right.equalTo(icon);
//            make.centerY.equalTo(icon);
//            make.height.equalTo(@(44));
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];

        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(icon);
            make.height.equalTo(@(0.5));
            make.top.equalTo(title.mas_bottom).offset(17);
        }];
        

        [AmountPayable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.top.equalTo(line.mas_bottom).offset(12);
            make.width.equalTo(@[AmountPayable1,DaysRemaining,DaysRemaining1,NumberOfPens1,NumberOfPens]);
        }];
        
        [AmountPayable1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(AmountPayable);
            make.top.equalTo(AmountPayable.mas_bottom).offset(20);
            make.centerX.equalTo(AmountPayable);
        }];

        [NumberOfPens mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(AmountPayable.mas_right);
            make.top.equalTo(AmountPayable);
            make.bottom.equalTo(AmountPayable);
        }];

        [NumberOfPens1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(AmountPayable1.mas_right);
            make.top.equalTo(AmountPayable1);
            make.bottom.equalTo(AmountPayable1);
        }];
        
        [DaysRemaining mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(NumberOfPens.mas_right);
            make.right.equalTo(self.contentView);
            make.top.equalTo(NumberOfPens);
            make.bottom.equalTo(NumberOfPens);
        }];
        
        [DaysRemaining1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(NumberOfPens1.mas_right);
            make.right.equalTo(self.contentView);
            make.top.equalTo(NumberOfPens1);
            make.bottom.equalTo(NumberOfPens1);
        }];
        [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
            make.top.equalTo(AmountPayable1.mas_bottom).offset(14);
            make.bottom.equalTo(self.contentView);
        }];

        
        //set
        lineBottom.backgroundColor = ColorWithHex(0x979797, 0.3);
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        
        icon.image = ImageNamed(@"向右灰色");
        icon.contentMode = UIViewContentModeScaleAspectFill;
        
        self.AmountPayable  =AmountPayable;
        self.NumberOfPens  =NumberOfPens;
        self.DaysRemaining  =DaysRemaining;
        self.DaysRemaining1  =DaysRemaining1;
        
        more.font = PingFangSC_Regular(12);
        more.textColor = ColorWithHex(0x000000, 0.54);
        more.text = @"查看全部";
        
        title.font = PingFangSC_Regular(15);
        title.textColor = ColorWithHex(0x000000, 0.87);
        title.text = @"我的分期";

        AmountPayable.font = PingFangSC_Regular(17);
        AmountPayable.textColor = ColorWithHex(0x779CF4, 1.0);
        
        NumberOfPens.font = PingFangSC_Regular(17);
        NumberOfPens.textColor = ColorWithHex(0x779CF4, 1.0);
        
        AmountPayable1.font = PingFangSC_Regular(12);
        AmountPayable1.textColor = ColorWithHex(0x000000, 0.87);
        AmountPayable1.text = @"本月应还";
        
        NumberOfPens1.font = PingFangSC_Regular(12);
        NumberOfPens1.textColor = ColorWithHex(0x000000, 0.87);
        NumberOfPens1.text = @"消费笔数";
        
        DaysRemaining1.font = PingFangSC_Regular(12);
        DaysRemaining1.textColor = ColorWithHex(0x000000, 0.87);
        DaysRemaining1.highlightedTextColor = ColorWithHex(0xFB704B, 0.87);
        DaysRemaining1.text = @"还款日";
        
        AmountPayable.textAlignment = NSTextAlignmentCenter;
        AmountPayable1.textAlignment = NSTextAlignmentCenter;
        NumberOfPens.textAlignment = NSTextAlignmentCenter;
        NumberOfPens1.textAlignment = NSTextAlignmentCenter;
        DaysRemaining.textAlignment = NSTextAlignmentCenter;
        DaysRemaining1.textAlignment = NSTextAlignmentCenter;
        
        self.AmountPayable.text = @"0.00";
        self.NumberOfPens.text = @"-";
        [self setPriceLabel:@"-"];
        //test
        
//        AmountPayable.text = @"420.00";
//        NumberOfPens.text = @"2";
//        DaysRemaining.text = @"剩余五天";
//        [self setPriceLabel:@" 5 "];
    }
    return self;
}

- (void)setDate:(myAppInfoS *)date{
    if (date) {
        _date = date;
//        date.periodInfo.remainDays = nil;
//        date.periodInfo.overdueDays = @"3";
        self.AmountPayable.text = date.periodInfo.periodRepaymentSum;
        self.NumberOfPens.text = [NSString stringWithFormat:@"%@",date.periodInfo.count];
        if (date.periodInfo.remainDays && date.periodInfo.remainDays.length) {
            [self setPriceLabel:[NSString stringWithFormat:@"%@",date.periodInfo.remainDays]];
            self.DaysRemaining1.highlighted = NO;
            self.DaysRemaining1.text = @"还款日";
        } else if (date.periodInfo.overdueDays && date.periodInfo.overdueDays.length) { //逾期
            self.DaysRemaining1.highlighted = YES;
            self.DaysRemaining1.text = @"您已逾期";
            [self setPriceLabelYuqi:[NSString stringWithFormat:@"%@",date.periodInfo.overdueDays]];
        }
    }else{
        self.DaysRemaining1.highlighted = NO;
        self.AmountPayable.text = @"0.00";
        self.NumberOfPens.text = @"-";
        [self setPriceLabel:@"-"];
    }
}

#pragma --mark<设置 逾期 天数>
- (void)setPriceLabelYuqi:(NSString *)price{
    if (price && price.length) {
        price = [price stringByReplacingOccurrencesOfString:@" " withString:@""];
        

        NSString *dateContent2 = @" 天";
        NSString *all = [price stringByAppendingString:dateContent2];
        NSRange range1 = [all rangeOfString:dateContent2];
        NSRange range2 = [all rangeOfString:price];

        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic1 range:range1];
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(17),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic2 range:range2];

        self.DaysRemaining.attributedText = attri;
    }
}


#pragma --mark<设置 剩余 天数>
- (void)setPriceLabel:(NSString *)price{
    if (price && price.length) {
        price = [price stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSString *dateContent = @"剩 ";
        NSString *dateContent2 = @" 天";
        NSString *all = [dateContent stringByAppendingString:price];
        all = [all stringByAppendingString:dateContent2];
        NSRange range1 = [all rangeOfString:dateContent];
        NSRange range2 = [all rangeOfString:price];
        NSRange range3 = [all rangeOfString:dateContent2];
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic1 range:range1];
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(17),NSFontAttributeName,ColorWithHex(0x779CF4, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic2 range:range2];
        NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic3 range:range3];
        self.DaysRemaining.attributedText = attri;
    }
}
@end
