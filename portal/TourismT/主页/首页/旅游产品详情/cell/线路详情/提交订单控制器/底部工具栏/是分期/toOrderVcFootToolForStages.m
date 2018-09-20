//
//  toOrderVcFootToolForStages.m
//  TourismT
//
//  Created by Store on 2017/4/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "toOrderVcFootToolForStages.h"


@interface toOrderVcFootToolForStages ()
@property (weak,nonatomic) UIImageView *mingxiImage;
@end


@implementation toOrderVcFootToolForStages

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *mingxilabel = [[UILabel alloc]init];
        [self addSubview:mingxilabel];
        
        UIImageView *mingxiImage = [[UIImageView alloc]init];
        self.mingxiImage = mingxiImage;
        [self addSubview:mingxiImage];
        
        UIButton *mingxiBtn = [[UIButton alloc]init];
        [self addSubview:mingxiBtn];
        
        [mingxiImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self.nextbtn.mas_left).offset(-25*WIDTHICON);
            make.width.equalTo(@9);
            make.height.equalTo(@5);
        }];
        [mingxilabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.width.equalTo(@27);
            make.right.equalTo(mingxiImage.mas_left).offset(-4);
        }];
        
        [mingxiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.left.equalTo(mingxilabel);
            make.right.equalTo(mingxiImage);
        }];
        
        [self.price mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.left.equalTo(self);
            make.right.equalTo(mingxilabel.mas_left);
        }];
        //set
        mingxiBtn.tag = view_toOrderVcFootTool_btnEnum;
        [mingxiBtn addTarget:self action:@selector(nextbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        mingxilabel.textColor  =ColorWithHex(0x000000, 1.0);
        mingxilabel.font = PingFangSC_Regular(12);
        mingxiImage.image = ImageNamed(@"底部条");
        mingxilabel.text = @"明细";
    
    }
    return self;
}
- (void)setPriceStr:(NSString *)priceStr{
    //    有可能是他图片 已经上传到iCloud  中  所以在与游中 就没显示出来
//    priceStr = @"100000.00";
    priceStr = [priceStr stringByReplacingOccurrencesOfString:@"¥" withString:@""];
    NSString *dateContent1 = @"首付";
    NSString *dateContent2 = [NSString stringWithFormat:@"¥%@",priceStr];
    NSString *all = [dateContent1 stringByAppendingString:dateContent2];
    NSRange range1 = [all rangeOfString:dateContent1];
    NSRange range2 = [all rangeOfString:dateContent2];
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 1.0),NSForegroundColorAttributeName, nil];
    [attri setAttributes:dic1 range:range1];

    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(17),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
    [attri setAttributes:dic2 range:range2];
    self.price.attributedText = attri;
    
    CGFloat childHeight1 = [NSString WidthForText:dateContent1 withFont:PingFangSC_Regular(12)];
    CGFloat childHeight2 = [NSString WidthForText:dateContent2 withFont:PingFangSC_Regular(17)];
    if (25*WIDTHICON +27+9+4+childHeight1+childHeight2+10 > ScreenWidth*0.5) {
        [self.nextbtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.right.equalTo(self);
            make.width.equalTo(@(ScreenWidth*0.5 - (25*WIDTHICON +27+9+4+childHeight1+childHeight2 - ScreenWidth*0.5)-10));
        }];
    }
    
}
- (void)setIsUp:(BOOL)isUp{
    [UIView animateWithDuration:0.3 animations:^{
        if (isUp) {
            self.mingxiImage.transform = CGAffineTransformIdentity;
        } else {
            self.mingxiImage.transform = CGAffineTransformRotate(self.mingxiImage.transform, M_PI);
        }
    }];
}
@end
