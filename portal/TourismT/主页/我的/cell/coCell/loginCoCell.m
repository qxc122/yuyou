//
//  loginCoCell.m
//  TourismT
//
//  Created by Store on 2017/6/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "loginCoCell.h"

@interface loginCoCell ()
@property (nonatomic,weak) UIImageView *image;
@end


@implementation loginCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *image = [[UIImageView alloc]init];
        self.image = image;
        [self.contentView addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        IMAGEsetCONTENTMODE(image);
    }
    return self;
}
- (void)setOnee:(travelSharingsS *)onee{
    _onee = onee;
    [self.image sd_setImageWithURL:[NSURL URLWithString:onee.coverImage] placeholderImage:ImageNamed(place_image_image)];
}
- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    self.image.backgroundColor = ColorWithHex(0xD8D8D8, 1.0);
    self.image.contentMode = UIViewContentModeCenter;
    self.image.image = ImageNamed(imageStr);
}
@end
