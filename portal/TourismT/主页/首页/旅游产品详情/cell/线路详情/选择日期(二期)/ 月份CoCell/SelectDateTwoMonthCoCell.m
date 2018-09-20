//
//  SelectDateTwoMonthCoCell.m
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "SelectDateTwoMonthCoCell.h"


@interface SelectDateTwoMonthCoCell ()
@property (nonatomic,weak) UILabel *content;
@end

@implementation SelectDateTwoMonthCoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *content = [[UILabel alloc]init];
        [self.contentView addSubview:content];

        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        self.content = content;
        
        self.content.font = PingFangSC_Regular(14);
        self.content.textColor = ColorWithHex(0x000000, 0.4);
        self.content.textAlignment = NSTextAlignmentCenter;
        self.content.highlightedTextColor = ColorWithHex(0x000000, 0.87);

        //test
//        self.content.text = NSLocalizedString(@"No staging", @"No staging");
    }
    return self;
}
- (void)setData:(priceMonthsTwoS *)data{
    _data = data;
    self.content.text = data.month;
}
@end
