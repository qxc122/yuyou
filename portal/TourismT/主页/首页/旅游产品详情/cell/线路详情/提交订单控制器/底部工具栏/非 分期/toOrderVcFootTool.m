//
//  toOrderVcFootTool.m
//  TourismT
//
//  Created by Store on 2017/4/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "toOrderVcFootTool.h"
#import "toOrderVcFootToolForStages.h"


@interface toOrderVcFootTool ()



@end

@implementation toOrderVcFootTool

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *nextbtn = [[UIButton alloc]init];
        self.nextbtn = nextbtn;
        nextbtn.tag = next_toOrderVcFootTool_btnEnum;
        [self addSubview:nextbtn];
        [nextbtn setBackgroundColor:ColorWithHex(0xFB704B, 1.0)];
        [nextbtn setTitle:@"提交订单" forState:UIControlStateNormal];
        [nextbtn setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        nextbtn.titleLabel.font = PingFangSC_Regular(17);
        [nextbtn addTarget:self action:@selector(nextbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *price = [[UILabel alloc]init];
        self.price = price;
        [self addSubview:price];

        [nextbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.right.equalTo(self);
//            make.width.height.lessThanOrEqualTo(@(ScreenWidth*0.5));
            make.width.equalTo(@(ScreenWidth*0.5));
        }];
        
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.left.equalTo(self);
            make.right.equalTo(nextbtn.mas_left);
        }];
        //set
        price.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
- (void)nextbtnClick:(UIButton *)sender{
    if (self.btnClick) {
        self.btnClick(sender.tag);
    }
}

- (void)setPriceStr:(NSString *)priceStr{
//
    if (priceStr && priceStr.length) {
        NSString *dateContent = @"总价";
        NSString *dateContent2 = @"  ¥";
        NSString *all = [dateContent stringByAppendingString:dateContent2];
        all = [all stringByAppendingString:priceStr];
        NSRange range1 = [all rangeOfString:dateContent];
        NSRange range2 = [all rangeOfString:priceStr];
        NSRange range3 = [all rangeOfString:dateContent2];
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic1 range:range1];
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Medium(20),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic2 range:range2];
        NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic3 range:range3];
        self.price.attributedText = attri;
    }
}
@end
