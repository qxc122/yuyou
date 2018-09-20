//
//  ordermyOreserDetailCell.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "ordermyOreserDetailCell.h"

@interface ordermyOreserDetailCell ()
@property (nonatomic,weak) UILabel *orderNum;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *people;
@property (nonatomic,weak) UILabel *price;
@property (nonatomic,weak) UILabel *youhui;
@property (nonatomic,weak) UILabel *youhui1;
@property (nonatomic,weak) UILabel *payPrice;
@property (nonatomic,weak) UILabel *discount;
@property (nonatomic,weak) UILabel *payPrice1;

@end

@implementation ordermyOreserDetailCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    ordermyOreserDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[ordermyOreserDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *line =[[UIView alloc]init];
        [self.contentView addSubview:line];
        
        UILabel *orderNum1 =[[UILabel alloc]init];
        [self.contentView addSubview:orderNum1];
        
        UILabel *name1 =[[UILabel alloc]init];
        [self.contentView addSubview:name1];
        
        UILabel *people1 =[[UILabel alloc]init];
        [self.contentView addSubview:people1];
        
        UILabel *price1 =[[UILabel alloc]init];
        [self.contentView addSubview:price1];
        
        UILabel *youhui1 =[[UILabel alloc]init];
        [self.contentView addSubview:youhui1];
        
        UILabel *payPrice1 =[[UILabel alloc]init];
        [self.contentView addSubview:payPrice1];
        UILabel *discount1 =[[UILabel alloc]init];
        [self.contentView addSubview:discount1];
        UILabel *discount =[[UILabel alloc]init];
        [self.contentView addSubview:discount];
        
        
        UILabel *orderNum =[[UILabel alloc]init];
        [self.contentView addSubview:orderNum];
        
        UILabel *name =[[UILabel alloc]init];
        [self.contentView addSubview:name];
        
        UILabel *people =[[UILabel alloc]init];
        [self.contentView addSubview:people];
        
        UILabel *price =[[UILabel alloc]init];
        [self.contentView addSubview:price];
        
        UILabel *youhui =[[UILabel alloc]init];
        [self.contentView addSubview:youhui];
        
        UILabel *payPrice =[[UILabel alloc]init];
        [self.contentView addSubview:payPrice];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
        [orderNum1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(line.mas_bottom).offset(17);
            make.width.equalTo(@[name1,people1,price1]);
        }];
        [name1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(orderNum1.mas_bottom).offset(20);
        }];
        [people1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(name1.mas_bottom).offset(20);
        }];
        [price1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(people1.mas_bottom).offset(20);
//            make.bottom.equalTo(self.contentView).offset(-17);
        }];
        [youhui1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(price1.mas_bottom).offset(20);
        }];
        [discount1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(youhui1.mas_bottom).offset(20);
        }];
        
        [payPrice1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(discount1.mas_bottom).offset(20);
            make.bottom.equalTo(self.contentView).offset(-17);
        }];
        
        [orderNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum1.mas_right).offset(20);
            make.centerY.equalTo(orderNum1);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum);
            make.centerY.equalTo(name1);
        }];
        
        [people mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum);
            make.centerY.equalTo(people1);
        }];
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum);
            make.centerY.equalTo(price1);
        }];
        [youhui mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum);
            make.centerY.equalTo(youhui1);
        }];
        [discount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum);
            make.centerY.equalTo(discount1);
        }];
        
        [payPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum);
            make.centerY.equalTo(payPrice1);
        }];
        //set
        line.backgroundColor  =ColorWithHex(0x000000, 0.4);
        orderNum1.textColor = ColorWithHex(0x000000, 0.53);
        orderNum1.font = PingFangSC_Regular(14);
        orderNum.textColor = ColorWithHex(0x000000, 0.87);
        orderNum.font = PingFangSC_Regular(14);

        name1.textColor = ColorWithHex(0x000000, 0.53);
        name1.font = PingFangSC_Regular(14);
        name.textColor = ColorWithHex(0x000000, 0.87);
        name.font = PingFangSC_Regular(14);
        
        people1.textColor = ColorWithHex(0x000000, 0.53);
        people1.font = PingFangSC_Regular(14);
        people.textColor = ColorWithHex(0x000000, 0.87);
        people.font = PingFangSC_Regular(14);
        
        discount1.textColor = ColorWithHex(0x000000, 0.53);
        discount1.font = PingFangSC_Regular(14);
        discount.textColor = ColorWithHex(0x000000, 0.87);
        discount.font = PingFangSC_Regular(14);
        
        price1.textColor = ColorWithHex(0x000000, 0.53);
        price1.font = PingFangSC_Regular(14);
        price.textColor = ColorWithHex(0x000000, 0.87);
        price.font = PingFangSC_Regular(14);
        
        [youhui1 settextColorhex:0x000000 alpa:0.53 font:PingFangSC_Regular(14)];
        [youhui settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];
        
        [payPrice1 settextColorhex:0x000000 alpa:0.53 font:PingFangSC_Regular(14)];
        [payPrice settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];

        orderNum1.text = @"订单号";
        name1.text = @"旅行社";
        people1.text = @"参团人数";
        price1.text = @"商品金额";
        discount1.text = @"活动优惠";
        
        youhui1.text = @"礼券金额";
//        payPrice1.text = @"支付金额";
        self.orderNum  =orderNum;
        self.youhui1 = youhui1;
        self.name  =name;
        self.people  =people;
        self.price  =price;
        self.youhui  =youhui;
        self.payPrice  =payPrice;
        self.payPrice1  =payPrice1;
        self.discount  =discount;
        //test
//        discount.text = @"sdf";
//        orderNum.text = @"1253";
//        name.text = @"1223";
//        people.text = @"123123";
//        price.text = @"123";
//        youhui.text = @"礼券金额";
//        payPrice.text = @"支付金额";
//        payPrice1.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (void)setDetail:(orderDeatailS *)detail{
    _detail = detail;
    if (detail) {
        self.orderNum.text = detail.orderD.sn;
        self.name.text = detail.company;

        if (detail.couponDiscount && detail.couponDiscount.length) {
            self.youhui.text = detail.couponDiscount;
        }else{
            self.youhui.text = @"无";

        }
        if (detail.discount && detail.discount.length) {
            self.discount.text = detail.discount;
        }else{
            self.discount.text = @"无";
        }
        
//        self.youhui.backgroundColor = [UIColor redColor];
//        self.youhui1.backgroundColor = [UIColor redColor];
        if (detail.orderD.travelInfoD.isPeriod && ![detail.orderD.periodNum isEqualToString:NoStagingString]) {
            self.payPrice1.text = @"首期应付";
        } else {
            self.payPrice1.text = @"支付金额";
        }
        

        self.payPrice.text = detail.orderD.amountPayableStr;
        self.people.text = detail.orderD.quantityInfo;
        self.price.text = detail.orderD.amountInfo;
    }
}
@end
