//
//  ImageCell.m
//  TourismT
//
//  Created by Store on 16/12/17.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "ImageCell.h"



@interface ImageCell ()

@property (nonatomic,weak) UIButton *dele;
@end

@implementation ImageCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *image = [[UIImageView alloc]init];
        self.image = image;
        [self.contentView addSubview:image];
        
        
        UIButton *dele = [[UIButton alloc]init];
        [self.contentView addSubview:dele];
        dele.hidden = YES;
        self.dele = dele;
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.left.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [dele mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(5);
            make.top.equalTo(self).offset(-5);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        [dele setImage:ImageNamed(pingjia_dele_image) forState:UIControlStateNormal];
        [dele addTarget:self action:@selector(deleClick:) forControlEvents:UIControlEventTouchUpInside];
        IMAGEsetCONTENTMODE(image);
    }
    return self;
}
- (void)setIsYuan:(BOOL)isYuan{
    _isYuan = isYuan;
    LRViewRadius(self.image, self.frame.size.width/2.0);
}
- (void)setImgUrl:(NSString *)imgUrl{
    _imgUrl = imgUrl;
    [self.image sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:ImageNamed(IMAGE_bigBack)];
}
- (void)setImageDate:(UIImage *)imageDate{
    _imageDate =  imageDate;
    self.image.image = imageDate;
}

- (void)setPHAssetDate:(PHAsset *)PHAssetDate{
    _PHAssetDate = PHAssetDate;
    if (PHAssetDate) {
        kWeakSelf(self);
        [[SuPhotoManager manager] accessToImageAccordingToTheAsset:PHAssetDate size:self.frame.size resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image, NSDictionary *info) {
            if (image) {
                weakself.image.image = image;
            }
        }];
//        [[SuPhotoManager manager] fetchImageInAsset:PHAssetDate size:CGSizeMake(1000, 1000) isResize:YES completeBlock:^(UIImage *image, NSDictionary *info) {
//            self.image.image = image;
//        }];
    }
}
- (void)deleClick:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick(self.index);
    }
}
- (void)setIsHidenBtn:(BOOL)isHidenBtn{
    _isHidenBtn = isHidenBtn;
    self.dele.hidden = isHidenBtn;
}
@end
