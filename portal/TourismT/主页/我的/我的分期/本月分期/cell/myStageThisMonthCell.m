//
//  myStageThisMonthCell.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myStageThisMonthCell.h"


@interface myStageThisMonthCell ()

@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *money;
@property (nonatomic,weak) UILabel *commodityName;
@property (nonatomic,weak) UILabel *TotalOrder;
@property (nonatomic,weak) UILabel *RepaymentDate;
@property (nonatomic,weak) UILabel *interest;
@end

@implementation myStageThisMonthCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myStageThisMonthCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myStageThisMonthCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *back = [UIView new];
        [self.contentView addSubview:back];
        
        UILabel *name = [UILabel new];
        [back addSubview:name];
        
        UILabel *time = [UILabel new];
        [back addSubview:time];
        
        UILabel *money = [UILabel new];
        [back addSubview:money];
        
        UILabel *interest = [UILabel new];
        [back addSubview:interest];
        
        UILabel *goToLable = [UILabel new];
        [back addSubview:goToLable];
        
        UIImageView *goToImage = [UIImageView new];
        [back addSubview:goToImage];
        
        UIButton *goToBtn = [UIButton new];
        [back addSubview:goToBtn];
        
        UIView *line = [UIView new];
        [back addSubview:line];
        
        UILabel *commodityName1 = [UILabel new];
        [back addSubview:commodityName1];
        
        UILabel *commodityName = [UILabel new];
        [back addSubview:commodityName];
        
        UIImageView *commodityNameImage = [UIImageView new];
        [back addSubview:commodityNameImage];
        
        UIButton *goToBtn2 = [UIButton new];
        [back addSubview:goToBtn2];
        
        UILabel *TotalOrder1 = [UILabel new];
        [back addSubview:TotalOrder1];
        
        UILabel *TotalOrder = [UILabel new];
        [back addSubview:TotalOrder];
        
        UILabel *RepaymentDate1 = [UILabel new];
        [back addSubview:RepaymentDate1];
        
        UILabel *RepaymentDate = [UILabel new];
        [back addSubview:RepaymentDate];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.top.equalTo(back).offset(22);
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(back).offset(-15);
            make.centerY.equalTo(name);
        }];
        
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.top.equalTo(name.mas_bottom).offset(10);
        }];
        [interest mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.height.equalTo(@14);
            make.top.equalTo(money.mas_bottom).offset(4);
        }];
        
        [goToImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(time);
            make.width.equalTo(@4);
            make.height.equalTo(@8);
            make.centerY.equalTo(money);
        }];
        [goToLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(goToImage.mas_left).offset(-5);
            make.centerY.equalTo(goToImage);
        }];
        [goToBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(goToLable);
            make.right.equalTo(goToImage);
            make.height.equalTo(@44);
            make.centerY.equalTo(goToImage);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.right.equalTo(back);
            make.height.equalTo(@0.5);
            make.top.equalTo(interest.mas_bottom).offset(2);
        }];
        [commodityName1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.top.equalTo(line.mas_bottom).offset(24);
        }];
        [commodityNameImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(time);
            make.width.equalTo(@4);
            make.height.equalTo(@8);
            make.centerY.equalTo(commodityName1);
        }];
        [commodityName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(commodityName1.mas_right).offset(10);
            make.right.equalTo(commodityNameImage.mas_left).offset(-5);
            make.top.equalTo(commodityName1);
            make.bottom.equalTo(commodityName1);
        }];
        
        [goToBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(commodityName);
            make.right.equalTo(commodityNameImage);
            make.centerY.equalTo(commodityName);
            make.height.equalTo(@44);
        }];
        
        [TotalOrder1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.top.equalTo(commodityName1.mas_bottom).offset(28);
        }];
        [TotalOrder mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(TotalOrder1.mas_right).offset(10);
            make.right.equalTo(time);
            make.top.equalTo(TotalOrder1);
            make.bottom.equalTo(TotalOrder1);
        }];
        [RepaymentDate1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.top.equalTo(TotalOrder1.mas_bottom).offset(26);
            make.bottom.equalTo(back).offset(-20);
        }];
        [RepaymentDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(RepaymentDate1.mas_right).offset(10);
            make.right.equalTo(time);
            make.top.equalTo(RepaymentDate1);
            make.bottom.equalTo(RepaymentDate1);
        }];
        
        //set
        back.backgroundColor = [UIColor whiteColor];
        back.layer.masksToBounds= YES;
        back.layer.cornerRadius = cornerRadius_width;
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        
        goToImage.image = ImageNamed(@"向右蓝色");
        commodityNameImage.image = ImageNamed(@"向右灰色");
        

        name.font = PingFangSC_Regular(11);
        name.textColor = ColorWithHex(0x00000, 0.54);
        time.font = PingFangSC_Regular(11);
        time.textColor = ColorWithHex(0x00000, 0.54);
        
        money.font = PingFangSC_Medium(20);
        money.textColor = ColorWithHex(0x779CF4, 1.0);
        goToLable.font = PingFangSC_Regular(11);
        goToLable.textColor = ColorWithHex(0x779FF6 , 0.87); 
        
        commodityName1.font = PingFangSC_Medium(14);
        commodityName1.textColor = ColorWithHex(0x00000, 0.54);
        commodityName.font = PingFangSC_Regular(14);
        commodityName.textColor = ColorWithHex(0x00000 , 0.87);
        
        TotalOrder1.font = PingFangSC_Medium(14);
        TotalOrder1.textColor = ColorWithHex(0x00000, 0.54);
        TotalOrder.font = PingFangSC_Regular(14);
        TotalOrder.textColor = ColorWithHex(0x00000 , 0.87);
        
        interest.font = PingFangSC_Regular(12);
        interest.textColor = ColorWithHex(0xFB704B, 1.0);
        
        RepaymentDate1.font = PingFangSC_Medium(14);
        RepaymentDate1.textColor = ColorWithHex(0x00000, 0.54);
        RepaymentDate.font = PingFangSC_Regular(14);
        RepaymentDate.textColor = ColorWithHex(0x00000 , 0.87);
        
        commodityName.numberOfLines = 0;
        commodityName.textAlignment = NSTextAlignmentRight;
        TotalOrder.textAlignment = NSTextAlignmentRight;
        RepaymentDate.textAlignment = NSTextAlignmentRight;
        
        name.text = @"本月应还(元）";
        goToLable.text = @"查看分期明细";
        
        commodityName1.text = @"商品名称";
        TotalOrder1.text = @"订单总额";
        RepaymentDate1.text = @"还款日";
        
        self.time = time;
        self.interest =interest;
        self.money = money;
        self.commodityName = commodityName;
        self.TotalOrder = TotalOrder;
        self.RepaymentDate = RepaymentDate;
        [goToBtn addTarget:self action:@selector(goToBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [goToBtn2 addTarget:self action:@selector(goToBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        goToBtn.tag = list_myStageThisMonthCell_enum;
        goToBtn2.tag = detail_myStageThisMonthCell_enum;
        //test
//        time.text = @"／12期";
//        currentTime.text = @"12";
//        money.text = @"420.00";
//        
//
//        
//        commodityName.text = @"芽庄游览滨海芽庄游览滨海沙大学生毕业季沙大学生毕业季";
//        TotalOrder.text = @"2533.00元";
//        RepaymentDate.text = @"2017-04-12";
        
    }
    return self;
}


- (void)setDate:(myStageHomeListForOne *)date{
    if (date) {
        _date = date;
        if (date.idx && [date.idx rangeOfString:@"/"].location != NSNotFound) {
            NSRange range = [date.idx rangeOfString:@"/"];
            NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:date.idx];
            NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(11),NSFontAttributeName,ColorWithHex(0x779FF6, 1.0),NSForegroundColorAttributeName, nil];
            [attri setAttributes:dic1 range:NSMakeRange(0, range.location)];
            
            NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(11),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
            [attri setAttributes:dic2 range:NSMakeRange(range.location,date.idx.length-range.location)];
            self.time.attributedText = attri;
        }
        self.interest.text = date.interest;
        self.money.text = date.periodRepayment;
        self.commodityName.text = date.travelName;
        self.TotalOrder.text = [NSString stringWithFormat:@"%@元",date.amount];
        self.RepaymentDate.text = date.repaymentDate;
    }
}

- (void)goToBtnClick:(UIButton *)sender{
    if (self.goToViewstaues) {
        self.goToViewstaues(self.date,sender.tag);
    }
}
@end
