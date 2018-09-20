//
//  chuXingrenCell.m
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "chuXingrenCell.h"

@interface chuXingrenCell ()
@property (nonatomic,weak) UILabel *cardNumber;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *cardType;
@property (nonatomic,weak) UILabel *Num;
@end

@implementation chuXingrenCell

+ (instancetype)returnCellWith:(UITableView *)tableView
{
    chuXingrenCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[chuXingrenCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
        
        UIView *backTop = [[UIView alloc]init];
        backTop.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        [self.contentView addSubview:backTop];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = ColorWithHex(0x979797, 0.40);
        [self.contentView addSubview:line];
        
        UILabel *name1 = [[UILabel alloc]init];
        [self.contentView addSubview:name1];
        
        UILabel *name = [[UILabel alloc]init];
        self.name = name;
        [self.contentView addSubview:name];

        UILabel *cardType = [[UILabel alloc]init];
        self.cardType = cardType;
        [self.contentView addSubview:cardType];
        
        UILabel *cardNumber = [[UILabel alloc]init];
        self.cardNumber = cardNumber;
        [self.contentView addSubview:cardNumber];
        
        UIButton *btnDele = [[UIButton alloc]init];
        [self.contentView addSubview:btnDele];
        
        UIImageView *backNum = [[UIImageView alloc]init];
        [self.contentView addSubview:backNum];
        
        UILabel *Num = [[UILabel alloc]init];
        self.Num = Num;
        [self.contentView addSubview:Num];
        
        [backNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.top.equalTo(back);
            make.height.equalTo(@(21));
            make.width.equalTo(@(21));
        }];
        [Num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backNum).offset(3);
            make.right.equalTo(backNum);
            make.bottom.equalTo(backNum).offset(-7);
            make.top.equalTo(backNum);
        }];
        [backTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(-cornerRadius_width);
            make.height.equalTo(@(2*cornerRadius_width));
        }];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(0);
            make.bottom.equalTo(self.contentView).offset(0);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.right.equalTo(back);
            make.top.equalTo(back);
            make.height.equalTo(@(0.5));
        }];
        
        [name1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.width.equalTo(@(60));
            make.top.equalTo(line.mas_bottom).offset(18);
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cardType.mas_right).offset(16);
            make.right.equalTo(btnDele.mas_left).offset(-10);
            make.top.equalTo(name1);
            make.bottom.equalTo(name1);
        }];
        [cardType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name1).offset(0);
            make.centerY.equalTo(cardNumber);
            make.width.equalTo(@(60));
        }];
        [cardNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cardType.mas_right).offset(16);
            make.right.equalTo(btnDele.mas_left).offset(-10);
            make.top.equalTo(name1.mas_bottom).offset(15);
            make.bottom.equalTo(back).offset(-20);
        }];
        [btnDele mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cardNumber);
            make.right.equalTo(back).offset(-15);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        
        //set
        name1.text = @"姓名";
        name1.textColor  =ColorWithHex(0x000000, 0.87);
        name1.font = PingFangSC_Regular(14);
        
        backNum.image = ImageNamed(@"chuxirennum");
        [btnDele setImage:ImageNamed(@"删除常用人") forState:UIControlStateNormal];
        name.textColor  =ColorWithHex(0x000000, 0.87);
        [btnDele addTarget:self action:@selector(btnDeleClick:) forControlEvents:UIControlEventTouchUpInside];
        name.font = PingFangSC_Regular(14);
        cardType.textColor  =ColorWithHex(0x000000, 0.87);
        cardType.font = PingFangSC_Regular(14);
        cardNumber.textColor  =ColorWithHex(0x000000, 0.87);
        cardNumber.font = PingFangSC_Regular(14);
        Num.textColor  =ColorWithHex(0xFFFFFF, 1.0);
        Num.font = PingFangSC_Regular(10);
//        Num.textAlignment = NSTextAlignmentCenter; NSTextAlignmentLeft
        name.numberOfLines = 0;
        cardNumber.numberOfLines = 0;
        //test
//        name.text = @"XIANG/JIA";
        //cardType.text = @"证件号码";
//        cardNumber.text = @"E37389133";
    }
    return self;
}
- (void)setIndex:(NSInteger)index{
    _index = index;
    self.Num.text = [NSString stringWithFormat:@"%ld",(index+1)];
}
- (void)btnDeleClick:(UIButton *)btn{
    if (self.btnDeleClick) {
        self.btnDeleClick(self.index);
    }
}
- (void)setPeopleOne:(travellerS *)peopleOne{
    _peopleOne = peopleOne;
    if ([peopleOne.idType isEqualToString:GUOJIHUzhao]) {
        self.cardType.text = @"护照";
        self.cardNumber.text = peopleOne.passportNumber;
        self.name.text = [NSString stringWithFormat:@"%@／%@",peopleOne.firstname,peopleOne.lastname];
    }else if ([peopleOne.idType isEqualToString:SFZ]){
        self.cardType.text = @"身份证";
        self.name.text = peopleOne.realname;
        self.cardNumber.text = peopleOne.idNumber;
    }
    
    
}
@end
