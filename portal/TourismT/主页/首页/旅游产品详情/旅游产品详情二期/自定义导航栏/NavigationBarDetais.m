//
//  NavigationBarDetais.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "NavigationBarDetais.h"


@interface NavigationBarDetais ()
@property (nonatomic, weak) UIImageView *backGroundImage; //背景图片
@property (nonatomic, weak) UIButton *back; //返回
@property (nonatomic, weak) UIButton *share;    //分享
@property (nonatomic, weak) UIButton *Collection; //收藏
@end


@implementation NavigationBarDetais

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backGroundImage = [UIImageView new];
        self.backGroundImage = backGroundImage;
        [self addSubview:backGroundImage];
        
        UIButton *back = [UIButton new];
        self.back = back;
        [self addSubview:back];
        
        UIButton *share = [UIButton new];
        self.share = share;
        [self addSubview:share];
        
        UIButton *Collection = [UIButton new];
        self.Collection = Collection;
        [self addSubview:Collection];
        
        [backGroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.left.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(back_btn_left_to_superView);
            make.top.equalTo(self).offset(back_btn_top_to_superView);
            make.width.equalTo(@(40));
            make.height.equalTo(@(40));
        }];
        
        [Collection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(share.mas_left).offset(-5);
            make.centerY.equalTo(back);
            make.width.equalTo(@(40));
            make.height.equalTo(@(40));
        }];
        
        [share mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(back);
            make.width.equalTo(@(40));
            make.height.equalTo(@(40));
        }];
        
        self.back.tag = back_NavigationBarDetais_Click_ENMU;
        self.Collection.tag = keep_NavigationBarDetais_Click_ENMU;
        self.share.tag = share_NavigationBarDetais_Click_ENMU;

        backGroundImage.image = ImageNamed(@"顶部黑色遮罩");
        IMAGEsetCONTENTMODE(backGroundImage);
        [back setImage:[UIImage imageNamed:IMAGE_back] forState:UIControlStateNormal];
        [Collection setImage:[UIImage imageNamed:@"收藏不点击"] forState:UIControlStateNormal];
        [Collection setImage:[UIImage imageNamed:@"收藏红色"] forState:UIControlStateSelected];
        [Collection setImage:[UIImage imageNamed:@"收藏红色"] forState:UIControlStateSelected];
        [share setImage:[UIImage imageNamed:@"分享白色"] forState:UIControlStateNormal];
        
        [back addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [Collection addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [share addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
   
    }
    return self;
}
- (void)BtnClick:(UIButton *)btn{
    if (self.brnClickType) {
        self.brnClickType(btn.tag);
    }
}
- (void)setAlpaImage:(CGFloat)alpaImage{
    _alpaImage = alpaImage;
    self.backGroundImage.alpha = alpaImage;
}

- (void)setIsHiden:(BOOL)isHiden{
    _isHiden = isHiden;
    self.share.hidden = isHiden;
    self.Collection.hidden = isHiden;
}
- (void)setIsFavorite:(BOOL)isFavorite{
    _isFavorite = isFavorite;
    self.Collection.selected = isFavorite;
}
@end
