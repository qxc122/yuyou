//
//  payType.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "payType.h"

@interface payType ()
@property (nonatomic,weak) UIImageView *icon1OK;
@property (nonatomic,weak) UIImageView *icon2OK;
@end



@implementation payType
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.back.layer.masksToBounds = NO;
        self.back.layer.cornerRadius = 0.0;
        self.blcak.backgroundColor = [UIColor clearColor];
        self.close.hidden = YES;
        UIButton *close = [UIButton new];
        [self addSubview:close];
        
        UILabel *title = [UILabel new];
        [self addSubview:title];
        
        UIView *line1 = [UIView new];
        [self addSubview:line1];
        
        UIImageView *icon1 = [UIImageView new];
        [self addSubview:icon1];
        UILabel *name1 = [UILabel new];
        [self addSubview:name1];
        UIImageView *icon1OK = [UIImageView new];
        [self addSubview:icon1OK];
        
        UIView *line2 = [UIView new];
        [self addSubview:line2];
        
        UIImageView *icon2 = [UIImageView new];
        icon2.hidden = YES;
        [self addSubview:icon2];
        UILabel *name2 = [UILabel new];
        name2.hidden = YES;
        [self addSubview:name2];
        UIImageView *icon2OK = [UIImageView new];
        icon2OK.hidden = YES;
        [self addSubview:icon2OK];
        
        UIView *line3 = [UIView new];
        [self addSubview:line3];
        
        UIButton *ok1 = [UIButton new];
        [self addSubview:ok1];
        UIButton *ok2 = [UIButton new];
        ok2.hidden = YES;
        [self addSubview:ok2];
        
        
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@323);
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
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(title.mas_bottom).offset(20);
        }];
        [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(name1);
            make.left.equalTo(self).offset(16);
            make.width.equalTo(@30);
            make.height.equalTo(@30); //12
        }];
        [name1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon1.mas_right).offset(12);
            make.top.equalTo(line1.mas_bottom).offset(22);
        }];
        
        [icon1OK mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(name1);
            make.right.equalTo(self).offset(-15);
            make.width.equalTo(@15);
            make.height.equalTo(@15); //12
        }];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(name1.mas_bottom).offset(23);
        }];
        
        [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(name2);
            make.left.equalTo(self).offset(16);
            make.width.equalTo(@30);
            make.height.equalTo(@30); //12
        }];
        [name2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon2.mas_right).offset(12);
            make.top.equalTo(line2.mas_bottom).offset(25);
        }];
        
        [icon2OK mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(name2);
            make.right.equalTo(self).offset(-15);
            make.width.equalTo(@15);
            make.height.equalTo(@15); //12
        }];
        [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(name2.mas_bottom).offset(20);
        }];
        [ok1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(line2.mas_top);
            make.top.equalTo(line1.mas_bottom);
            make.left.equalTo(self);
            make.right.equalTo(self);
        }];
        [ok2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(line3.mas_top);
            make.top.equalTo(line2.mas_bottom);
            make.left.equalTo(self);
            make.right.equalTo(self);
        }];
        //set
        line1.backgroundColor = ColorWithHex(0x979797, 0.2);
        line2.backgroundColor = ColorWithHex(0x979797, 0.2);
        line3.backgroundColor = ColorWithHex(0x979797, 0.2);
        
        title.textColor = ColorWithHex(0x000000, 0.87);
        title.font = PingFangSC_Regular(17);
        
        name1.textColor = ColorWithHex(0x000000, 0.87);
        name1.font = PingFangSC_Regular(15);
        name2.textColor = ColorWithHex(0x000000, 0.87);
        name2.font = PingFangSC_Regular(15);

        ok1.tag = 0;
        ok2.tag = 1;
        [ok1 addTarget:self action:@selector(changePayType:) forControlEvents:UIControlEventTouchUpInside];
        [ok2 addTarget:self action:@selector(changePayType:) forControlEvents:UIControlEventTouchUpInside];

        [close setImage:ImageNamed(@"向右灰色") forState:UIControlStateNormal];
        [close addTarget:self action:@selector(closeClisck) forControlEvents:UIControlEventTouchUpInside];
        close.transform = CGAffineTransformRotate(close.transform, M_PI);
        name1.text = @"微信支付";
        name2.text = @"T钱包";
        
        icon1.image = [UIImage imageNamed:@"微信支付"];
        icon2.image = [UIImage imageNamed:@"T钱包"];
        
        icon1OK.highlightedImage = [UIImage imageNamed:@"选中"];
        icon2OK.highlightedImage = [UIImage imageNamed:@"选中"];
//        icon1OK.highlighted = YES;
        self.icon1OK = icon1OK;
        self.icon2OK = icon2OK;
        line3.hidden = YES;
        title.text = @"选择支付方式";
        
        
    }
    return self;
}
- (void)changePayType:(UIButton *)sender{
    //去付
    if (sender.tag == 0) {
        self.payType = PayType_WX;
    } else if (sender.tag == 1) {
        self.payType = PayType_Twallet;
    }
    [self closeClisck];
}

- (void)closeClisck{
    kWeakSelf(self);
    [UIView animateWithDuration:0.3 animations:^{
        weakself.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [weakself removeFromSuperview];
    }];
    if (self.SelectionPayMode) {
        self.SelectionPayMode(self.payType);
    }
}
- (void)windosViewshow{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    self.frame = CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight);

    kWeakSelf(self);
    [UIView animateWithDuration:0.5 animations:^{
        weakself.transform = CGAffineTransformTranslate(weakself.transform, -ScreenWidth, 0);
    }];
    
}
- (void)setPayType:(NSString *)payType{
    if (payType) {
        _payType = payType;
        if ([payType isEqualToString:PayType_WX]) {
            self.icon1OK.highlighted = YES;
            self.icon2OK.highlighted = NO;
        } else if ([payType isEqualToString:PayType_Twallet]) {
            self.icon1OK.highlighted = NO;
            self.icon2OK.highlighted = YES;
        }
    }
}
@end
