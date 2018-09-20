//
//  homeTwoWillGoCellHead.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoWillGoCellHead.h"

@interface homeTwoWillGoCellHead ()
@property (nonatomic,weak) UIButton *btn;
@property (nonatomic,weak) UIImageView *btnIcon;
@property (nonatomic,weak) UILabel *btnLabel;
@end

@implementation homeTwoWillGoCellHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *btnIcon = [UIImageView new];
        [self addSubview:btnIcon];
        
        UILabel *btnLabel = [UILabel new];
        [self addSubview:btnLabel];

        UIButton *btn = [UIButton new];
        [self addSubview:btn];
        
        [btnIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.centerY.equalTo(self.title);
            make.width.equalTo(@6);
            make.height.equalTo(@12);
        }];
        
        [btnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(btnIcon.mas_left).offset(-6);
            make.centerY.equalTo(self.title);
        }];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnLabel);
            make.right.equalTo(btnIcon);
            make.centerY.equalTo(btnLabel);
            make.height.equalTo(@40);
        }];

        btnIcon.image = ImageNamed(@"向右灰色");
        btnLabel.text = @"更多";
        btnLabel.font =PingFangSC_Regular(14);
        btnLabel.textColor =ColorWithHex(0x000000, 0.54);
        self.title.text = @"和他们一起去";
        
        btnIcon.hidden = YES;
        btnLabel.hidden = YES;
    }
    return self;
}

@end
