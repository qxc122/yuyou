//
//  SelectDateTwoTypeCoCell.m
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "SelectDateTwoTypeCoCell.h"
#import "UIImage+cir.h"

@interface SelectDateTwoTypeCoCell ()
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UILabel *content;
@end

@implementation SelectDateTwoTypeCoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *backImage = [[UIImageView alloc]init];
        [self.contentView addSubview:backImage];
        
        UILabel *content = [[UILabel alloc]init];
        [self.contentView addSubview:content];
        
        [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        self.backImage = backImage;
        self.content = content;
        
        self.content.font = PingFangSC_Regular(14);
        self.content.textColor = ColorWithHex(0x000000, 0.87);
        self.content.textAlignment = NSTextAlignmentCenter;
        self.content.highlightedTextColor = ColorWithHex(0xFB704B, 1.0);
        backImage.image = [UIImage returnImageWithImage:ImageNamed(@"未选s") WithInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
        backImage.highlightedImage = [UIImage returnImageWithImage:ImageNamed(@"选中s") WithInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
        
        //test
//        self.content.text = NSLocalizedString(@"No staging", @"No staging");
    }
    return self;
}
- (void)setData:(tourDetaisData_Specifications *)data{
    _data = data;
    self.content.text = data.name;
}
@end
