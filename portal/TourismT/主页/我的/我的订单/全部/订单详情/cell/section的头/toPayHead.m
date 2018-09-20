//
//  toPayHead.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "toPayHead.h"
@interface toPayHead ()
@property (nonatomic,weak) UIButton *seleBtn;

@property (nonatomic,weak) UIImageView *image11;

@property (nonatomic,weak) UIImageView *image22;

@property (nonatomic,weak) UIButton *btn1;
@property (nonatomic,weak) UIButton *btn2;
@end
@implementation toPayHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        
        UIView *head = [[UIView alloc]init];
        [self addSubview:head];

        UILabel *des = [[UILabel alloc]init];
        [self addSubview:des];
        
        UIView *line = [[UIView alloc]init];
        [self addSubview:line];
        
        UIButton *btn1 = [[UIButton alloc]init];
        [self addSubview:btn1];
        
        UIButton *btn2 = [[UIButton alloc]init];
        [self addSubview:btn2];
        
        UIImageView *image1 = [[UIImageView alloc]init];
        [self addSubview:image1];
        
        UIImageView *image2 = [[UIImageView alloc]init];
        [self addSubview:image2];
        
        UILabel *label1 = [[UILabel alloc]init];
        [self addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]init];
        [self addSubview:label2];
        
        UIImageView *image11 = [[UIImageView alloc]init];
        [self addSubview:image11];
        
        UIImageView *image22 = [[UIImageView alloc]init];
        [self addSubview:image22];
        
        UIView *su = [[UIView alloc]init];
        [self addSubview:su];

        
        [head mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(@(120));
            make.top.equalTo(self).offset(10);
        }];
        
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(head).offset(17);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(des.mas_bottom).offset(17);
            make.height.equalTo(@(0.5));
        }];
        [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.centerY.equalTo(su);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image1.mas_right).offset(12);
            make.centerY.equalTo(su);
        }];
        [image11 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label1.mas_right).offset(15);
            make.centerY.equalTo(su);
            make.width.equalTo(@(15));
            make.height.equalTo(@(15));
        }];
        [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image1).offset(-10);
            make.right.equalTo(image11).offset(10);
            make.centerY.equalTo(su);
            make.height.equalTo(@(44));
        }];
        
        [image2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(su).offset(15);
            make.centerY.equalTo(su);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image2.mas_right).offset(12);
            make.centerY.equalTo(su);
        }];
        [image22 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label2.mas_right).offset(15);
            make.centerY.equalTo(su);
            make.width.equalTo(@(15));
            make.height.equalTo(@(15));
        }];
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image2).offset(-10);
            make.right.equalTo(image22).offset(10);
            make.centerY.equalTo(su);
            make.height.equalTo(@(44));
        }];
        
        [su mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom).offset(20);
            make.bottom.equalTo(head).offset(-20);
            make.centerX.equalTo(self);
            make.width.equalTo(@(0.5));
        }];
        [self.foot mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(@(70));
            make.bottom.equalTo(self);
        }];

        //set
        self.image11 = image11;
        self.image22 = image22;

        self.btn1 = btn1;
        self.btn2 = btn2;
        btn1.tag = 0;
        btn2.tag = 1;

        
        [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

        su.backgroundColor = ColorWithHex(0x979797, 0.4);
        line.backgroundColor = ColorWithHex(0x979797, 0.4);
        head.backgroundColor = [UIColor whiteColor];

        des.textColor = ColorWithHex(0x000000, 0.54);
        des.font = PingFangSC_Regular(15);
        des.text = @"支付方式";
        image11.image = ImageNamed(@"选择框空心");
        image11.highlightedImage = ImageNamed(@"选中");
        image22.image = ImageNamed(@"选择框空心");
        image22.highlightedImage = ImageNamed(@"选中");
//        head.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
//        phone.textColor = ColorWithHex(0x000000, 0.87);
//        phone.font = PingFangSC_Regular(14);
//        //test
        image1.image = ImageNamed(@"微信支付");
        label1.text = @"微信";

        image2.image = ImageNamed(@"T钱包");
        label2.text = @"T钱包";
        self.image11.highlighted = YES;
        self.image22.highlighted = NO;
//        phone.text = @"17004965055";
        
    }
    return self;
}

- (void)setPaymentMethod:(NSString *)paymentMethod{
    _paymentMethod = paymentMethod;
    if ([paymentMethod isEqualToString:PayType_WX]) {
        self.image11.highlighted = YES;
        self.image22.highlighted = NO;
        self.seleBtn = self.btn1;
    } else if([paymentMethod isEqualToString:PayType_Twallet]){
        self.image11.highlighted = NO;
        self.image22.highlighted = YES;
        self.seleBtn = self.btn1;
    }
}
- (void)btnClick:(UIButton *)btn{
    if ((btn.tag != self.seleBtn.tag || !self.seleBtn) && self.chagePayTypeClick) {
        if (btn.tag == 0) {
            self.image11.highlighted = YES;
            self.image22.highlighted = NO;
            self.chagePayTypeClick(payType_chage_toPayHead,PayType_WX);
        } else if (btn.tag == 1){
            self.image11.highlighted = NO;
            self.image22.highlighted = YES;
            self.chagePayTypeClick(payType_chage_toPayHead,PayType_Twallet);
        }
        self.seleBtn = btn;
        //        paymentPluginsS *payTypeD1 = self.paymentPluginsA[btn.tag];
        //        self.chagePayTypeClick(payTypeD1.idd);
        //if (self.chagePayTypeClick) {
        //                self.chagePayTypeClick(payType_chage_toPayHead,payTypeD1.idd);
        //}
    }
}
@end
