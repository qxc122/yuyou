//
//  imageStaue.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "imageStaue.h"


@interface imageStaue ()
@property (nonatomic,weak) UILabel *des;
@property (nonatomic,weak) UIImageView *Image;
@end
@implementation imageStaue

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backImage = [[UIImageView alloc]init];
        [self addSubview:backImage];
        
        UIImageView *Image = [[UIImageView alloc]init];
        self.Image = Image;
        [self addSubview:Image];
        
        UILabel *des = [[UILabel alloc]init];
        self.des = des;
        [self addSubview:des];
        
        [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        [Image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            if (ScreenHeight==812){
                            make.top.equalTo(self).offset(HEIGHT_NavbarX);  //
            }else{
                
                make.top.equalTo(self).offset(HEIGHT_Navbar);  //
            }
//            make.height.equalTo(@(108));
//            make.width.equalTo(@(198));
            
//            make.height.equalTo(@(108));
            make.width.mas_equalTo(Image.mas_height).multipliedBy(198/108);
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(Image.mas_bottom).offset(20);
            make.bottom.equalTo(self).offset(-20);
        }];
        //set
        IMAGEsetCONTENTMODE(backImage);
        IMAGEsetCONTENTMODE(Image);
        backImage.image = ImageNamed(@"bgMyDe");
//        backImage.hidden = YES;
        
        des.textColor = ColorWithHex(0xFFFFFF, 1.0);
        des.font = PingFangSC_Medium(12);
        //test
//        Image.image = ImageNamed(@"picjianls");
//        des.text = @"订单已取消";
        
    }
    return self;
}
- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    self.Image.image = ImageNamed(imageStr);
}
- (void)setDesStr:(NSString *)desStr{
    _desStr = desStr;
    self.des.text = desStr;
}
@end
