//
//  emptyMyOrOther.m
//  TourismT
//
//  Created by Store on 2017/1/18.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "emptyMyOrOther.h"


@interface emptyMyOrOther ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UILabel *des;
@end

@implementation emptyMyOrOther

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
        
        UIImageView *image =[[UIImageView alloc]init];
        [self addSubview:image];
        
        UILabel *des =[[UILabel alloc]init];
        [self addSubview:des];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).offset(93);
//            make.right.equalTo(self).offset(-93);
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-16);
//            make.height.equalTo(@(4));
        }];
        
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(93);
            make.right.equalTo(self).offset(-93);
            make.top.equalTo(image.mas_bottom).offset(15);
        }];
        self.image = image;
        self.des = des;
        des.text = @"暂无标签";
        des.textAlignment = NSTextAlignmentCenter;
//        image.image = ImageNamed(@"linewubiaoq");
        image.image = ImageNamed(None_data_place_Pic);
        IMAGEsetCONTENTMODE(image);
        [des settextColorhex:0x000000 alpa:0.25 font:PingFangSC_Regular(12)];
    }
    return self;
}
- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    self.image.image = ImageNamed(imageStr);
}
- (void)setDesStr:(NSString *)desStr{
    _desStr = desStr;
    self.des.text = desStr;
}
@end
