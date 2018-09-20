//
//  TransactionDetailsCell.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TransactionDetailsCell.h"


@interface TransactionDetailsCell ()
@property (nonatomic,weak) UILabel *money;
@property (nonatomic,weak) UILabel *type;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *orderNumber;
@property (nonatomic,weak) UILabel *des;
//@property (nonatomic,weak) UILabel *desTwo;
@end

@implementation TransactionDetailsCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    TransactionDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[TransactionDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *money = [UILabel new];
        [self.contentView addSubview:money];
        
        UILabel *title = [UILabel new];
        [self.contentView addSubview:title];
        
        UIView *line = [UIView new];
        [self.contentView addSubview:line];
        
        UILabel *type1 = [UILabel new];
        [self.contentView addSubview:type1];
        
        
        UILabel *time1 = [UILabel new];
        [self.contentView addSubview:time1];
        
        UILabel *type = [UILabel new];
        [self.contentView addSubview:type];
        
        UILabel *time = [UILabel new];
        [self.contentView addSubview:time];
        
        UILabel *orderNumber1 = [UILabel new];
        [self.contentView addSubview:orderNumber1];
        
        UILabel *orderNumber = [UILabel new];
        [self.contentView addSubview:orderNumber];
        
        UILabel *des1 = [UILabel new];
        [self.contentView addSubview:des1];
        
        UILabel *des = [UILabel new];
        [self.contentView addSubview:des];
        
//        UILabel *desTwo = [UILabel new];
//        [self.contentView addSubview:desTwo];
        
        
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(50);
            make.height.equalTo(@36);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(money.mas_bottom).offset(12);
            make.height.equalTo(@12);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(title.mas_bottom).offset(40);
            make.height.equalTo(@0.5);
        }];
        [type1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(16);
            make.top.equalTo(line.mas_bottom).offset(21);
            make.height.equalTo(@14);
        }];
        [type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(type1.mas_right).offset(42);
            make.right.equalTo(self.contentView).offset(-14);
            make.centerY.equalTo(type1);
            make.height.equalTo(@14);
        }];
        [time1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(type1);
            make.top.equalTo(type1.mas_bottom).offset(26);
            make.height.equalTo(@14);
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(time1.mas_right).offset(42);
            make.right.equalTo(type);
            make.centerY.equalTo(time1);
            make.height.equalTo(@14);
        }];
        [orderNumber1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(type1);
            make.top.equalTo(time1.mas_bottom).offset(26);
            make.height.equalTo(@14);
        }];
        [orderNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNumber1.mas_right).offset(20);
            make.right.equalTo(type);
            make.centerY.equalTo(orderNumber1);
            make.height.equalTo(@14);
        }];
        [des1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(type1);
            make.width.equalTo(@60);
            make.top.equalTo(orderNumber1.mas_bottom).offset(26);
            make.height.equalTo(@14);
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(des1.mas_right).offset(20);
            make.right.equalTo(type);
            make.top.equalTo(des1);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
//        [desTwo mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(des1.mas_right).offset(42);
//            make.right.equalTo(type);
//             make.top.equalTo(des1.mas_bottom).offset(10);
//        }];
        //set

        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        money.font = PingFangSC_Medium(36);
        money.textColor = ColorWithHex(0x779CF4, 1.0); 
        
        title.font = PingFangSC_Regular(12);
        title.textColor = ColorWithHex(0x779CF4, 1.0);
        
        type1.font = PingFangSC_Regular(14);
        type1.textColor = ColorWithHex(0x00000, 0.54);
        time1.font = PingFangSC_Regular(14);
        time1.textColor = ColorWithHex(0x00000, 0.54);
        orderNumber1.font = PingFangSC_Regular(14);
        orderNumber1.textColor = ColorWithHex(0x00000, 0.54);
        des1.font = PingFangSC_Regular(14);
        des1.textColor = ColorWithHex(0x00000, 0.54);
        
        type.font = PingFangSC_Regular(14);
        type.textColor = ColorWithHex(0x00000, 0.87);
        time.font = PingFangSC_Regular(14);
        time.textColor = ColorWithHex(0x00000, 0.87);
        orderNumber.font = PingFangSC_Regular(14);
        orderNumber.textColor = ColorWithHex(0x00000, 0.87);
        des.font = PingFangSC_Regular(14);
        des.textColor = ColorWithHex(0x00000, 0.87);
//        desTwo.font = PingFangSC_Regular(14);
//        desTwo.textColor = ColorWithHex(0x00000, 0.87);
        
        
        type.textAlignment = NSTextAlignmentRight;
        time.textAlignment = NSTextAlignmentRight;
        orderNumber.textAlignment = NSTextAlignmentRight;
        des.textAlignment = NSTextAlignmentRight;
        des.numberOfLines = 0;
//        desTwo.textAlignment = NSTextAlignmentRight;
        
        title.text = @"还款成功";
        type1.text = @"付款方式";
        time1.text = @"还款时间";
        orderNumber1.text = @"交易流水号";
        des1.text = @"还款说明";
        
        self.money  =money;
        self.type  =type;
        self.time  =time;
        self.orderNumber  =orderNumber;
        self.des  =des;
//        self.desTwo  =desTwo;
        //test
//        money.text = @"840.00";
//        type.text = @"微信支付";
//        time.text = @"2017-04-10";
//        orderNumber.text = @"123456789";
//        des.text = @"[01期账单]芽庄4天5晚滨海游毕业旅行...";
//        desTwo.text = @"[01期账单]芽庄毕业旅行";
        
    }
    return self;
}
- (void)setDate:(rePaymentInfoAllForONeS *)date{
    if (date) {
        _date =date;
        self.money.text  =[NSString stringWithFormat:@"%@",date.amount];
        self.type.text   =date.paymentMethod;
        self.time.text   =date.paymentDate;
        self.orderNumber.text   =date.sn;
//        date.introduces = [@[@"我是一个sdfsdfsfsdfsdsdfsdf",@"我是一个sdfsdfsfsdfsdsdfsdf",@"我是一个sdfsdfsfsdfsdsdfsdf"] mutableCopy];
        if (date.introduces.count) {
            NSString *all = @"";
            NSInteger allNum = 0;
            for (NSString *str in date.introduces) {
                if (str && str.length) {
                    all = [all stringByAppendingString:str];
                    if (allNum < (date.introduces.count-1)) {
                        all = [all stringByAppendingString:@"\n"];
                    }
                }
                allNum ++;
            }
            self.des.text =all;
        } else {
            self.des.text = @"无";
        }
//        self.des.backgroundColor = [UIColor redColor];
    }
}
@end
