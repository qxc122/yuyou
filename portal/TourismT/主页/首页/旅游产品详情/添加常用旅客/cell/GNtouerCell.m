//
//  GNtouerCell.m
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "GNtouerCell.h"

typedef NS_ENUM(NSInteger, TextField_TYPE_ENMU)
{
    name_TextField_TYPE_ENMU,//名字输入框
    card_TextField_TYPE_ENMU,//身份证输入框
};

@interface GNtouerCell ()<UITextFieldDelegate>
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UITextField *nameInput;
@property (nonatomic,weak) UITextField *cardTypeInput;
@property (nonatomic,weak) UILabel *cardType;
@property (nonatomic,weak) UIButton *btnUser;
@property (nonatomic,weak) UIButton *xuanZhe;
@end

@implementation GNtouerCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    GNtouerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[GNtouerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.bottom.equalTo(self);
            make.top.equalTo(self).offset(15);
        }];
        
        UIView *lineOne = [[UIView alloc]init];
        lineOne.backgroundColor = ColorWithHex(0x979797, 0.4);
        [self.contentView addSubview:lineOne];
        [lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(0);
            make.right.equalTo(back).offset(0);
            make.top.equalTo(back).offset(49);
            make.height.equalTo(@(0.5));
        }];
        
        UIView *lineTwo = [[UIView alloc]init];
        lineTwo.backgroundColor = ColorWithHex(0x979797, 0.4);
        [self.contentView addSubview:lineTwo];
        [lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(0);
            make.right.equalTo(back).offset(0);
            make.top.equalTo(lineOne.mas_bottom).offset(49);
            make.height.equalTo(@(0.5));
        }];

        UILabel *name = [[UILabel alloc]init];
        [self.contentView addSubview:name];

        UITextField *nameInput = [[UITextField alloc]init];
        nameInput.tag = name_TextField_TYPE_ENMU;
        [self.contentView addSubview:nameInput];
        
        UILabel *cardType = [[UILabel alloc]init];
        [self.contentView addSubview:cardType];
        
        UIButton *xuanZhe = [[UIButton alloc]init];
        self.xuanZhe = xuanZhe;
        [self.contentView addSubview:xuanZhe];
        
        UITextField *cardTypeInput = [[UITextField alloc]init];
        cardTypeInput.tag = card_TextField_TYPE_ENMU;
        [self.contentView addSubview:cardTypeInput];
        
        UILabel *des = [[UILabel alloc]init];
        [self.contentView addSubview:des];
        
        UIButton *btnUser = [[UIButton alloc]init];
        self.btnUser = btnUser;
        [self.contentView addSubview:btnUser];
        
        self.name = name;
        self.nameInput = nameInput;
        self.cardTypeInput = cardTypeInput;
        self.nameInput.delegate = self;
        self.cardTypeInput.delegate = self;
        

        
        
        self.cardType = cardType;
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.bottom.equalTo(lineOne.mas_top);
            make.top.equalTo(back);
        }];
        [nameInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(88);
            make.bottom.equalTo(lineOne.mas_top);
            make.top.equalTo(back);
            make.right.equalTo(cardTypeInput).offset(0);
        }];
        [cardType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.bottom.equalTo(lineTwo.mas_top);
            make.top.equalTo(lineOne.mas_bottom);
        }];
        
        [xuanZhe mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cardTypeInput.mas_left).offset(15);
            make.centerY.equalTo(cardTypeInput);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        
        [cardTypeInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(88);
            make.right.equalTo(back).offset(-15);
            make.bottom.equalTo(cardType);
            make.top.equalTo(cardType);
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.bottom.equalTo(back);
            make.top.equalTo(lineTwo.mas_bottom);
        }];
        [btnUser mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(des.mas_right).offset(0);
            make.centerY.equalTo(des);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        
        //set
        [cardTypeInput addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [nameInput addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        [xuanZhe setImage:ImageNamed(@"剑头下") forState:UIControlStateNormal];
        [xuanZhe addTarget:self action:@selector(xuanZheClick:) forControlEvents:UIControlEventTouchUpInside];
        name.font = PingFangSC_Regular(14);
        name.textColor = ColorWithHex(0x000000, 0.53);
        nameInput.font = PingFangSC_Regular(14);
        nameInput.textColor = ColorWithHex(0x000000, 1.0);
        cardType.font = PingFangSC_Regular(14);
        cardType.textColor = ColorWithHex(0x000000, 0.53);
        cardTypeInput.font = PingFangSC_Regular(14);
        cardTypeInput.textColor = ColorWithHex(0x000000, 1.0);
        des.font = PingFangSC_Regular(14);
        des.textColor = ColorWithHex(0x000000, 0.53);
        des.text = @"设为默认常用旅客";
        name.text = @"名字";
        cardType.text = @"身份证";
        nameInput.placeholder = @"如:张三";
        cardTypeInput.placeholder = @"18位身份证号";
        [self.nameInput setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.cardTypeInput setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        btnUser.imageEdgeInsets = UIEdgeInsetsMake(14, 14, 14, 14);
        [btnUser setImage:ImageNamed(@"选择框空心") forState:UIControlStateNormal];
        [btnUser setImage:ImageNamed(@"选中") forState:UIControlStateHighlighted];
        [btnUser setImage:ImageNamed(@"选中") forState:UIControlStateSelected];
        [btnUser addTarget:self action:@selector(btnUserClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}
- (void)btnUserClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    self.peopleOne.isDefault = sender.selected;
    if (self.FillIn) {
        self.FillIn(self.peopleOne);
    }
}
- (void)xuanZheClick:(UIButton *)sender{
    NSLog(@"%s",__FUNCTION__);
    if (self.reload) {
        self.reload();
    }
    
}

- (void)setType:(card_ENMU)type{
    _type = type;
    if (type == ID_card_ENMU) {
        self.cardType.text = @"身份证";
    } else if (type == OTHER_card_ENMU){
        self.cardType.text = @"其他";
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{
    NSUInteger length = textField.text.length + string.length;
    
    if (textField.tag == name_TextField_TYPE_ENMU) {
//        if (length > 15) {
//            [textField resignFirstResponder];
//            [MBProgressHUD showPrompt:@"不超过15个字"];
//            return NO;
//        }
    } else if (textField.tag == card_TextField_TYPE_ENMU) {
        if (length > 18) {
            [textField resignFirstResponder];
            [MBProgressHUD showPrompt:@"最多输入18位身份证号"];
            return NO;
        }
    }
    return YES;
}


-(void)textFieldDidChange :(UITextField *)textField{
//    if (textField.text.length > 10 && [textField isEqual:self.nameInput]) {
//        textField.text = [textField.text substringToIndex:10];
//        [MBProgressHUD showPrompt:@"不超过10个字"];
//    }
    if (textField.tag == name_TextField_TYPE_ENMU) {
        self.peopleOne.realname = textField.text;
    } else if (textField.tag == card_TextField_TYPE_ENMU){
        self.peopleOne.idNumber = textField.text;
    }
    if (self.FillIn) {
        self.FillIn(self.peopleOne);
    }
}
- (void)setPeopleOne:(travellerS *)peopleOne{
    _peopleOne = peopleOne;
    self.nameInput.text = peopleOne.realname;
    self.cardTypeInput.text = peopleOne.idNumber;
    self.btnUser.selected = peopleOne.isDefault;
}

- (void)setIdType:(NSString *)idType{
    _idType = idType;
    if (idType && idType.length) {
        self.xuanZhe.hidden = YES;
    }else{
        self.xuanZhe.hidden = NO;
    }
}
@end
