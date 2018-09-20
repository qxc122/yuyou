//
//  groupMemberCoCell.m
//  TourismT
//
//  Created by Store on 2017/6/22.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "groupMemberCoCell.h"

@interface groupMemberCoCell ()
@property (nonatomic,weak) UIImageView *avtor;
@property (nonatomic,weak) UILabel *identityMark;
@property (nonatomic,weak) UILabel *label;
@end

@implementation groupMemberCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = NO;
        
        UIImageView *avtor = [[UIImageView alloc]init];
        avtor.contentMode = UIViewContentModeScaleAspectFill;
        self.avtor = avtor;
        [self.contentView addSubview:avtor];
        
        UILabel *identityMark = [[UILabel alloc]init];
        identityMark.textAlignment = NSTextAlignmentCenter;
        self.identityMark = identityMark;
        [self.contentView addSubview:identityMark];
        
        UILabel *label = [[UILabel alloc]init];
        label.textAlignment = NSTextAlignmentCenter;
        self.label = label;
        [self.contentView addSubview:label];
        
        
        [avtor mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.height.equalTo(@55);
            make.width.equalTo(@55);
            make.top.equalTo(self.contentView);
        }];
        
        [identityMark mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(avtor);
            make.right.equalTo(avtor);
            make.bottom.equalTo(avtor);
            make.height.equalTo(@(15));
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(12));
        }];
        LRViewRadius(avtor, 55/2.0);
        avtor.contentMode = UIViewContentModeScaleAspectFill;
        identityMark.hidden = YES;
        identityMark.textColor = ColorWithHex(0xFFFFFF, 1.0);
        identityMark.font = PingFangSC_Regular(10);
        label.textColor = ColorWithHex(0x000000, 0.87);
        label.font = PingFangSC_Regular(12);
        LRViewRadius(label, cornerRadius_width*2);
        identityMark.backgroundColor = ColorWithHex(0x7692F3, 1.0);
    }
    return self;
}
- (void)setOne:(groupsForOneS *)one{
    if (one) {
        _one = one;
        [self.avtor sd_setImageWithURL:[NSURL URLWithString:one.avatar] placeholderImage:ImageNamed(place_image_image)];
        self.label.text = one.nickName?one.nickName:one.emChatId;
    }
}
@end
