//
//  myOrDetailTabHeadLine.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOrDetailTabHeadLine.h"

#define Width_iamge  20
#define Width_iamgeSmall  9


@interface myOrDetailTabHeadLine ()
@property (nonatomic,weak) UIView *line1;
@property (nonatomic,weak) UIView *line2;
@property (nonatomic,weak) UIView *line3;

@property (nonatomic,weak) UIImageView *image1;
@property (nonatomic,weak) UIImageView *image2;
@property (nonatomic,weak) UIImageView *image3;
@property (nonatomic,weak) UIImageView *image4;

@property (nonatomic,weak) UIImageView *imageCire;  //中间的蓝色图片


@property (nonatomic,weak) UILabel *des1;
@property (nonatomic,weak) UILabel *des2;
@property (nonatomic,weak) UILabel *des3;
@property (nonatomic,weak) UILabel *des4;
@end

@implementation myOrDetailTabHeadLine

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *line = [[UIView alloc]init];
        self.line = line;
        [self addSubview:line];
        
        UIView *line1 = [[UIView alloc]init];
        [self addSubview:line1];
        UIView *line2 = [[UIView alloc]init];
        [self addSubview:line2];
        UIView *line3 = [[UIView alloc]init];
        [self addSubview:line3];
        
        UIImageView *image1 = [[UIImageView alloc]init];
        [self addSubview:image1];
        
        UIImageView *image2 = [[UIImageView alloc]init];
        [self addSubview:image2];
        
        UIImageView *image3 = [[UIImageView alloc]init];
        [self addSubview:image3];
        
        UIImageView *image4 = [[UIImageView alloc]init];
        [self addSubview:image4];
        
        UIImageView *imageCire = [[UIImageView alloc]init];
        [self addSubview:imageCire];

        
        
        UIView *foot = [[UIView alloc]init];
        [self addSubview:foot];
        
        UILabel *des1 = [[UILabel alloc]init];
        [self addSubview:des1];
        UILabel *des2 = [[UILabel alloc]init];
        [self addSubview:des2];
        UILabel *des3 = [[UILabel alloc]init];
        [self addSubview:des3];
        UILabel *des4 = [[UILabel alloc]init];
        [self addSubview:des4];
        

        line1.backgroundColor = ColorWithHex(0x000000, 0.05);
        line2.backgroundColor = ColorWithHex(0x000000, 0.05);
        line3.backgroundColor = ColorWithHex(0x000000, 0.05);
        self.line1 = line1;
        self.line2 = line2;
        self.line3 = line3;
        
        self.image1 = image1;
        self.image2 = image2;
        self.image3 = image3;
        self.image4 = image4;
        self.imageCire = imageCire;
        self.des1 = des1;
        self.des2 = des2;
        self.des3 = des3;
        self.des4 = des4;

        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(ScreenWidth/4.0/2.0);
            make.right.equalTo(self).offset(-ScreenWidth/4.0/2.0);
            make.top.equalTo(self).offset(35);
            make.height.equalTo(@(2));
        }];
        
        [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(line.mas_left);
            make.centerY.equalTo(line);
            make.height.equalTo(@(Width_iamgeSmall));
            make.width.equalTo(@(Width_iamgeSmall));
        }];
        
        [image2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(image1.mas_centerX).offset(ScreenWidth/4.0);
            make.centerY.equalTo(line);
            make.height.equalTo(@(Width_iamgeSmall));
            make.width.equalTo(@(Width_iamgeSmall));
        }];
        [image3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(image4.mas_centerX).offset(-ScreenWidth/4.0);
            make.centerY.equalTo(line);
            make.height.equalTo(@(Width_iamgeSmall));
            make.width.equalTo(@(Width_iamgeSmall));
        }];
        [image4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(line.mas_right);
            make.centerY.equalTo(line);
            make.height.equalTo(@(Width_iamgeSmall));
            make.width.equalTo(@(Width_iamgeSmall));
        }];
        [imageCire mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(line.mas_right);
            make.centerY.equalTo(line);
            make.height.equalTo(@(Width_iamgeSmall));
            make.width.equalTo(@(Width_iamgeSmall));
        }];
        
        [des1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(image1);
            make.top.equalTo(line.mas_bottom).offset(10);
        }];
        [des2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(image2);
            make.top.equalTo(line.mas_bottom).offset(10);
        }];
        [des3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(image3);
            make.top.equalTo(line.mas_bottom).offset(10);
        }];
        [des4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(image4);
            make.top.equalTo(line.mas_bottom).offset(10);
        }];
        
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line);
            make.bottom.equalTo(line);
            make.left.equalTo(image1.mas_centerX);
            make.right.equalTo(image2.mas_centerX);
        }];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line);
            make.bottom.equalTo(line);
            make.left.equalTo(image2.mas_centerX);
            make.right.equalTo(image3.mas_centerX);
        }];
        [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line);
            make.bottom.equalTo(line);
            make.left.equalTo(image3.mas_centerX);
            make.right.equalTo(image4.mas_centerX);
        }];
        
        
        [foot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@(10));
        }];
        //set  ECECEC
        line.backgroundColor = ColorWithHex(0x779CF4, 1.0);
        foot.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        IMAGEsetCONTENTMODE(image1);
        IMAGEsetCONTENTMODE(image2);
        IMAGEsetCONTENTMODE(image3);
        IMAGEsetCONTENTMODE(image4);
        des1.textColor = ColorWithHex(0x779CF4, 1.0);
        des1.font = PingFangSC_Regular(12);
        des2.textColor = ColorWithHex(0x779CF4, 1.0);
        des2.font = PingFangSC_Regular(12);
        des3.textColor = ColorWithHex(0x779CF4, 1.0);
        des3.font = PingFangSC_Regular(12);
        des4.textColor = ColorWithHex(0x779CF4, 1.0);
        des4.font = PingFangSC_Regular(12);
        
//        image1.image = ImageNamed(@"123");//需要一个图片
//        image1.highlightedImage = ImageNamed(@"圆圈有边");
//        image2.image = ImageNamed(@"123");//需要一个图片
//        image2.highlightedImage = ImageNamed(@"圆圈有边");
//        image3.image = ImageNamed(@"123");//需要一个图片
//        image3.highlightedImage = ImageNamed(@"圆圈有边");
//        image4.image = ImageNamed(@"123");//需要一个图片
//        image4.highlightedImage = ImageNamed(@"圆圈有边");
        
        des1.text = @"报名成功";
        des2.text = @"等待付款";
        des3.text = @"付款成功";
        des4.text = @"待出游";
        image1.backgroundColor = ColorWithHex(0xECECEC, 1.0);
        image2.backgroundColor = ColorWithHex(0xECECEC, 1.0);
        image3.backgroundColor = ColorWithHex(0xECECEC, 1.0);
        image4.backgroundColor = ColorWithHex(0xECECEC, 1.0);
        
        line1.backgroundColor = ColorWithHex(0xECECEC, 1.0);
        line2.backgroundColor = ColorWithHex(0xECECEC, 1.0);
        line3.backgroundColor = ColorWithHex(0xECECEC, 1.0);

        self.imageCire.image = ImageNamed(@"Oval纯色蓝");
        //set  image1
        //        line.backgroundColor = ColorWithHex(0x779CF4, 1.0);
    }
    return self;
}
- (void)setDetail:(orderDeatailS *)detail{
    _detail = detail;
    if (detail) {
        if ([detail.orderD.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) {
            self.des1.textColor = ColorWithHex(0x779CF4, 1.0);
            self.des2.textColor = ColorWithHex(0x779CF4, 1.0);
            self.des3.textColor = ColorWithHex(0xECECEC, 1.0);
            self.des4.textColor = ColorWithHex(0xECECEC, 1.0);
            
            self.line1.hidden = YES;
            self.line2.hidden = NO;
            self.line3.hidden = NO;
            
            [self.image2.layer setCornerRadius:0];
            [self.image2.layer setMasksToBounds:NO];
            LRViewRadius(self.image1, Width_iamgeSmall/2.0);
            LRViewRadius(self.image3, Width_iamgeSmall/2.0);
            LRViewRadius(self.image4, Width_iamgeSmall/2.0);
            [self.image1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.line.mas_left);
                make.centerY.equalTo(self.line);
                make.height.equalTo(@(Width_iamgeSmall));
                make.width.equalTo(@(Width_iamgeSmall));
            }];
            [self.image2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.image1.mas_centerX).offset(ScreenWidth/4.0);
                make.centerY.equalTo(self.line);
                make.height.equalTo(@(Width_iamge));
                make.width.equalTo(@(Width_iamge));
            }];
            [self.imageCire mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.image2);
                make.centerY.equalTo(self.image2);
                make.height.equalTo(@(Width_iamgeSmall));
                make.width.equalTo(@(Width_iamgeSmall));
            }];
            
            [self.image3 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.image4.mas_centerX).offset(-ScreenWidth/4.0);
                make.centerY.equalTo(self.line);
                make.height.equalTo(@(Width_iamgeSmall));
                make.width.equalTo(@(Width_iamgeSmall));
            }];
            [self.image4 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.line.mas_right);
                make.centerY.equalTo(self.line);
                make.height.equalTo(@(Width_iamgeSmall));
                make.width.equalTo(@(Width_iamgeSmall));
            }];

            self.image1.backgroundColor = ColorWithHex(0x779CF4, 1.0);
            self.image3.backgroundColor = ColorWithHex(0xECECEC, 1.0);
            self.image4.backgroundColor = ColorWithHex(0xECECEC, 1.0);
            self.image2.backgroundColor = [UIColor clearColor];
            self.image2.image = ImageNamed(@"圆圈有边");
            
            self.image4.image = nil;
        } else if ([detail.orderD.orderStatus isEqualToString:TOdianping_myOreserFiveAll_type_str]){
            self.des1.textColor = ColorWithHex(0x779CF4, 1.0);
            self.des2.textColor = ColorWithHex(0x779CF4, 1.0);
            self.des3.textColor = ColorWithHex(0x779CF4, 1.0);
            self.des4.textColor = ColorWithHex(0x779CF4, 1.0);
            
            
            
            self.line1.hidden = YES;
            self.line2.hidden = YES;
            self.line3.hidden = YES;
            
            [self.image4.layer setCornerRadius:0];
            [self.image4.layer setMasksToBounds:NO];
            LRViewRadius(self.image1, Width_iamgeSmall/2.0);
            LRViewRadius(self.image2, Width_iamgeSmall/2.0);
            LRViewRadius(self.image3, Width_iamgeSmall/2.0);
            [self.image1 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.line.mas_left);
                make.centerY.equalTo(self.line);
                make.height.equalTo(@(Width_iamgeSmall));
                make.width.equalTo(@(Width_iamgeSmall));
            }];
            [self.image2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.image1.mas_centerX).offset(ScreenWidth/4.0);
                make.centerY.equalTo(self.line);
                make.height.equalTo(@(Width_iamgeSmall));
                make.width.equalTo(@(Width_iamgeSmall));
            }];
            [self.image3 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.image4.mas_centerX).offset(-ScreenWidth/4.0);
                make.centerY.equalTo(self.line);
                make.height.equalTo(@(Width_iamgeSmall));
                make.width.equalTo(@(Width_iamgeSmall));
            }];
            [self.image4 mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.line.mas_right);
                make.centerY.equalTo(self.line);
                make.height.equalTo(@(Width_iamge));
                make.width.equalTo(@(Width_iamge));
            }];
            [self.imageCire mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.image4);
                make.centerY.equalTo(self.image4);
                make.height.equalTo(@(Width_iamgeSmall));
                make.width.equalTo(@(Width_iamgeSmall));
            }];
            
            self.image1.backgroundColor = ColorWithHex(0x779CF4, 1.0);
            self.image2.backgroundColor = ColorWithHex(0x779CF4, 1.0);
            self.image3.backgroundColor = ColorWithHex(0x779CF4, 1.0);
            self.image4.backgroundColor = [UIColor clearColor];
            self.image4.image = ImageNamed(@"圆圈有边");
            self.image2.image = nil;
        }

    }
}
@end
