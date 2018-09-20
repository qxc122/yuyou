//
//  GJtouerCell.m
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "GJtouerCell.h"
#import "datePiker.h"


@interface GJtouerCell ()<UITextFieldDelegate>
@property (nonatomic,weak) UIButton *sexBtn;
@property (nonatomic,weak) UILabel *cardType;
//@property (nonatomic,weak) UITextField *birDayInput;
@property (nonatomic,weak) UITextField *termDayInput;
@property (nonatomic,weak) UITextField *firstNameInput;
@property (nonatomic,weak) UITextField *lastnameInput;
@property (nonatomic,weak) UITextField *cardTypeInput;
@property (nonatomic,weak) UITextField *SFZInput;
@property (nonatomic,weak) UIButton *btnUser;
//@property (nonatomic,weak) UIButton *man;
//@property (nonatomic,weak) UIButton *woman;
@property (nonatomic,weak) UIButton *xuanZhe;

@end
#define kAlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
@implementation GJtouerCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    GJtouerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[GJtouerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
        
        UIView *lineThree = [[UIView alloc]init];
        lineThree.backgroundColor = ColorWithHex(0x979797, 0.4);
        [self.contentView addSubview:lineThree];
        [lineThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(0);
            make.right.equalTo(back).offset(0);
            make.top.equalTo(lineTwo.mas_bottom).offset(49);
            make.height.equalTo(@(0.5));
        }];
        
        UIView *lineThree1 = [[UIView alloc]init];
        lineThree1.backgroundColor = ColorWithHex(0x979797, 0.4);
        [self.contentView addSubview:lineThree1];
        [lineThree1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(0);
            make.right.equalTo(back).offset(0);
            make.top.equalTo(lineThree.mas_bottom).offset(49);
            make.height.equalTo(@(0.5));
        }];
        
        
//        UIView *lineFour = [[UIView alloc]init];
//        lineFour.backgroundColor = ColorWithHex(0x979797, 0.4);
//        [self.contentView addSubview:lineFour];
//        [lineFour mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(back).offset(0);
//            make.right.equalTo(back).offset(0);
//            make.top.equalTo(lineThree1.mas_bottom).offset(49);
//            make.height.equalTo(@(0.5));
//        }];
        
        UIView *lineFive = [[UIView alloc]init];
        lineFive.backgroundColor = ColorWithHex(0x979797, 0.4);
        [self.contentView addSubview:lineFive];
        [lineFive mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(0);
            make.right.equalTo(back).offset(0);
            make.top.equalTo(lineThree1.mas_bottom).offset(49);
            make.height.equalTo(@(0.5));
        }];

        UILabel *firstName = [[UILabel alloc]init];
        [self.contentView addSubview:firstName];
        UITextField *firstNameInput = [[UITextField alloc]init];
        firstNameInput.keyboardType = UIKeyboardTypeASCIICapable;
        [self.contentView addSubview:firstNameInput];
        
        
        UILabel *lastname = [[UILabel alloc]init];
        [self.contentView addSubview:lastname];
        UITextField *lastnameInput = [[UITextField alloc]init];
        lastnameInput.keyboardType = UIKeyboardTypeASCIICapable;
        [self.contentView addSubview:lastnameInput];
        

        UILabel *cardType = [[UILabel alloc]init];
        [self.contentView addSubview:cardType];
        UIButton *xuanZhe = [[UIButton alloc]init];
        self.xuanZhe = xuanZhe;
        [self.contentView addSubview:xuanZhe];
        UITextField *cardTypeInput = [[UITextField alloc]init];
        [self.contentView addSubview:cardTypeInput];
        
        UILabel *SFZInput1 = [UILabel new];
        [self.contentView addSubview:SFZInput1];
        
        UITextField *SFZInput = [UITextField new];
        [self.contentView addSubview:SFZInput];
        
        
        UILabel *termDay = [[UILabel alloc]init];
        [self.contentView addSubview:termDay];
        UITextField *termDayInput = [[UITextField alloc]init];
        [self.contentView addSubview:termDayInput];
        
//        UILabel *birDay = [[UILabel alloc]init];
//        [self.contentView addSubview:birDay];
//        UITextField *birDayInput = [[UITextField alloc]init];
//        [self.contentView addSubview:birDayInput];
        
        
        UILabel *des = [[UILabel alloc]init];
        [self.contentView addSubview:des];
        
        UIButton *btnUser = [[UIButton alloc]init];
        [self.contentView addSubview:btnUser];

        UIButton *termDayInputBtn = [[UIButton alloc]init];
        [self.contentView addSubview:termDayInputBtn];
        
//        UIButton *birDayInputBtn = [[UIButton alloc]init];
//        [self.contentView addSubview:birDayInputBtn];
        
//        UIView *suxian = [[UIView alloc]init];
//        suxian.backgroundColor =ColorWithHex(0x979797, 0.4);
//        [self.contentView addSubview:suxian];
        
//        UIButton *man = [[UIButton alloc]init];
//        
//        [man setBackgroundImage:ImageNamed(@"男女背景") forState:UIControlStateSelected];
//        [man setBackgroundImage:ImageNamed(@"男女背景") forState:UIControlStateHighlighted];
//        [man setTitleColor:ColorWithHex(0x000000, 0.53) forState:UIControlStateNormal];
//        [man setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateHighlighted];
//        [man setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateSelected];
//        man.titleLabel.font = PingFangSC_Regular(14);
//        man.tag = MAN_SEX_ENMU;
//        [self.contentView addSubview:man];
//        [man setTitle:@"男" forState:UIControlStateNormal];
//        [man addTarget:self action:@selector(sexClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//        UIButton *woman = [[UIButton alloc]init];
//        woman.titleLabel.font = PingFangSC_Regular(14);
//        [woman setBackgroundImage:ImageNamed(@"男女背景") forState:UIControlStateSelected];
//        [woman setBackgroundImage:ImageNamed(@"男女背景") forState:UIControlStateHighlighted];
//        [woman setTitleColor:ColorWithHex(0x000000, 0.53) forState:UIControlStateNormal];
//        [woman setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateHighlighted];
//        [woman setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateSelected];
//        woman.tag = WOMEN_SEX_ENMU;
//
//        [self.contentView addSubview:woman];
//        [woman setTitle:@"女" forState:UIControlStateNormal];
//        [woman addTarget:self action:@selector(sexClick:) forControlEvents:UIControlEventTouchUpInside];
//        
        
        [firstName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.bottom.equalTo(lineOne.mas_top);
            make.top.equalTo(back);
        }];
        [firstNameInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(88);
            make.right.equalTo(back).offset(-5);
            make.bottom.equalTo(lineOne.mas_top);
            make.top.equalTo(back);
        }];
        
        [lastname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstName);
            make.bottom.equalTo(lineTwo.mas_top);
            make.top.equalTo(lineOne.mas_bottom);
        }];
        [lastnameInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstNameInput);
            make.right.equalTo(firstNameInput);
            make.bottom.equalTo(lastname);
            make.top.equalTo(lastname);
        }];

        
        [cardType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstName);
            make.bottom.equalTo(lineThree.mas_top);
            make.top.equalTo(lineTwo.mas_bottom);
        }];
        
        [xuanZhe mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cardTypeInput.mas_left).offset(15);
            make.centerY.equalTo(cardTypeInput);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        
        [cardTypeInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstNameInput);
            make.right.equalTo(firstNameInput);
            make.bottom.equalTo(cardType);
            make.top.equalTo(cardType);
        }];
        
        [SFZInput1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstName);
            make.bottom.equalTo(lineThree1.mas_top);
            make.top.equalTo(lineThree.mas_bottom);
        }];
        [SFZInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstNameInput);
            make.right.equalTo(firstNameInput);
            make.bottom.equalTo(SFZInput1);
            make.top.equalTo(SFZInput1);
        }];
    
        [termDay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstName);
            make.bottom.equalTo(lineFive.mas_top);
            make.top.equalTo(lineThree1.mas_bottom);
        }];
        [termDayInput mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstNameInput);
            make.bottom.equalTo(termDay);
            make.top.equalTo(termDay);
        }];
        
//        [birDay mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(firstName);
//            make.bottom.equalTo(lineFive.mas_top);
//            make.top.equalTo(lineFour.mas_bottom);
//        }];
//        [birDayInput mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(firstNameInput);
//            make.right.equalTo(suxian.mas_left).offset(3);
//            make.bottom.equalTo(birDay);
//            make.top.equalTo(birDay);
//        }];
        
//        [suxian mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(back).offset(-150);
//            make.width.equalTo(@(1));
//            make.bottom.equalTo(lineFive.mas_top).offset(-10);
//            make.top.equalTo(lineFour.mas_bottom).offset(10);
//        }];
//        [man mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(suxian.mas_right).offset(20);
//            make.centerY.equalTo(suxian);
//            make.width.equalTo(@(40));
//            make.height.equalTo(@(30));
//        }];
//        [woman mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(man.mas_right).offset(10);
//            make.centerY.equalTo(suxian);
//            make.width.equalTo(@(40));
//            make.height.equalTo(@(30));
//        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.bottom.equalTo(back);
            make.top.equalTo(lineFive.mas_bottom);
        }];
        [btnUser mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(des.mas_right).offset(0);
            make.centerY.equalTo(des);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        [termDayInputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(termDayInput);
            make.right.equalTo(termDayInput);
            make.top.equalTo(termDayInput);
            make.bottom.equalTo(termDayInput);
        }];
//        [birDayInputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(birDayInput);
//            make.right.equalTo(birDayInput);
//            make.top.equalTo(birDayInput);
//            make.bottom.equalTo(birDayInput);
//        }];
        
        //set
//        [firstNameInput addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
//        [lastnameInput addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
//        [SFZInput addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        self.SFZInput = SFZInput;
        self.cardType = cardType;
        self.firstNameInput = firstNameInput;
        self.lastnameInput = lastnameInput;
        self.cardTypeInput = cardTypeInput;
        self.termDayInput = termDayInput;
//        self.birDayInput = birDayInput;
        

        
//        self.man =man;
//        self.woman =woman;
        self.btnUser =btnUser;
        
        self.firstNameInput.tag = Xin_inPut_ENMU;
        self.lastnameInput.tag = Ming_inPut_ENMU;
        self.cardTypeInput.tag = HUzhao_inPut_ENMU;
        self.termDayInput.tag = GUOqi_inPut_ENMU;
//        self.birDayInput.tag = Birday_inPut_ENMU;
        self.SFZInput.tag = SFZ_inPut_ENMU;
        
        self.firstNameInput.delegate =self;
        self.lastnameInput.delegate =self;
        self.cardTypeInput.delegate =self;
        self.SFZInput.delegate =self;
        
        
//        [birDayInputBtn addTarget:self action:@selector(datexuanZheClick:) forControlEvents:UIControlEventTouchUpInside];
//        birDayInputBtn.tag = 1;
        [termDayInputBtn addTarget:self action:@selector(datexuanZheClick:) forControlEvents:UIControlEventTouchUpInside];
        termDayInputBtn.tag = 2;
        
        
//        LRViewRadius(man, cornerRadius_width);
//        LRViewRadius(woman, cornerRadius_width);
        
        [xuanZhe setImage:ImageNamed(@"剑头下") forState:UIControlStateNormal];
        [xuanZhe addTarget:self action:@selector(xuanZheClick:) forControlEvents:UIControlEventTouchUpInside];
        des.text = @"设为默认常用旅客";
        [btnUser setImage:ImageNamed(@"选择框空心") forState:UIControlStateNormal];
        [btnUser setImage:ImageNamed(@"选中") forState:UIControlStateHighlighted];
        [btnUser setImage:ImageNamed(@"选中") forState:UIControlStateSelected];
        [btnUser addTarget:self action:@selector(btnUserClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btnUser.imageEdgeInsets = UIEdgeInsetsMake(14, 14, 14, 14);
        
        termDayInput.userInteractionEnabled = NO;
//        birDayInput.userInteractionEnabled = NO;
        firstName.text  =@"姓(拼音)";
        lastname.text  =@"名(拼音)";
        cardType.text  =@"护照号码";
        termDay.text  =@"有效期至";
//        birDay.text  =@"出生日期";
        SFZInput1.text  =@"身份证";
        
        
        firstNameInput.placeholder  =@"如:(WANG)";
        lastnameInput.placeholder  =@"如:(XIAOHONG)";
        cardTypeInput.placeholder  =@"所持证件号";
        SFZInput.placeholder  =@"18位身份证号";
        termDayInput.placeholder  =@"证件有效期";
//        birDayInput.placeholder  =@"出生日期";
        [des settextColorhex:0x000000 alpa:0.53 font:PingFangSC_Regular(14)];
        
        SFZInput1.font = PingFangSC_Regular(14);
        SFZInput1.textColor = ColorWithHex(0x000000, 0.54);
        firstName.font = PingFangSC_Regular(14);
        firstName.textColor = ColorWithHex(0x000000, 0.54);
        lastname.font = PingFangSC_Regular(14);
        lastname.textColor = ColorWithHex(0x000000, 0.54);
        cardType.font = PingFangSC_Regular(14);
        cardType.textColor = ColorWithHex(0x000000, 0.54);
        termDay.font = PingFangSC_Regular(14);
        termDay.textColor = ColorWithHex(0x000000, 0.54);
//        birDay.font = PingFangSC_Regular(14);
//        birDay.textColor = ColorWithHex(0x000000, 0.54);
        
        SFZInput.font = PingFangSC_Regular(14);
        SFZInput.textColor = ColorWithHex(0x000000, 0.87);
        firstNameInput.font = PingFangSC_Regular(14);
        firstNameInput.textColor = ColorWithHex(0x000000, 0.87);
        lastnameInput.font = PingFangSC_Regular(14);
        lastnameInput.textColor = ColorWithHex(0x000000, 0.87);
        cardTypeInput.font = PingFangSC_Regular(14);
        cardTypeInput.textColor = ColorWithHex(0x000000, 0.87);
        termDayInput.font = PingFangSC_Regular(14);
        termDayInput.textColor = ColorWithHex(0x000000, 0.87);
//        birDayInput.font = PingFangSC_Regular(14);
//        birDayInput.textColor = ColorWithHex(0x000000, 0.87);
        [self.firstNameInput setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.lastnameInput setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.cardTypeInput setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.termDayInput setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        //        [self.birDayInput setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.SFZInput setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    return self;
}

- (void)xuanZheClick:(UIButton *)sender{
    NSLog(@"xuanZheClick 下尖头");
    if (self.reload) {
        self.reload();
    }

}
- (void)btnUserClick:(UIButton *)sender{
    NSLog(@"设置为常用旅客");
    sender.selected = !sender.selected;
    self.peopleOne.isDefault = sender.selected;
    if (self.FillIn) {
        self.FillIn(self.peopleOne);
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == Xin_inPut_ENMU) {
        textField.text = textField.text.uppercaseString;
        self.peopleOne.firstname = textField.text;
    }else if (textField.tag == Ming_inPut_ENMU){
        textField.text = textField.text.uppercaseString;
        self.peopleOne.lastname = textField.text;
    }else if (textField.tag == HUzhao_inPut_ENMU){
        textField.text = textField.text.uppercaseString;
        self.peopleOne.passportNumber = textField.text;
    }else if (textField.tag == SFZ_inPut_ENMU){
        self.peopleOne.idNumber = textField.text;
    }
    if (self.FillIn) {
        self.FillIn(self.peopleOne);
    }
}

//#pragma --maek<这样就可以更好地限制输入长度：>
//- (void)textFieldDidChange:(UITextField *)textField
//{
//    textField.text =  textField.text.uppercaseString;
//    if (textField.text.length > 15 && ([textField isEqual:self.firstNameInput] || [textField isEqual:self.lastnameInput])) {
//        [MBProgressHUD showPrompt:@"不超过15个字"];
//        textField.text = [textField.text substringToIndex:15];
//    }
//}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{
    NSUInteger length = textField.text.length + string.length;
    
    if (textField.tag == Xin_inPut_ENMU) {
        string = string.uppercaseString;
//        if (length > 15) {
//            [textField resignFirstResponder];
//            [MBProgressHUD showPrompt:@"不超过15个字"];
//            return NO;
//        }
    } else if (textField.tag == Ming_inPut_ENMU) {
        string = string.uppercaseString;
//        if (length > 15) {
//            [textField resignFirstResponder];
//            [MBProgressHUD showPrompt:@"不超过15个字"];
//            return NO;
//        }
    } else if (textField.tag == SFZ_inPut_ENMU) {
        if (length > 18) {
            [textField resignFirstResponder];
            [MBProgressHUD showPrompt:@"最多输入18位身份证号"];
            return NO;
        }
    }
    return YES;
}


//限制文本框输入

//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    NSCharacterSet *cs;
//    
//    cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum] invertedSet];

//    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@"\"];
//     
//     BOOL basic = [string isEqualToString:filtered];
    
     

     
//    if ([textField isEqual:self.firstNameInput]) {
//        if (textField.text.length >15) {
//            [MBProgressHUD showPrompt:@"不超过15个字"];
//            return NO;
//        }
//    }

     
    
//    self.textField.keyboardType = UIKeyboardTypeASCIICapable;
//    define kAlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
//    
//    //判断是否是数字，不是的话就输入失败
//    - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//    {
//        NSCharacterSet *cs;
//        
//        cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum] invertedSet];
//        
//        
//        
//        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
//        
//        
//        
//        BOOL canChange = [string isEqualToString:filtered];
//        
//        
//        
//        return self.textField.text.length>=5?NO: canChange;
//
//        
//        
//    
//    return YES;
//}



     
     
- (void)sexClick:(UIButton *)sex{
    NSLog(@"男 女");
    if (self.sexBtn) {
        self.sexBtn.selected = NO;
    }
    if (sex.tag == MAN_SEX_ENMU) {
        self.peopleOne.gender = SEX_male;
    }else if (sex.tag == WOMEN_SEX_ENMU){
        self.peopleOne.gender = SEX_female;
    }
    self.sexBtn = sex;
    self.sexBtn.selected = YES;
}
//- (travellerS *)peopleOne{
//    if (!_peopleOne) {
//        _peopleOne = [[travellerS alloc]init];
//        _peopleOne.idType = GUOJIHUzhao;
//    }
//    return _peopleOne;
//}

- (void)setPeopleOne:(travellerS *)peopleOne{
    _peopleOne = peopleOne;
//    self.birDayInput.text = peopleOne.birth;
    self.termDayInput.text = peopleOne.idPeriod;
    self.SFZInput.text = peopleOne.idNumber;
    if ([peopleOne.idType isEqualToString:GUOJIHUzhao]) {
        self.cardTypeInput.text = peopleOne.passportNumber;
    }else if ([peopleOne.idType isEqualToString:SFZ]){
        self.cardTypeInput.text = peopleOne.idNumber;
    }
    self.firstNameInput.text = peopleOne.firstname;
    self.lastnameInput.text = peopleOne.lastname;
//    if ([peopleOne.gender isEqualToString:SEX_male]) {
//        self.sexBtn = self.man;
//    } else if ([peopleOne.gender isEqualToString:SEX_female]){
//        self.sexBtn = self.woman;
//    }
    self.sexBtn.selected = YES;
    self.btnUser.selected = peopleOne.isDefault;
}
- (void)datexuanZheClick:(UIButton *)btn{
    kWeakSelf(self);
    if ([self.firstNameInput isFirstResponder]) {
        [self.firstNameInput resignFirstResponder];
    } else if ([self.lastnameInput isFirstResponder]) {
        [self.lastnameInput resignFirstResponder];
    } else if ([self.cardTypeInput isFirstResponder]) {
        [self.cardTypeInput resignFirstResponder];
    }else if ([self.SFZInput isFirstResponder]) {
        [self.SFZInput resignFirstResponder];
    }
    datePiker *datese = [[datePiker alloc]init];
    if (btn.tag == 1) {//生日
        datese.maxDate = [NSDate date];
        datese.minDate = [NSDate dateWithYear:1900 month:1 day:1];
        datese.nextClick = ^(NSString *startDate){
            weakself.peopleOne.birth = startDate;
//            weakself.birDayInput.text  = startDate;
            if (weakself.FillIn) {
                weakself.FillIn(weakself.peopleOne);
            }
        };
    }else if(btn.tag == 2){ //有效七
        datese.maxDate = [NSDate dateWithYear:2100 month:1 day:1];
        datese.minDate = [NSDate date];
        datese.nextClick = ^(NSString *startDate){
            weakself.peopleOne.idPeriod = startDate;
            weakself.termDayInput.text  = startDate;
            if (weakself.FillIn) {
                weakself.FillIn(weakself.peopleOne);
            }
        };
    }
    [datese windosViewshow];
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
