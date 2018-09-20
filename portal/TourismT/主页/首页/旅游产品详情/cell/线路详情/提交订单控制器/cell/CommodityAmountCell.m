//
//  CommodityAmountCell.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "CommodityAmountCell.h"



@interface CommodityAmountCell ()



@end

@implementation CommodityAmountCell

+ (instancetype)returnCellWith:(UITableView *)tableView
{
    CommodityAmountCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[CommodityAmountCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        UILabel *title1 = [[UILabel alloc]init];
        [self.contentView addSubview:title1];
        UIView *line1 = [[UIView alloc]init];
        [self.contentView addSubview:line1];
        
        UILabel *Adult = [[UILabel alloc]init];
        [self.contentView addSubview:Adult];

        UILabel *AdultPrice = [[UILabel alloc]init];
        [self.contentView addSubview:AdultPrice];
        
        UILabel *AdultNum = [[UILabel alloc]init];
        [self.contentView addSubview:AdultNum ];

        UIView *line2 = [[UIView alloc]init];
        [self.contentView addSubview:line2];

        [title1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title2);
            make.right.equalTo(self.title2);
            make.top.equalTo(self.contentView).offset(30);
            make.height.equalTo(@14);
        }];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.top.equalTo(title1.mas_bottom).offset(16);
            make.height.equalTo(@[line2,@0.5]);
        }];
//        [Adult mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.back).offset(15);
//            make.centerY.equalTo(AdultPrice);
//            make.width.equalTo(@30);
//        }];
//        [AdultPrice mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(Adult.mas_right).offset(20);
//            make.top.equalTo(line1.mas_bottom).offset(16);
//        }];
//        [AdultNum mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(AdultPrice.mas_right).offset(10);
//            make.right.equalTo(self.back).offset(-14);
//            make.centerY.equalTo(AdultPrice);
//            make.width.equalTo(@50);
//        }];
        [Adult mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1);
//            make.top.equalTo(line1.mas_bottom).offset(15);
            
            make.centerY.equalTo(AdultPrice);
            make.width.equalTo(@30);
        }];
        [AdultPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(Adult.mas_right).offset(20);
            make.top.equalTo(line1.mas_bottom).offset(15);
        }];
        [AdultNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.title2);
            make.left.equalTo(AdultPrice.mas_right).offset(5);
            make.centerY.equalTo(AdultPrice);
            make.width.equalTo(@50);
        }];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.top.equalTo(AdultPrice.mas_bottom).offset(16);
        }];
        
        [self.title2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(30);
            make.right.equalTo(self.contentView).offset(-30);
            make.top.equalTo(line2.mas_bottom).offset(19);
            make.height.equalTo(@14);
        }];
        
        line1.backgroundColor = ColorWithHex(0x979797, 0.4);
        line2.backgroundColor = ColorWithHex(0x979797, 0.4);

        AdultNum.textAlignment = NSTextAlignmentRight;
        self.Adult = Adult;
        self.line2 = line2;
        self.AdultNum = AdultNum;
        self.AdultPrice = AdultPrice;

//        AdultPrice.backgroundColor = [UIColor redColor];
        //set
        title1.font = PingFangSC_Regular(14);
        title1.textColor  =ColorWithHex(0x000000, 0.87);
        
        Adult.font = PingFangSC_Regular(14);
        Adult.textColor  =ColorWithHex(0x000000, 0.87);
        AdultPrice.font = PingFangSC_Regular(14);
        AdultPrice.textColor  =ColorWithHex(0x000000, 0.87);
        AdultNum.font = PingFangSC_Regular(14);
        AdultNum.textColor  =ColorWithHex(0x000000, 0.87);
        line1.backgroundColor = ColorWithHex(0x979797, 0.4);
        line2.backgroundColor = ColorWithHex(0x979797, 0.4);
        AdultPrice.numberOfLines = 0;
        title1.text = @"商品金额";

        //test
//        Adult.text = @"成人";
//        AdultPrice.text = @"首府asfdasdfa";
//        AdultNum.text = @"*2人";
    }
    return self;
}
- (void)setOrderinfoData:(orderInfo *)orderinfoData{
    if (orderinfoData) {
        [super setOrderinfoData:orderinfoData];
        if (orderinfoData.adultPrice && orderinfoData.adultPrice.length && orderinfoData.adultNum && orderinfoData.adultNum.length) {
            self.Adult.text = @"成人";
            self.AdultPrice.text = orderinfoData.adultPrice;
            self.AdultNum.text = orderinfoData.adultNum;
        }else if (orderinfoData.childPrice && orderinfoData.childPrice.length && orderinfoData.childNum && orderinfoData.childNum.length){
            self.Adult.text = @"儿童";
            self.AdultPrice.text = orderinfoData.childPrice;
            self.AdultNum.text = orderinfoData.childNum;
        }
//        moneyAll.text = @"订单金额：0.00";
//        self.moneyAll.text = [NSString stringWithFormat:@"订单金额：%.2f",[orderinfoData.amount doubleValue]];
        
        
//        if (orderinfoData.discount && orderinfoData.discount.length) {
//            self.youhui.highlighted = NO;
//            self.youhui.text = orderinfoData.discount;
//        }else{
//            self.youhui.highlighted = YES;
//            self.youhui.text = @"无";
//        }

    }
}


@end
