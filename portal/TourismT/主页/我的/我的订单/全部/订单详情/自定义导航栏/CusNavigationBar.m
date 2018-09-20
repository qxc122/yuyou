//
//  CusNavigationBar.m
//  TourismT
//
//  Created by Store on 2017/2/20.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "CusNavigationBar.h"


@interface CusNavigationBar ()
@property (nonatomic,weak) UIButton *left;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIImageView *titleIma;
@property (nonatomic,weak) UIImageView *back;

@end

@implementation CusNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *back =[[UIImageView alloc]init];
        [self addSubview:back];
        
        UIButton *left =[[UIButton alloc]init];
        [self addSubview:left];
        
        UIButton *right =[[UIButton alloc]init];
        [self addSubview:right];
        
        UILabel *title =[[UILabel alloc]init];
        [self addSubview:title];
        
        UIImageView *titleIma =[[UIImageView alloc]init];
        [self addSubview:titleIma];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        [left mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(back_btn_left_to_superView);
//            make.top.equalTo(self).offset(back_btn_top_to_superView);
            make.centerY.equalTo(title);
            make.width.equalTo(@(60));
            make.height.equalTo(@(40));
        }];
        [right mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-back_btn_RIGHT_to_superView);
//            make.top.equalTo(self).offset(back_btn_top_to_superView);
            make.centerY.equalTo(title);
            make.width.equalTo(@(40));
            make.height.equalTo(@(40));
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(left.mas_right);
            make.centerX.equalTo(self);
            make.right.equalTo(right.mas_left);
            if (ScreenHeight==812){
                make.top.equalTo(self).offset(22+22);
            }else{
                make.top.equalTo(self).offset(22);
            }
            make.bottom.equalTo(self);
        }];
        [titleIma mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(title);
            make.width.equalTo(@(36));
            make.height.equalTo(@(36));
        }];

        
        
        back.image = ImageNamed(IMAGE_NavcBack);
        self.left = left;
        self.right = right;
        self.title = title;
        self.back =back;
        self.titleIma = titleIma;
        self.title.textAlignment = NSTextAlignmentCenter;
        [self.title settextColorhex:0xFFFFFF alpa:1.0 font:PingFangSC_Medium(17)];
        [self.left setImage:ImageNamed(IMAGE_back) forState:UIControlStateNormal];
        [self.left addTarget:self action:@selector(bubbleViewTapAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.right addTarget:self action:@selector(RightTapAction:) forControlEvents:UIControlEventTouchUpInside];
        self.right.titleLabel.font = PingFangSC_Regular(17);
        [self.right setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    }
    return self;
}
- (void)bubbleViewTapAction:(UIButton *)tapRecognizer{
    if (self.endDaojishi) {
        self.endDaojishi();
    }
}
- (void)RightTapAction:(UIButton *)tapRecognizer{
    if (self.RightendDaojishi) {
        self.RightendDaojishi();
    }
}
- (void)setTitleImaStr:(NSString *)titleImaStr{
    LRViewRadius(self.titleIma, 36/2.0);
    LRViewBorder(self.titleIma, 1.0, ColorWithHex(0xFFFFFF, 1.0));
    [self.titleIma sd_setImageWithURL:[NSURL URLWithString:titleImaStr] placeholderImage:ImageNamed(load_fail_head_image)];
}
- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.title.text = titleStr;
}
- (void)setLeftStr:(NSString *)LeftStr{
    _LeftStr = LeftStr;
     [self.left setImage:ImageNamed(LeftStr) forState:UIControlStateNormal];
}
- (void)setRightStr:(NSString *)RightStr{
    _RightStr = RightStr;
     [self.right setImage:ImageNamed(RightStr) forState:UIControlStateNormal];
}
- (void)setHidenLeft:(BOOL)hidenLeft{
    _hidenLeft = hidenLeft;
    self.left.hidden = hidenLeft;
}
- (void)setHidenMidle:(BOOL)hidenMidle{
    _hidenMidle = hidenMidle;
    self.title.hidden = hidenMidle;
}
- (void)setHidenRight:(BOOL)hidenRight{
    _hidenRight = hidenRight;
    self.right.hidden = hidenRight;
}
- (void)setHidenBack:(BOOL)hidenBack{
    _hidenBack = hidenBack;
    self.back.hidden = hidenBack;
}
- (void)setRightTitleStr:(NSString *)RightTitleStr{
    _RightTitleStr = RightTitleStr;
    [self.right  setTitle:RightTitleStr forState:UIControlStateNormal];
}
@end
