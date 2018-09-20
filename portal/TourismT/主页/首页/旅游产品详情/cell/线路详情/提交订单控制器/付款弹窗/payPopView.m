//
//  payPopView.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "payPopView.h"
#import "UIImage+cir.h"
#import "payType.h"


@interface payPopView ()
//@property (nonatomic,weak) UILabel *name;
//@property (nonatomic,weak) UILabel *money;
@property (nonatomic,weak) UIImageView *typeIcon;

@end


@implementation payPopView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        

        UIImageView *typeIcon = [UIImageView new];
        [self addSubview:typeIcon];

        UIImageView *chageType = [UIImageView new];
        [self addSubview:chageType];

        
        UIButton *changePayBtn = [UIButton new];
        [self addSubview:changePayBtn];

        

        [typeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.type.mas_left).offset(-10);
            make.centerY.equalTo(self.type);
            make.width.equalTo(@19);
            make.height.equalTo(@19);
        }];

        [chageType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.type.mas_right).offset(15);
            make.centerY.equalTo(self.type);
            make.width.equalTo(@7);
            make.height.equalTo(@12);
        }];

        [changePayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(typeIcon);
            make.right.equalTo(chageType);
            make.centerY.equalTo(chageType);
            make.height.equalTo(@44);
        }];
        
        //set
        [changePayBtn addTarget:self action:@selector(changePayBtn) forControlEvents:UIControlEventTouchUpInside];

        self.typeIcon = typeIcon;
        chageType.image = ImageNamed(@"向右灰色");
        typeIcon.image = ImageNamed(@"微信支付");
        self.payType = PayType_WX;
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

- (void)changePayBtn{
    payType *view = [payType new];
    view.payType = self.payType;
    kWeakSelf(self);
    view.SelectionPayMode = ^(NSString *type){
        [weakself setMode:type];
    };
    [view windosViewshow];
}
- (void)setOrderinfoData:(orderInfo *)orderinfoData{
    [super setOrderinfoData:orderinfoData];
    [self setMode:orderinfoData.defaultPaymentPlugin];
}
- (void)setMode:(NSString *)type{
    if ([type isEqualToString:PayType_WX]) {
        self.typeIcon.image = ImageNamed(@"微信支付");
        self.type.text = @"微信支付";
        self.payType = PayType_WX;
    } else if ([type isEqualToString:PayType_Twallet]) {
        self.typeIcon.image = ImageNamed(@"T钱包");
        self.type.text = @"T钱包";
        self.payType = PayType_Twallet;
    }else{
        self.typeIcon.image = ImageNamed(@"微信支付");
        self.type.text = @"微信支付";
        self.payType = PayType_WX;
    }
}
@end
