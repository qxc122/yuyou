//
//  BottomDetailsTableViewFoot.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "BottomDetailsTableViewFoot.h"
#import "UIImage+cir.h"

@interface BottomDetailsTableViewFoot ()
@property (nonatomic, weak) UIView *line;
@property (nonatomic, weak) UIImageView *Consultationimage;
@property (nonatomic, weak) UILabel *ConsultationLabel;
@property (nonatomic, weak) UIView *right;


@property (nonatomic, weak) UIButton *ConsultationBtn;
@property (nonatomic, weak) UIButton *wantGoBtn;
@end


@implementation BottomDetailsTableViewFoot

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *line = [UIView new];
        [self addSubview:line];
        
        UIImageView *Consultationimage = [UIImageView new];
        [self addSubview:Consultationimage];
        
        UILabel *ConsultationLabel = [UILabel new];
        [self addSubview:ConsultationLabel];
        
        UIView *right = [UIView new];
        [self addSubview:right];
        
        UIButton *ConsultationBtn = [UIButton new];
        [self addSubview:ConsultationBtn];
        
        UIButton *wantGoBtn = [UIButton new];
        [self addSubview:wantGoBtn];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.equalTo(@0.5);
        }];
        [Consultationimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(ConsultationBtn);
            make.top.equalTo(line.mas_bottom).offset(7.5);
            make.width.equalTo(@19.6);
            make.height.equalTo(@18);
        }];
        [ConsultationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(ConsultationBtn);
            make.top.equalTo(Consultationimage.mas_bottom).offset(4);
        }];
        [right mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.mas_width).dividedBy(0.5);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        [ConsultationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.bottom.equalTo(self);
            make.top.equalTo(self);
            make.width.equalTo(@[wantGoBtn]);
        }];
        [wantGoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ConsultationBtn.mas_right);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.top.equalTo(self);
        }];
        
        
        line.backgroundColor = ColorWithHex(0x979797, 0.4);
        ConsultationLabel.font = PingFangSC_Regular(10);
        ConsultationLabel.textColor = ColorWithHex(0x000000, 0.54);
        Consultationimage.image = ImageNamed(@"客服");
        ConsultationLabel.text=@"咨询";
        [wantGoBtn setTitle:@"我要去" forState:UIControlStateNormal];
        [wantGoBtn setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0xFB704B, 1.0)] forState:UIControlStateNormal];
        [wantGoBtn setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        wantGoBtn.titleLabel.font = PingFangSC_Regular(17);
        [ConsultationBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [wantGoBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        ConsultationBtn.tag = Consultation_BottomDetailsTableViewFoot_type;
        wantGoBtn.tag = WantGo_BottomDetailsTableViewFoot_type;
        self.wantGoBtn = wantGoBtn;
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick(btn.tag);
    }
}
- (void)setWanTogoIsenabel:(BOOL)wanTogoIsenabel{
    _wanTogoIsenabel = wanTogoIsenabel;
    self.wantGoBtn.enabled = wanTogoIsenabel;
}
@end
