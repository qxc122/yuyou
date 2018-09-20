//
//  SelectDateTwoDateChildCoCell.m
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "SelectDateTwoDateChildCoCell.h"
#import "UIImage+cir.h"


@interface SelectDateTwoDateChildCoCell ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *date;
@property (nonatomic,weak) UILabel *price;
@property (nonatomic,weak) UILabel *num;
@end

@implementation SelectDateTwoDateChildCoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *backImage = [[UIImageView alloc]init];
        [self.contentView addSubview:backImage];
        
        UILabel *date = [[UILabel alloc]init];
        [self.contentView addSubview:date];
        
        UILabel *price = [[UILabel alloc]init];
        [self.contentView addSubview:price];
        
        UILabel *num = [[UILabel alloc]init];
        [self.contentView addSubview:num];
        
        
        [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        
        [date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.height.equalTo(@[price,num]);
        }];
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(date.mas_bottom);
        }];
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(price.mas_bottom);
            make.bottom.equalTo(self.contentView);
        }];
        
        self.backImage = backImage;
        self.date = date;
        self.price = price;
        self.num = num;
        
        self.date.font = PingFangSC_Regular(12);
        self.date.textColor = ColorWithHex(0x000000, 0.4);
        self.date.textAlignment = NSTextAlignmentCenter;
        self.date.highlightedTextColor = ColorWithHex(0x000000, 0.87);
        
        self.num.font = PingFangSC_Regular(12);
        self.num.textColor = ColorWithHex(0x000000, 0.4);
        self.num.textAlignment = NSTextAlignmentCenter;
        self.num.highlightedTextColor = ColorWithHex(0xFB704B, 1.0);
        
        self.price.font = PingFangSC_Regular(12);
        self.price.textColor = ColorWithHex(0x000000, 0.4);
        self.price.textAlignment = NSTextAlignmentCenter;
        self.price.highlightedTextColor = ColorWithHex(0xFB704B, 1.0);
        
        backImage.image = [UIImage returnImageWithImage:ImageNamed(@"未选s") WithInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
        backImage.highlightedImage = [UIImage returnImageWithImage:ImageNamed(@"选中s") WithInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
//        self.date.text = @"12";
//        self.price.text = @"5454";
//        self.num.text = @"50";
    }
    return self;
}
- (void)setData:(pricesS *)data{
    _data = data;
    if (data.date.length>2) {
        self.date.text = [data.date substringFromIndex:(data.date.length - 2)];
    } else {
        self.date.text = data.date;
    }
    self.price.text = [NSString stringWithFormat:@"¥%@",data.price];
    if (data.stock > 0) {
        self.num.text = [NSString stringWithFormat:@"余%ld",data.stock];
        self.num.highlighted = YES;
    } else {
        self.num.text = @"已售罄";
        self.num.highlighted = NO;
    }
}

- (void)setDataStr:(NSString *)dataStr{
    _dataStr = dataStr;
    self.date.text = dataStr;
}
- (void)setIsShowPic:(BOOL)isShowPic{
    _isShowPic = isShowPic;
    self.backImage.hidden = isShowPic;
    self.num.hidden = isShowPic;
    self.price.hidden = isShowPic;
}
- (void)setIsShowbackImage:(BOOL)isShowbackImage{
    _isShowbackImage = isShowbackImage;
    self.backImage.hidden = !isShowbackImage;
}

@end
