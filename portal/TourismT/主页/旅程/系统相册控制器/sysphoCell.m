//
//  sysphoCell.m
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "sysphoCell.h"

@interface sysphoCell ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UIButton *imageRight;
@end

@implementation sysphoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //self.backgroundColor = [UIColor redColor];
        UIImageView *image = [[UIImageView alloc]init];
        image.userInteractionEnabled = YES;
        self.image = image;
        [self.contentView addSubview:image];
        IMAGEsetCONTENTMODE(image);
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        
        UIButton *imageRight = [[UIButton alloc]init];
        imageRight.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageRight setImageEdgeInsets:UIEdgeInsetsMake(14.5, 14.5, 14.5, 14.5)];
        [imageRight addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.imageRight = imageRight;
        [self.contentView addSubview:imageRight];
        [imageRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(10);
            make.top.equalTo(self.contentView).offset(-10);;
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];

        //test
//        image.image = ImageNamed(@"456");
    }
    return self;
}
- (void)setImageDate:(UIImage *)imageDate{
    _imageDate = imageDate;
    self.image.image = imageDate;
}
- (void)setCollectionType:(collection_ENMU)collectionType{
    _collectionType = collectionType;
    if (collectionType == one_collection_ENMU) {
        [self.imageRight setImage:ImageNamed(@"选择框") forState:UIControlStateNormal];
        [self.imageRight setImage:ImageNamed(@"选中") forState:UIControlStateHighlighted];
        [self.imageRight setImage:ImageNamed(@"选中") forState:UIControlStateSelected];
    } else if(collectionType == two_collection_ENMU){
        [self.imageRight setImage:ImageNamed(@"删除phon") forState:UIControlStateNormal];
    }
}
- (void)btnClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (self.cellClick) {
        self.cellClick(self.indexPath,self.PHAssetDate,self.collectionType,btn.selected);
    }
}
- (void)setIsSelcet:(BOOL)isSelcet{
    _isSelcet = isSelcet;
    self.imageRight.selected = isSelcet;
}
- (void)setIsEdit:(BOOL)isEdit{
    _isEdit = isEdit;
    self.imageRight.hidden = isEdit;
}
- (void)setPHAssetDate:(PHAsset *)PHAssetDate{
    _PHAssetDate = PHAssetDate;
    
    if (PHAssetDate) {
        kWeakSelf(self);
//        CGSize  size = self.frame.size;
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
@end
