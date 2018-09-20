//
//  myCardBankCell.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myCardBankCell.h"


@interface myCardBankCell ()
@property (nonatomic,weak) UILabel *bankName;
@property (nonatomic,weak) UILabel *type;
@property (nonatomic,weak) UILabel *cardNumber;
@property (nonatomic,weak) UIImageView *CardLogo;
@end

@implementation myCardBankCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myCardBankCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myCardBankCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *iconCard = [[UIImageView alloc]init];
        [self.contentView addSubview:iconCard];
        
        UIView *CardLogoBack = [[UIView alloc]init];
        [self.contentView addSubview:CardLogoBack];
        
        UIImageView *CardLogo = [[UIImageView alloc]init];
        [self.contentView addSubview:CardLogo];
        
        UILabel *bankName = [[UILabel alloc]init];
        [self.contentView addSubview:bankName];
        
        UILabel *type = [[UILabel alloc]init];
        [self.contentView addSubview:type];
        
        UILabel *cardNumber = [[UILabel alloc]init];
        [self.contentView addSubview:cardNumber];
        
        [iconCard mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(-15);
            make.height.equalTo(@(120));
        }];
        
        [CardLogoBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconCard).offset(16);
            make.top.equalTo(iconCard).offset(16);
            make.width.equalTo(@34);
            make.height.equalTo(@34);
        }];
        [CardLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(CardLogoBack);
            make.centerY.equalTo(CardLogoBack);
            make.width.equalTo(@30);
            make.height.equalTo(@30);
        }];
        
        [bankName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(CardLogoBack);
            make.left.equalTo(CardLogoBack.mas_right).offset(16);
            make.right.equalTo(iconCard);
        }];
        [type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bankName.mas_bottom).offset(10);
            make.right.equalTo(bankName);
            make.left.equalTo(bankName);
        }];
        [cardNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(type.mas_bottom).offset(29);
            make.bottom.equalTo(iconCard.mas_bottom).offset(-15);
            make.right.equalTo(bankName);
            make.left.equalTo(bankName);
        }];
        
        //set
        self.cardNumber  =cardNumber;
        self.type  =type;
        self.bankName  =bankName;
        self.CardLogo  =CardLogo;
        
        bankName.font = PingFangSC_Regular(17);
        bankName.textColor = ColorWithHex(0xFFFFFF, 1.0);
        type.font = PingFangSC_Regular(14);
        type.textColor = ColorWithHex(0xFFFFFF, 1.0);
        cardNumber.font = PingFangSC_Regular(20);
        cardNumber.textColor = ColorWithHex(0xFFFFFF, 1.0);
        CardLogoBack.backgroundColor = ColorWithHex(0xFFFFFF, 0.5);
        CardLogoBack.layer.cornerRadius = 34/2.0;
        CardLogoBack.layer.masksToBounds = YES;
        
        
        iconCard.image = ImageNamed(IMAGE_NavcBack);
        iconCard.layer.cornerRadius = cornerRadius_width;
        iconCard.layer.masksToBounds = YES;
        
        //tset
//        CardLogo.image = ImageNamed(@"个人信息MYYY");
//        cardNumber.text = @"**** **** **** 0542";
//        type.text = @"储蓄卡";
//        bankName.text = @"中国银行";
        
    }
    return self;
}
- (void)setDate:(BindBankCard *)date{
    if (date) {
        _date = date;
        self.cardNumber.text  =date.bankCardNo;
        self.type.text  =date.bankCardType;
        self.bankName.text  =date.bankName;
        [self.CardLogo sd_setImageWithURL:[NSURL URLWithString:date.bankLogo] placeholderImage:ImageNamed(IMAGE_bigBack)];
    }
}
@end
