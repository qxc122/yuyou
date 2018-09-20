//
//  myOrotherHomeHeadCoCell.m
//  TourismT
//
//  Created by Store on 2017/2/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOrotherHomeHeadCoCell.h"



@interface myOrotherHomeHeadCoCell ()
@property (nonatomic,weak) UILabel *titles;
@property (nonatomic,weak) UIImageView *more;
@end



@implementation myOrotherHomeHeadCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *su = [[UIView alloc]init];
        [self.contentView addSubview:su];
        
        UILabel *titles = [[UILabel alloc]init];
        [self.contentView addSubview:titles];
        
        UIImageView *btn = [[UIImageView alloc]init];
        [self.contentView addSubview:btn];

        [su mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.centerY.equalTo(titles).offset(0);
            make.height.equalTo(@(14));
            make.width.equalTo(@(3));
        }];
        
        [titles mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(su.mas_right).offset(12);
            make.centerY.equalTo(self.contentView).offset(0);
        }];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(self.contentView);
            make.width.equalTo(@(6));
            make.height.equalTo(@(12));
        }];
        
        //set
        btn.image = ImageNamed(@"点击");
        su.backgroundColor = ColorWithHex(0x779CF4, 1.0);
        titles.font = PingFangSC_Regular(15);
        LRViewRadius(su, 3/2.0);
        titles.textColor = ColorWithHex(0x000000, 0.87);
        self.titles = titles;
        self.more = btn;
    }
    return self;
}
- (void)setIsHidenBtn:(BOOL)isHidenBtn{
    _isHidenBtn = isHidenBtn;
    self.more.hidden = isHidenBtn;
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.titles.text = title;
}
@end
