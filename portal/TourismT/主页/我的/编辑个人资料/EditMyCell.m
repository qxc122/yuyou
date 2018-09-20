//
//  EditMyCell.m
//  TourismT
//
//  Created by Store on 2017/3/1.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "EditMyCell.h"
#import "SZTextView.h"



typedef NS_ENUM(NSInteger, eidtMyInfo_btnENUM_in)
{
    name_eidtMyInfo_btnENUM_in,//头像
    detail_eidtMyInfo_btnENUM_in,//性别
};


@interface EditMyCell ()<UITextViewDelegate>
@property (nonatomic,weak) UITextField *name;
@property (nonatomic,weak) UITextField *sex;
@property (nonatomic,weak) SZTextView *detail;
@property (nonatomic,weak) UILabel *detailBack;
@property (nonatomic,weak) UIImageView *avtor;
@property (nonatomic,assign) CGFloat preContenHeight; //之前的高度
@end

@implementation EditMyCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    EditMyCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[EditMyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *line1 = [UIView new];
        [self.contentView addSubview:line1];
        
        UIView *line2 = [UIView new];
        [self.contentView addSubview:line2];
        
        UIView *line3 = [UIView new];
        [self.contentView addSubview:line3];
        
        UIView *line4 = [UIView new];
        [self.contentView addSubview:line4];
        
        UILabel *icon1 = [[UILabel alloc]init];
        [self.contentView addSubview:icon1];
        
        UILabel *name1 = [[UILabel alloc]init];
        [self.contentView addSubview:name1];
        
        UILabel *sex1 = [[UILabel alloc]init];
        [self.contentView addSubview:sex1];
        
        UILabel *detail1 = [[UILabel alloc]init];
        [self.contentView addSubview:detail1];
        
        UITextField *name = [[UITextField alloc]init];
        [self.contentView addSubview:name];
        
        UITextField *sex = [[UITextField alloc]init];
        [self.contentView addSubview:sex];
        
        UILabel *detailBack = [[UILabel alloc]init];
        [self.contentView addSubview:detailBack];
        
        SZTextView *detail = [[SZTextView alloc]init];
        [self.contentView addSubview:detail];
        
        UIImageView *avtor = [[UIImageView alloc]init];
        [self.contentView addSubview:avtor];
        
        UIImageView *avtorChage = [[UIImageView alloc]init];
        [self.contentView addSubview:avtorChage];
        
        UIImageView *sexChage = [[UIImageView alloc]init];
        [self.contentView addSubview:sexChage];
        
        UIButton *avtorChageBtn = [[UIButton alloc]init];
        [self.contentView addSubview:avtorChageBtn];
        
        UIButton *sexChageBtn = [[UIButton alloc]init];
        [self.contentView addSubview:sexChageBtn];
        
        [avtorChageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(avtor);
            make.right.equalTo(avtorChage);
            make.top.equalTo(avtor);
            make.bottom.equalTo(avtor);
        }];
        [sexChageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(sexChage);
            make.centerX.equalTo(sexChage);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        [avtor mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(avtorChage.mas_left).offset(-30);
            make.centerY.equalTo(icon1);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        LRViewRadius(avtor, 44/2.0);
        [avtorChage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(line1);
            make.centerY.equalTo(icon1);
            make.width.equalTo(@(6));
            make.height.equalTo(@(12));
        }];
        [sexChage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(line1);
            make.centerY.equalTo(sex);
            make.width.equalTo(@(6));
            make.height.equalTo(@(12));
        }];
        [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line1);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(line1.mas_top);
        }];
        [name1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line1);
            make.top.equalTo(line1.mas_bottom);
            make.bottom.equalTo(line2.mas_top);
            make.width.equalTo(@[sex1,detail1,@35]);
        }];
        [sex1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line1);
            make.top.equalTo(line2.mas_bottom);
            make.bottom.equalTo(line3.mas_top);
        }];
        [detail1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line1);
            make.centerY.equalTo(detail);
            //                make.bottom.equalTo(line4.mas_top);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name1.mas_right).offset(25);
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(name1);
        }];
        [sex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(sex1.mas_right).offset(25);
            make.centerY.equalTo(sex1);
        }];
        
        [detailBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(detail1.mas_right).offset(25);
            make.top.equalTo(line3.mas_bottom).offset(16.7);
            make.right.equalTo(self.contentView).offset(-15);
        }];
        [detail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(detailBack);
            make.bottom.equalTo(detailBack).offset(8);;
            make.top.equalTo(detailBack).offset(-8);
            make.right.equalTo(detailBack);
        }];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(73);
            make.height.equalTo(@(0.5));
        }];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(line1.mas_bottom).offset(48);
            make.height.equalTo(@(0.5));
        }];
        [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(line2.mas_bottom).offset(48);
            make.height.equalTo(@(0.5));
        }];
        [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(detail.mas_bottom).offset(17.3);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
//        detail.backgroundColor = [UIColor redColor];
        
        [icon1 settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(15)];
        [name1 settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(15)];
        [name settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];
        [sex1 settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(15)];
        [sex settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];
        [detail1 settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(15)];
//        [detail settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];
        [detailBack settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];
        detailBack.hidden = YES;
        detailBack.numberOfLines = 0;
        detail.bounces = NO;
        detail.showsVerticalScrollIndicator = NO;
        
        detail.font = PingFangSC_Regular(14);
        detail.textColor = ColorWithHex(0x000000, 0.87);
        
        line1.backgroundColor = ColorWithHex(0xCFCFCF, 1.0);
        line2.backgroundColor = ColorWithHex(0xCFCFCF, 1.0);
        line3.backgroundColor = ColorWithHex(0xCFCFCF, 1.0);
        line4.backgroundColor = ColorWithHex(0xCFCFCF, 1.0);
        icon1.text = @"头像";
        name1.text = @"昵称";
        sex1.text = @"性别";
        detail1.text = @"简介";
        [avtorChageBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [sexChageBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        avtorChageBtn.tag = icon_eidtMyInfo_btnENUM;
        sexChageBtn.tag = sex_eidtMyInfo_btnENUM;
        self.sex = sex;
        self.detailBack = detailBack;
        self.avtor = avtor;
        self.name = name;
        self.detail = detail;
        
        [self.sex setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        [self.name setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        
        
        detail.delegate = self;
        sex.userInteractionEnabled = NO;
        avtorChage.image = ImageNamed(@"点击");
        sexChage.image = ImageNamed(@"点击");
        name.placeholder = @"请输入昵称";
        sex.placeholder = @"请选择性别";
        detail.placeholder = @"请编辑简介";
        name.tag  = name_eidtMyInfo_btnENUM_in;
        detail.tag  = detail_eidtMyInfo_btnENUM_in;
        [name addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
//        [detail addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}
- (void)setDecodedBag:(UserS *)decodedBag{
    if (decodedBag) {
        _decodedBag = decodedBag;
        if (self.decodedBag.nickName && self.decodedBag.nickName.length) {
            self.name.text = self.decodedBag.nickName;
        }
        if ([self.decodedBag.gender isEqualToString:SEX_male]) {
            self.sex.text = @"男";
        } else if ([self.decodedBag.gender isEqualToString:SEX_female]){
            self.sex.text = @"女";
        }
        if (self.decodedBag.signature && self.decodedBag.signature.length) {
            self.detail.text = self.decodedBag.signature;
            self.detailBack.text = self.decodedBag.signature;
        }else{
            self.detailBack.text = @"    ";
        }
        if (self.decodedBag.image) {
            self.avtor.image = self.decodedBag.image;
        } else {
            [self.avtor sd_setImageWithURL:[NSURL URLWithString:self.decodedBag.avatar] placeholderImage:ImageNamed(IMAGE_bigBack)];
        }
        self.preContenHeight = self.detail.contentSize.height;
    }
}
- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length > 50) {
        textView.text = [textView.text substringToIndex:50];
        [MBProgressHUD showPrompt:@"不超过50个字"];
    }
    self.decodedBag.signature = textView.text;
//    if (textView.contentSize.height != self.preContenHeight) {
//        if (self.reloadHeight) {
//            self.reloadHeight();
//        }
//        self.preContenHeight = self.detail.contentSize.height;
//    }
    NSLog(@"textView.contentSize.height=%f textView.frame.size.height=%f",textView.contentSize.height,textView.frame.size.height);
    NSLog(@"textView.contentSize.height=%f textView.frame.size.height=%f",textView.contentSize.height,textView.frame.size.height);
}
-(void)textFieldDidChange :(UITextField *)textField{
    if (textField.tag == name_eidtMyInfo_btnENUM_in) {
        if (textField.text.length > 15) {
            textField.text = [textField.text substringToIndex:15];
            [MBProgressHUD showPrompt:@"不超过15个字"];
        }
        self.decodedBag.nickName = textField.text;
    } else if (textField.tag == detail_eidtMyInfo_btnENUM_in){
        if (textField.text.length > 50) {
            textField.text = [textField.text substringToIndex:50];
            [MBProgressHUD showPrompt:@"不超过50个字"];
        }
        self.decodedBag.signature = textField.text;
    }
}
- (void)btnClick:(UIButton *)btn{
    if (self.ctnClick) {
        self.ctnClick(btn.tag);
    }
}
- (void)setIsFirest:(BOOL)isFirest{
    _isFirest = isFirest;
    if ([self.detail canResignFirstResponder] && isFirest) {
        [self.detail becomeFirstResponder];
    }
}
@end
