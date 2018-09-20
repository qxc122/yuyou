//
//  failLoad.m
//  TourismT
//
//  Created by Store on 2017/2/8.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "failLoad.h"

@interface failLoad ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UILabel *des;
@property (nonatomic,weak) UILabel *reload;
@end


@implementation failLoad

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(243, 243, 243, 1.0);
        UIImageView *image =[[UIImageView alloc]init];
        [self addSubview:image];
        
        UILabel *des =[[UILabel alloc]init];
        [self addSubview:des];
        
        UILabel *reload =[[UILabel alloc]init];
        [self addSubview:reload];
        
        UIButton *reloadBtn =[[UIButton alloc]init];
        [self addSubview:reloadBtn];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(185));
            make.height.equalTo(@(199));
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
        }];
        
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.right.equalTo(self).offset(0);
            make.top.equalTo(image.mas_bottom).offset(0);
        }];
        [reload mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.right.equalTo(self).offset(0);
            make.top.equalTo(des.mas_bottom).offset(10);
        }];
        [reloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image).offset(0);
            make.right.equalTo(image).offset(0);
            make.top.equalTo(image).offset(0);
            make.bottom.equalTo(reload).offset(0);
        }];

        self.image = image;
        self.des = des;
        self.reload = reload;
        des.textAlignment = NSTextAlignmentCenter;
        reload.textAlignment = NSTextAlignmentCenter;
        IMAGEsetCONTENTMODE(image);
        [des settextColorhex:0x779CF4 alpa:1.0 font:PingFangSC_Regular(14)];
        [reload settextColorhex:0x779CF4 alpa:1.0 font:PingFangSC_Regular(17)];
        [reloadBtn addTarget:self action:@selector(reLoadClick:) forControlEvents:UIControlEventTouchUpInside];
        
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
- (void)setReloadStr:(NSString *)reloadStr{
    _reloadStr = reloadStr;
    self.reload.text = reloadStr;
}
- (void)reLoadClick:(UIButton *)btn{
    if (self.reLoadBtn) {
        self.reLoadBtn();
    }
}
@end
