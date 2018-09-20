//
//  myOreserFiveGOyouCell.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOreserFiveGOyouCell.h"



@interface myOreserFiveGOyouCell ()
@property (nonatomic,weak)UILabel *oederNum;
@property (nonatomic,weak)UILabel *staue;
@property (nonatomic,weak)UIImageView *iamgee;
@property (nonatomic,weak)UILabel *title;
@property (nonatomic,weak)UILabel *des;
@property (nonatomic,weak)UILabel *price;


@end

@implementation myOreserFiveGOyouCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myOreserFiveGOyouCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myOreserFiveGOyouCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
//        self.backgroundColor = [UIColor greenColor];
        UIView *view1 = [[UIView alloc]init];
        view1.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
//        view1.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:view1];
        
        UIView *view2 = [[UIView alloc]init];
        self.view1  =view1;
        self.view2  =view2;
//        view2.backgroundColor = [UIColor yellowColor];
        view2.backgroundColor = ColorWithHex(0xFAFAFA, 1.0);
        [self.contentView addSubview:view2];
        
        UILabel *oederNum1 = [[UILabel alloc]init];
        [self.contentView addSubview:oederNum1];
        
        UILabel *oederNum = [[UILabel alloc]init];
        [self.contentView addSubview:oederNum];
        
        UILabel *staue = [[UILabel alloc]init];
        [self.contentView addSubview:staue];
        
        UIImageView *iamgee = [[UIImageView alloc]init];
        [self.contentView addSubview:iamgee];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *des = [[UILabel alloc]init];
        [self.contentView addSubview:des];
       
        UILabel *price = [[UILabel alloc]init];
        [self.contentView addSubview:price];
        
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@(149));
        }];
        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1);
            make.right.equalTo(view1);
            make.top.equalTo(view1).offset(44);
            make.height.equalTo(@(90));
        }];
        [oederNum1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1).offset(15);
            make.top.equalTo(view1);
            make.bottom.equalTo(view2.mas_top);
        }];
        [oederNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(oederNum1.mas_right).offset(5);
            make.top.equalTo(view1);
            make.bottom.equalTo(view2.mas_top);
        }];
        [staue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view1).offset(-15);
            make.top.equalTo(view1);
            make.bottom.equalTo(view2.mas_top);
        }];

        [iamgee mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view2).offset(15);
            make.bottom.equalTo(view2).offset(-15);
            make.top.equalTo(view2).offset(15);
            make.width.equalTo(@(90));
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iamgee.mas_right).offset(15);
            make.right.equalTo(view2).offset(-15);
            make.top.equalTo(iamgee).offset(0);
           // make.height.equalTo(@(90-12-30-5));
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.top.equalTo(title.mas_bottom).offset(0);
            make.bottom.equalTo(iamgee);
        }];
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view2).offset(-15);
            make.centerY.equalTo(des);
        }];
        //set
        title.numberOfLines = 2;
        oederNum1.text = @"订单编号：";
        self.oederNum = oederNum;
        self.staue = staue;
        self.iamgee = iamgee;
        self.title = title;
        self.des = des;
        self.price = price;
        IMAGEsetCONTENTMODE(iamgee);
        oederNum1.textColor = ColorWithHex(0x000000, 0.54);
        oederNum1.font = PingFangSC_Regular(12);
        oederNum.textColor = ColorWithHex(0x000000, 0.54);
        oederNum.font = PingFangSC_Regular(12);
        staue.textColor = ColorWithHex(0xFB704B, 1.0);
        staue.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x000000, 0.7);
        title.font = PingFangSC_Regular(14);
        des.textColor = ColorWithHex(0x000000, 0.54);
        des.font = PingFangSC_Regular(12);
        price.textColor = ColorWithHex(0x000000, 0.7);
        price.font = PingFangSC_Regular(14);
        //test
//        oederNum.text = @"123456789010";
//        staue.text = @"123456789010";
//        title.text = @"123456789010";
//        des.text = @"123456789010";
//        price.text = @"123456789010";
//        iamgee.image = ImageNamed(@"456");
    }
    return self;
}
- (void)setDatess:(orderlistForOneS *)datess{
    _datess = datess;
    if (datess) {
        self.staue.text = datess.orderStatusCh;
        [self.iamgee sd_setImageWithURL:[NSURL URLWithString:datess.travelInfoD.image] placeholderImage:ImageNamed(IMAGE_bigBack)];
        self.title.text = datess.travelInfoD.name;
        self.oederNum.text = datess.sn;
        self.des.text = datess.quantityInfo;
        if (datess.travelInfoD.isPeriod && ![datess.periodNum isEqualToString:NoStagingString]) {
            self.price.text = [NSString stringWithFormat:@"首期应付：%@",datess.amountPayableStr];
        } else {
            self.price.text = [NSString stringWithFormat:@"¥%.2f",datess.totalPrice];
        }
    }
}
@end
