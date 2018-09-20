//
//  AlbummyOrtherHomeCoCell.m
//  TourismT
//
//  Created by Store on 2017/2/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "AlbummyOrtherHomeCoCell.h"


@interface AlbummyOrtherHomeCoCell ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UIButton *num;
@end

@implementation AlbummyOrtherHomeCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *image = [[UIImageView alloc]init];
        [self.contentView addSubview:image];
        
        UIView *imageBack = [[UIView alloc]init];
        [self.contentView addSubview:imageBack];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *time = [[UILabel alloc]init];
        [self.contentView addSubview:time];
        
        UIButton *num = [[UIButton alloc]init];
        num.userInteractionEnabled = NO;
        [self.contentView addSubview:num];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        [imageBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image);
            make.right.equalTo(image);
            make.top.equalTo(image);
            make.bottom.equalTo(image);
        }];
        imageBack.backgroundColor = ColorWithHex(0x000000, 0.3);
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image).offset(15);
            make.right.equalTo(image).offset(-15);
            make.top.equalTo(image).offset(30);
        }];
        
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image).offset(20);
            make.bottom.equalTo(image).offset(-20);
        }];
        
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(time.mas_right).offset(30);
            make.centerY.equalTo(time);
        }];
        //set
        self.image  =image;
        self.title  =title;
        self.time  =time;
        self.num  =num;
        
        LRViewRadius(imageBack, cornerRadius_width);
        LRViewRadius(image, cornerRadius_width);
        IMAGEsetCONTENTMODE(image);
        title.font = PingFangSC_Regular(18);
        title.textColor = ColorWithHex(0xFFFFFF, 1.0);
        time.font = PingFangSC_Regular(10);
        time.textColor = ColorWithHex(0xFFFFFF, 0.53);
        [num setTitleColor:ColorWithHex(0xFFFFFF, 0.53) forState:UIControlStateNormal];
        num.titleLabel.font = PingFangSC_Regular(10);
        [num setImage:ImageNamed(@"查看眼睛") forState:UIControlStateNormal];
        //test
        //        image.image = ImageNamed(IMAGE_bigBack);
        //        title.text = @"mas_makeConstra mas_makeConstra";
        //        time.text = @"16-12-20";
        //        [num setTitle:@" 30" forState:UIControlStateNormal];
    }
    return self;
}

- (void)setOneData:(travelSharingsS *)oneData{
    _oneData = oneData;
    if (oneData) {
        NSLog(@"oneData.coverImage=%@",oneData.coverImage);
        [self.image sd_setImageWithURL:[NSURL URLWithString:oneData.coverImage] placeholderImage:ImageNamed(IMAGE_bigBack)];
        self.title.text = oneData.title;
        self.time.text = oneData.createDateStr;
        [self.num setTitle:[NSString stringWithFormat:@" %ld",oneData.hits] forState:UIControlStateNormal];
    }
}
@end
