//
//  Withhold.m
//  TourismT
//
//  Created by Store on 2017/8/16.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "Withhold.h"
#import "UIImage+cir.h"
#import "payType.h"


@interface Withhold ()
@property (nonatomic,weak) UILabel *money;




//@property (nonatomic,weak) UIImageView *typeIcon;

@end


@implementation Withhold
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.back.layer.masksToBounds = NO;
        self.back.layer.cornerRadius = 0.0;
        self.close.hidden = YES;
        UIButton *close = [UIButton new];
        [self addSubview:close];
        
        UILabel *title = [UILabel new];
        [self addSubview:title];
        
        UIView *line = [UIView new];
        [self addSubview:line];
        
        UILabel *name1 = [UILabel new];
        [self addSubview:name1];
        UILabel *name = [UILabel new];
        [self addSubview:name];
        UIView *line2 = [UIView new];
        [self addSubview:line2];
        

        UILabel *type1 = [UILabel new];
        [self addSubview:type1];

        UILabel *type = [UILabel new];
        [self addSubview:type];
        
        UIView *line3 = [UIView new];
        [self addSubview:line3];

        UILabel *money1 = [UILabel new];
        [self addSubview:money1];
        UILabel *money = [UILabel new];
        [self addSubview:money];
        UIButton *goPay = [UIButton new];
        [self addSubview:goPay];
        
        
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@(323));
        }];
        
        [close mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(17-14);
            make.centerY.equalTo(title);
            make.width.equalTo(@40);
            make.height.equalTo(@40); //12
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.back).offset(20);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(title.mas_bottom).offset(20);
        }];
        [name1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(line.mas_bottom).offset(21);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name1.mas_right).offset(10);
            make.right.equalTo(self).offset(-37);
            make.bottom.equalTo(name1);
            make.top.equalTo(name1);
        }];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(name.mas_bottom).offset(25);
        }];
        
        [type1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name1);
            make.top.equalTo(line2.mas_bottom).offset(21);
        }];

        [type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(name);
            make.bottom.equalTo(type1);
            make.top.equalTo(type1);
        }];

        [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(type.mas_bottom).offset(25);
        }];
        
        
        [money1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name1);
            make.top.equalTo(line3.mas_bottom).offset(21);
        }];
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            //            make.left.equalTo(money1.mas_right).offset(10);
            make.right.equalTo(name);
            make.bottom.equalTo(money1);
            make.top.equalTo(money1);
        }];
        [goPay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@50);
        }];
//        [changePayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(typeIcon);
//            make.right.equalTo(chageType);
//            make.centerY.equalTo(chageType);
//            make.height.equalTo(@44);
//        }];
        
        //set
        line.backgroundColor = ColorWithHex(0x979797, 0.2);
        line2.backgroundColor = ColorWithHex(0x979797, 0.2);
        line3.backgroundColor = ColorWithHex(0x979797, 0.2);
        
        title.textColor = ColorWithHex(0x000000, 0.87);
        title.font = PingFangSC_Regular(17);
        
        name1.textColor = ColorWithHex(0x000000, 0.54);
        name1.font = PingFangSC_Regular(14);
        name.textColor = ColorWithHex(0x000000, 0.87);
        name.font = PingFangSC_Regular(14);
        
        type1.textColor = ColorWithHex(0x000000, 0.54);
        type1.font = PingFangSC_Regular(14);
        type.textColor = ColorWithHex(0x000000, 0.87);
        type.font = PingFangSC_Regular(14);
        
        money1.textColor = ColorWithHex(0x000000, 0.54);
        money1.font = PingFangSC_Regular(14);
        money.textColor = ColorWithHex(0x000000, 0.87);
        money.font = PingFangSC_Medium(20);
        
        [goPay setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0xFB704B, 1.0)] forState:UIControlStateNormal];
        [goPay setTitle:@"支付" forState:UIControlStateNormal];
        [goPay setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        goPay.titleLabel.font = PingFangSC_Regular(17);
        [goPay addTarget:self action:@selector(goPayClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        [close setImage:ImageNamed(@"删除") forState:UIControlStateNormal];
        [close addTarget:self action:@selector(closeBtn) forControlEvents:UIControlEventTouchUpInside];
//        [changePayBtn addTarget:self action:@selector(changePayBtn) forControlEvents:UIControlEventTouchUpInside];
        
        title.text = @"支付详情";
        name1.text = @"商品名称";
        
        type1.text = @"支付方式";
        
        money1.text = @"需支付";
        
        
        self.type = type;
        self.type1 = type1;
        self.line3 = line3;
        self.name = name;
        self.money = money;
        self.money1 = money1;
        self.name1 = name1;
        self.line2 = line2;
//        self.typeIcon = typeIcon;
//        chageType.image = ImageNamed(@"向右灰色");
//        typeIcon.image = ImageNamed(@"微信支付");
//        type.text = @"微信支付";
//        self.payType = PayType_WX;
        //test
        //        name.text = @"岘港5天4晚游";
        //        money.text = @"210.00元";
        
        //        name1.text = @"微信支付";
        //        name2.text = @"T钱包";
        //
        //        icon1.image = [UIImage imageNamed:@"微信支付"];
        //        icon2.image = [UIImage imageNamed:@"T钱包"];
        
    }
    return self;
}
- (void)closeClisck{
    
}

- (void)closeBtn{
    [self removeFromSuperview];
    if (self.noPay) {
        self.noPay();
    }
}
- (void)goPayClick{
    //去付款
    if (self.GOPayMode) {
        [self removeFromSuperview];
        [MobClick event:asdfasdfasdf2];
        self.GOPayMode(self.payType);
    }
}
//- (void)changePayBtn{
//    payType *view = [payType new];
//    view.payType = self.payType;
//    kWeakSelf(self);
//    view.SelectionPayMode = ^(NSString *type){
//        [weakself setMode:type];
//    };
//    [view windosViewshow];
//}
- (void)setOrderinfoData:(orderInfo *)orderinfoData{
    if (orderinfoData) {
        _orderinfoData = orderinfoData;
        self.name.text = orderinfoData.travelD.name;
        if (orderinfoData.travelD.isPeriod && ![self.code isEqualToString:NoStagingString]) {
            orderinfoData.firstRepayment = [orderinfoData.firstRepayment stringByReplacingOccurrencesOfString:@"元" withString:@""];
            self.money.text = [NSString stringWithFormat:@"%@元",orderinfoData.firstRepayment];
        } else {
            self.money.text = [NSString stringWithFormat:@"%.2f元",[orderinfoData.amount doubleValue]];
        }
    }
}
- (void)setDate:(myStageHome *)date{
    if (date) {
        _date = date;
        self.name.text = date.billName;
        self.money.text = [NSString stringWithFormat:@"%@元",date.periodRepaymentSum];
    }
}
- (void)setOrderok:(orderOk *)orderok{
    _orderok = orderok;
    self.type.text = orderok.paymentMethod;
}
@end
