//
//  realNameAuthenticationCell.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "realNameAuthenticationCell.h"
#import "NSString+check.h"


typedef NS_ENUM(NSInteger, realNameAuthenticationCell_btnTag)
{
    retransmission_realNameAuthenticationCell_btnTag,//重发
    Goselect_realNameAuthenticationCell_btnTag,//去选择银行了
    
    
    nameIn_realNameAuthenticationCell_btnTag,//重发
    idCardNumberIn_realNameAuthenticationCell_btnTag,//去选择银行了
    addressIn_realNameAuthenticationCell_btnTag,//去选择银行了

    BankCardNumberIn_realNameAuthenticationCell_btnTag,//去选择银行了
    BankPhoneIn_realNameAuthenticationCell_btnTag,//重发
    BankSmsIn_realNameAuthenticationCell_btnTag,//去选择银行了
};


@interface realNameAuthenticationCell ()<UITextFieldDelegate>
@property (nonatomic,strong) NSTimer *scrollTimer;
@property (nonatomic,assign) NSInteger num;

@property (nonatomic,weak) UITextField *nameIn;
@property (nonatomic,weak) UITextField *idCardNumberIn;
@property (nonatomic,weak) UITextField *addressIn;


@property (nonatomic,weak) UITextField *BanknameIn;
@property (nonatomic,weak) UIImageView *BanknameIcon;

@property (nonatomic,weak) UITextField *BankCardNumberIn;
@property (nonatomic,weak) UITextField *BankPhoneIn;
@property (nonatomic,weak) UITextField *BankSmsIn;

@property (nonatomic,weak) UIButton *BankSmsInBtn;
@end

@implementation realNameAuthenticationCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    realNameAuthenticationCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[realNameAuthenticationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *back1 = [[UIView alloc]init];
        [self.contentView addSubview:back1];
        
        UILabel *title1 = [UILabel new];
        [self.contentView addSubview:title1];
        
        UIView *line1_1 = [UIView new];
        [self.contentView addSubview:line1_1];
        
        UILabel *name = [UILabel new];
        [self.contentView addSubview:name];
        
        UITextField *nameIn = [UITextField new];
        [self.contentView addSubview:nameIn];

        UIView *line1_2 = [UIView new];
        [self.contentView addSubview:line1_2];
        
        UILabel *idCardNumber = [UILabel new];
        [self.contentView addSubview:idCardNumber];
        UITextField *idCardNumberIn = [UITextField new];
        [self.contentView addSubview:idCardNumberIn];
        
        UIView *line1_3 = [UIView new];
        [self.contentView addSubview:line1_3];
        
        UILabel *address = [UILabel new];
        [self.contentView addSubview:address];
        UITextField *addressIn = [UITextField new];
        [self.contentView addSubview:addressIn];
        
        UIView *back2 = [[UIView alloc]init];
        [self.contentView addSubview:back2];
        
        UILabel *title2 = [UILabel new];
        [self.contentView addSubview:title2];
        
        UIView *line2_1 = [UIView new];
        [self.contentView addSubview:line2_1];
        
        UIImageView *BanknameIcon = [UIImageView new];
        [self.contentView addSubview:BanknameIcon];
        
        UILabel *Bankname = [UILabel new];
        [self.contentView addSubview:Bankname];
        UITextField *BanknameIn = [UITextField new];
        [self.contentView addSubview:BanknameIn];
        
        UIImageView *BanknameInImage = [UIImageView new];
        [self.contentView addSubview:BanknameInImage];
        UIButton *BanknameInBtn= [UIButton new];
        [self.contentView addSubview:BanknameInBtn];
        
        UIView *line2_2 = [UIView new];
        [self.contentView addSubview:line2_2];
        
        UILabel *BankCardNumber = [UILabel new];
        [self.contentView addSubview:BankCardNumber];
        UITextField *BankCardNumberIn = [UITextField new];
        [self.contentView addSubview:BankCardNumberIn];
        
        UIView *line2_3 = [UIView new];
        [self.contentView addSubview:line2_3];
        
        UILabel *BankPhone = [UILabel new];
        [self.contentView addSubview:BankPhone];
        UITextField *BankPhoneIn = [UITextField new];
        [self.contentView addSubview:BankPhoneIn];
        

        UIView *line2_4 = [UIView new];
        [self.contentView addSubview:line2_4];
        
        UILabel *BankSms = [UILabel new];
        [self.contentView addSubview:BankSms];
        UITextField *BankSmsIn = [UITextField new];
        [self.contentView addSubview:BankSmsIn];
        UIButton *BankSmsInBtn = [UIButton new];
        [self.contentView addSubview:BankSmsInBtn];
        
        
        
        UIImageView *bottomImage = [UIImageView new];
        [self.contentView addSubview:bottomImage];
        
        UILabel *bottomDes = [UILabel new];
        [self.contentView addSubview:bottomDes];

        [back1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
        }];
        
        [title1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back1).offset(15);
//            make.right.equalTo(back1).offset(-15);
            make.top.equalTo(back1).offset(24);
            make.width.equalTo(@75);
        }];
        
        [line1_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back1);
            make.right.equalTo(back1);
            make.top.equalTo(title1.mas_bottom).offset(11);
            make.height.equalTo(@(0.5));
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1);
            make.right.equalTo(title1);
            make.top.equalTo(line1_1.mas_bottom).offset(21);
        }];
        [nameIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1.mas_right);
            make.right.equalTo(back1);
            make.centerY.equalTo(name);
            make.height.equalTo(@44);
        }];
        
        [line1_2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back1);
            make.right.equalTo(back1);
            make.top.equalTo(name.mas_bottom).offset(14);
            make.height.equalTo(@(0.5));
        }];
        
        [idCardNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1);
            make.right.equalTo(title1);
            make.top.equalTo(line1_2.mas_bottom).offset(17);
//            make.bottom.equalTo(back1).offset(-18);
        }];
        [idCardNumberIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1.mas_right);
            make.right.equalTo(back1);
            make.centerY.equalTo(idCardNumber);
            make.height.equalTo(@44);
        }];
        [line1_3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back1);
            make.right.equalTo(back1);
            make.top.equalTo(idCardNumber.mas_bottom).offset(17);
            make.height.equalTo(@(0.5));
        }];
        
        [address mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1);
            make.right.equalTo(title1);
            make.top.equalTo(line1_3.mas_bottom).offset(17);
            make.bottom.equalTo(back1).offset(-18);
        }];
        [addressIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1.mas_right);
            make.right.equalTo(back1);
            make.centerY.equalTo(address);
            make.height.equalTo(@44);
        }];
        
        [back2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back1);
            make.right.equalTo(back1);
            make.top.equalTo(back1.mas_bottom).offset(15);
        }];
        
        [title2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1);
            make.right.equalTo(title1);
            make.top.equalTo(back2).offset(24);
        }];
        
        [line2_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back2);
            make.right.equalTo(back2);
            make.top.equalTo(title2.mas_bottom).offset(11);
            make.height.equalTo(@(0.5));
        }];
        
        [Bankname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title2);
            make.right.equalTo(title2);
            make.top.equalTo(line2_1.mas_bottom).offset(21);
        }];
        
        [BanknameIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(back1).offset(-33);
            make.centerY.equalTo(Bankname);
            make.height.equalTo(@44);
        }];
        [BanknameIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(BanknameIn.mas_left).offset(-10);
            make.centerY.equalTo(Bankname);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        [BanknameInImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(BanknameIn.mas_right).offset(10);
            make.centerY.equalTo(Bankname);
            make.height.equalTo(@8);
            make.height.equalTo(@4);
        }];
        [BanknameInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(BanknameIcon);
            make.right.equalTo(BanknameInImage);
            make.top.equalTo(BanknameIn);
            make.bottom.equalTo(BanknameIn);
        }];
        
        [line2_2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back2);
            make.right.equalTo(back2);
            make.top.equalTo(Bankname.mas_bottom).offset(14);
            make.height.equalTo(@(0.5));
        }];
        
        [BankCardNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title2);
            make.right.equalTo(title2);
            make.top.equalTo(line2_2.mas_bottom).offset(17);
        }];
        [BankCardNumberIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1.mas_right);
            make.right.equalTo(back1);
            make.centerY.equalTo(BankCardNumber);
            make.height.equalTo(@44);
        }];
        [line2_3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back2);
            make.right.equalTo(back2);
            make.top.equalTo(BankCardNumber.mas_bottom).offset(18);
            make.height.equalTo(@(0.5));
        }];
        
        [BankPhone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title2);
            make.right.equalTo(title2);
            make.top.equalTo(line2_3.mas_bottom).offset(17);
        }];
        [BankPhoneIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1.mas_right);
            make.right.equalTo(back1);
            make.centerY.equalTo(BankPhone);
            make.height.equalTo(@44);
        }];
        [line2_4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back2);
            make.right.equalTo(back2);
            make.top.equalTo(BankPhone.mas_bottom).offset(18);
            make.height.equalTo(@(0.5));
        }];
        
        [BankSms mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title2);
            make.right.equalTo(title2);
            make.top.equalTo(line2_4.mas_bottom).offset(17);
            make.bottom.equalTo(back2).offset(-18);
        }];
        [BankSmsIn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title1.mas_right);
            make.right.equalTo(BankSmsInBtn.mas_left);
            make.centerY.equalTo(BankSms);
            make.height.equalTo(@44);
        }];
        
        [BankSmsInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(BanknameInImage);
            make.centerY.equalTo(BankSms);
            make.height.equalTo(@44);
            make.width.equalTo(@60);
        }];
        
        [bottomDes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset((11+6)/2.0);
            make.top.equalTo(back2.mas_bottom).offset(31);
            make.bottom.equalTo(self.contentView);
        }];
        
        [bottomImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(bottomDes);
            make.right.equalTo(bottomDes.mas_left).offset(-6);
            make.width.equalTo(@11);
            make.height.equalTo(@13);
        }];
        
        //set
        BanknameIcon.layer.cornerRadius = 20*0.5;
        BanknameIcon.layer.masksToBounds = YES;
        self.nameIn = nameIn;
        self.idCardNumberIn = idCardNumberIn;
        self.BankCardNumberIn = BankCardNumberIn;
        self.BankPhoneIn = BankPhoneIn;
        self.BankSmsIn = BankSmsIn;
        self.BanknameIn= BanknameIn;
        self.BankSmsInBtn = BankSmsInBtn;
        self.BanknameIcon = BanknameIcon;
        self.addressIn = addressIn;
        
        BanknameInBtn.tag  = Goselect_realNameAuthenticationCell_btnTag;
        self.BankSmsInBtn.tag  = retransmission_realNameAuthenticationCell_btnTag;
        
        self.BanknameIn.placeholder = @"请选择银行";
        self.BanknameIn.userInteractionEnabled = NO;
        self.nameIn.placeholder = @"请输入姓名";
        self.idCardNumberIn.placeholder = @"所持证件号";
        self.BankCardNumberIn.placeholder = @"所持银行卡号";
        self.BankPhoneIn.placeholder = @"银行预留手机号";
        self.BankSmsIn.placeholder = @"请输入验证码";
        self.addressIn.placeholder = @"请输入您现在的居住地";
        
        self.nameIn.delegate = self;
        self.idCardNumberIn.delegate = self;
        self.BankCardNumberIn.delegate = self;
        self.BankPhoneIn.delegate = self;
        self.BankSmsIn.delegate = self;
        self.addressIn.delegate = self;
//        self.nameIn.keyboardType = UIKeyboardTypePhonePad;
//        self.idCardNumberIn.delegate = self;
        self.BankCardNumberIn.keyboardType = UIKeyboardTypePhonePad;
        self.BankPhoneIn.keyboardType = UIKeyboardTypePhonePad;
        self.BankSmsIn.keyboardType = UIKeyboardTypePhonePad;
        
        self.nameIn.tag = nameIn_realNameAuthenticationCell_btnTag;
        self.idCardNumberIn.tag = idCardNumberIn_realNameAuthenticationCell_btnTag;
        self.addressIn.tag = addressIn_realNameAuthenticationCell_btnTag;
        self.BankCardNumberIn.tag = BankCardNumberIn_realNameAuthenticationCell_btnTag;
        self.BankPhoneIn.tag = BankPhoneIn_realNameAuthenticationCell_btnTag;
        self.BankSmsIn.tag = BankSmsIn_realNameAuthenticationCell_btnTag;

        BanknameInImage.image = ImageNamed(@"向下箭头");
        
        back1.backgroundColor = [UIColor whiteColor];
        back2.backgroundColor = [UIColor whiteColor];
        title1.text = @"身份信息";
        name.text = @"姓名";
        idCardNumber.text = @"身份证";
        address.text = @"居住地址";
        
        title2.text = @"银行卡信息";
        Bankname.text = @"所属银行";
        BankCardNumber.text = @"储蓄卡号";
        BankPhone.text = @"手机号";
        BankSms.text = @"验证码";

        bottomImage.image = ImageNamed(@"保障");
        bottomDes.text = @"我们承诺严密保障您的个人信息安全，请放心认证";
//        self.cardNumber  =cardNumber;
//        self.type  =type;
//        self.bankName  =bankName;
        title1.font = PingFangSC_Regular(14);
        title1.textColor = ColorWithHex(0x000000, 0.87);
        name.font = PingFangSC_Regular(14);
        name.textColor = ColorWithHex(0x000000, 0.54);
        idCardNumber.font = PingFangSC_Regular(14);
        idCardNumber.textColor = ColorWithHex(0x000000, 0.54);
        address.font = PingFangSC_Regular(14);
        address.textColor = ColorWithHex(0x000000, 0.54);
        
        title2.font = PingFangSC_Regular(14);
        title2.textColor = ColorWithHex(0x000000, 0.87);
        Bankname.font = PingFangSC_Regular(14);
        Bankname.textColor = ColorWithHex(0x000000, 0.54);
        BankCardNumber.font = PingFangSC_Regular(14);
        BankCardNumber.textColor = ColorWithHex(0x000000, 0.54);
        BankPhone.font = PingFangSC_Regular(14);
        BankPhone.textColor = ColorWithHex(0x000000, 0.54);
        BankSms.font = PingFangSC_Regular(14);
        BankSms.textColor = ColorWithHex(0x000000, 0.54);
        bottomDes.font = PingFangSC_Regular(12);
        bottomDes.textColor = ColorWithHex(0xFFFFFF, 0.54);
        
        self.nameIn.textColor = ColorWithHex(0x000000, 0.87);
        self.idCardNumberIn.textColor = ColorWithHex(0x000000, 0.87);
        self.addressIn.textColor = ColorWithHex(0x000000, 0.87);
        self.BankCardNumberIn.textColor = ColorWithHex(0x000000, 0.87);
        self.BankPhoneIn.textColor = ColorWithHex(0x000000, 0.87);
        self.BankSmsIn.textColor = ColorWithHex(0x000000, 0.87);
        self.BanknameIn.textColor = ColorWithHex(0x000000, 0.87);
        
        self.BanknameIn.font = PingFangSC_Regular(14);
        self.nameIn.font = PingFangSC_Regular(14);
        self.addressIn.font = PingFangSC_Regular(14);
        self.idCardNumberIn.font = PingFangSC_Regular(14);
        self.BankCardNumberIn.font = PingFangSC_Regular(14);
        self.BankPhoneIn.font = PingFangSC_Regular(14);
        self.BankSmsIn.font = PingFangSC_Regular(14);
        
        back1.layer.cornerRadius = cornerRadius_width;
        back1.layer.masksToBounds = YES;
        back2.layer.cornerRadius = cornerRadius_width;
        back2.layer.masksToBounds = YES;
        
        line1_1.backgroundColor = ColorWithHex(0x979797, 0.4);
        line1_2.backgroundColor = ColorWithHex(0x979797, 0.4);
        line1_3.backgroundColor = ColorWithHex(0x979797, 0.4);
        
        line2_1.backgroundColor = ColorWithHex(0x979797, 0.4);
        line2_2.backgroundColor = ColorWithHex(0x979797, 0.4);
        line2_3.backgroundColor = ColorWithHex(0x979797, 0.4);
        line2_4.backgroundColor = ColorWithHex(0x979797, 0.4);
        
        
        
        [BankSmsInBtn setTitle:@"发送" forState:UIControlStateNormal];
        [BankSmsInBtn setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateNormal];
        BankSmsInBtn.titleLabel.font = PingFangSC_Regular(14);

        [BankSmsInBtn addTarget:self action:@selector(BanknameInBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [BanknameInBtn addTarget:self action:@selector(BanknameInBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.nameIn addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [self.idCardNumberIn addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [self.addressIn addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [self.BankCardNumberIn addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [self.BankPhoneIn addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [self.BankSmsIn addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        
        
        
        [self.nameIn setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.idCardNumberIn setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.addressIn setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.BankCardNumberIn setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.BankPhoneIn setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.BankSmsIn setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.BanknameIn setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        
//
//        iconCard.image = ImageNamed(IMAGE_NavcBack);
//        iconCard.layer.cornerRadius = cornerRadius_width;
//        iconCard.layer.masksToBounds = YES;
//        
        //tset
//        CardLogo.image = ImageNamed(@"个人信息MYYY");
//        cardNumber.text = @"**** **** **** 0542";
//        type.text = @"储蓄卡";
//        bankName.text = @"中国银行";
        
    }
    return self;
}
- (void)setBankCardDate:(BindBankCard *)BankCardDate{
    if (BankCardDate) {
        _BankCardDate = BankCardDate;
        if (!self.Bind) { //是更换银行卡
            if (BankCardDate.realname && BankCardDate.realname.length) {
                self.nameIn.userInteractionEnabled = NO;
            }
            if (BankCardDate.idCard && BankCardDate.idCard.length) {
                self.idCardNumberIn.userInteractionEnabled = NO;
            }
        }
        self.nameIn.text = BankCardDate.realname;
        if (BankCardDate.bank.logo && BankCardDate.bank.logo.length) {
            [self.BanknameIcon sd_setImageWithURL:[NSURL URLWithString:BankCardDate.bank.logo] placeholderImage:ImageNamed(place_image_image)];
        }
        
        self.idCardNumberIn.text = BankCardDate.idCard;
        self.BanknameIn.text = BankCardDate.bank.name;
        self.addressIn.text = BankCardDate.address;
        self.BankCardNumberIn.text = BankCardDate.bankCardNo;
        self.BankPhoneIn.text = BankCardDate.mobile;
        self.BankSmsIn.text = BankCardDate.smsCode;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger length = textField.text.length + string.length;
    if (textField.tag == idCardNumberIn_realNameAuthenticationCell_btnTag) {
        if (length > 18) {
            [textField resignFirstResponder];
            [MBProgressHUD showPrompt:@"最多输入18位身份证号"];
            return NO;
        }
    } else if (textField.tag == BankPhoneIn_realNameAuthenticationCell_btnTag) {
        if (length > 11) {
            [textField resignFirstResponder];
            [MBProgressHUD showPrompt:@"最多输入11位手机号"];
            return NO;
        }
    } else if (textField.tag == BankSmsIn_realNameAuthenticationCell_btnTag) {
        if (length > 6) {
            [textField resignFirstResponder];
            [MBProgressHUD showPrompt:@"最多输入6位验证码"];
            return NO;
        }
    }
    return YES;
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if (textField.tag == BankCardNumberIn_realNameAuthenticationCell_btnTag) {
//        if ([textField.text hasSuffix:@" "]) {
//            NSString *top = textField.text;
//            textField.text = [textField.text substringToIndex:textField.text.length-1];
//            NSLog(@"string =%@1",top);
//        }
//    }
//    return YES;
//}

- (void)textValueChanged:(UITextField *)textField{
    if (textField.tag == nameIn_realNameAuthenticationCell_btnTag) {
        self.BankCardDate.realname = textField.text;
    } else if (textField.tag == idCardNumberIn_realNameAuthenticationCell_btnTag) {
        self.BankCardDate.idCard = textField.text;
    } else if (textField.tag == addressIn_realNameAuthenticationCell_btnTag) {
        self.BankCardDate.address = textField.text;
    } else if (textField.tag == BankCardNumberIn_realNameAuthenticationCell_btnTag) {
        NSString *tmp = textField.text;
        tmp = [tmp stringByReplacingOccurrencesOfString:@" " withString:@""];
        if (textField.text.length >4 && tmp.length%4 == 1) {
            textField.text = [NSString stringWithFormat:@"%@ %@",[textField.text substringToIndex:textField.text.length-1],[textField.text substringFromIndex:textField.text.length-1]];
        }
        while ([textField.text hasSuffix:@" "]) {
            NSString *top = textField.text;
            textField.text = [textField.text substringToIndex:textField.text.length-1];
            NSLog(@"string =%@1",top);
        }
        self.BankCardDate.bankCardNo = textField.text;
    } else if (textField.tag == BankPhoneIn_realNameAuthenticationCell_btnTag) {
        self.BankCardDate.mobile = textField.text;
    } else if (textField.tag == BankSmsIn_realNameAuthenticationCell_btnTag) {
        self.BankCardDate.smsCode = textField.text;
    }
}

//- (void)textFieldDidEndEditing:(UITextField *)textField{
//    if (textField.tag == nameIn_realNameAuthenticationCell_btnTag) {
//        self.BankCardDate.realname = textField.text;
//    } else if (textField.tag == idCardNumberIn_realNameAuthenticationCell_btnTag) {
//        self.BankCardDate.idCard = textField.text;
//    } else if (textField.tag == BankCardNumberIn_realNameAuthenticationCell_btnTag) {
//        self.BankCardDate.bankCardNo = textField.text;
//    } else if (textField.tag == BankPhoneIn_realNameAuthenticationCell_btnTag) {
//        self.BankCardDate.mobile = textField.text;
//    } else if (textField.tag == BankSmsIn_realNameAuthenticationCell_btnTag) {
//        self.BankCardDate.smsCode = textField.text;
//    }
//}

- (void)BanknameInBtnClick:(UIButton *)sender{
    if ([self.nameIn isFirstResponder]) {
        [self.nameIn resignFirstResponder];
    }
    if ([self.idCardNumberIn isFirstResponder]) {
        [self.idCardNumberIn resignFirstResponder];
    }
    if ([self.BankCardNumberIn isFirstResponder]) {
        [self.BankCardNumberIn resignFirstResponder];
    }
    if ([self.BankPhoneIn isFirstResponder]) {
        [self.BankPhoneIn resignFirstResponder];
    }
    if ([self.BankSmsIn isFirstResponder]) {
        [self.BankSmsIn resignFirstResponder];
    }
    if (sender.tag == Goselect_realNameAuthenticationCell_btnTag) {
        if (self.SelectBank) {
            self.SelectBank();
        }
    } else if (sender.tag == retransmission_realNameAuthenticationCell_btnTag) {
        [self sendSms:self.BankPhoneIn.text];
    }
}

- (void)sendSms:(NSString *)phone{
    if ([NSString checkTelNumber:phone]) {
        kWeakSelf(self);
        [MBProgressHUD showLoadingMessage:@"发送中..."];
        [[ToolRequest sharedInstance]sendSmsWithmobile:phone type:SendSmsTypeBingCard success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.num = 60;
            [weakself creatTimer];
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:msg];
            if (weakself.sendSmsOK) {
                weakself.sendSmsOK();
            }
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:msg];
        }];
    }else{
        [MBProgressHUD showPrompt:@"请输入正确的手机号"];
    }
}

#pragma mark----创建定时器
-(void)creatTimer{
    _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(daojishiRunning) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
    [self.BankSmsInBtn setTitle:@"60s" forState:UIControlStateNormal];
    self.BankSmsInBtn.enabled = NO;
}

#pragma mark----倒计时
-(void)daojishiRunning{
    self.num--;
    if (self.num == 0) {
        [self removeTimer];
        self.BankSmsInBtn.enabled = YES;
        [self.BankSmsInBtn setTitle:@"重新发送" forState:UIControlStateNormal];
    }else{
        [self.BankSmsInBtn setTitle:[NSString stringWithFormat:@"%lds",(long)self.num] forState:UIControlStateNormal];
    }
}

#pragma mark----移除定时器
-(void)removeTimer
{
    [_scrollTimer invalidate];
    _scrollTimer = nil;
}
- (void)dealloc{
    [self removeTimer];
}

@end
