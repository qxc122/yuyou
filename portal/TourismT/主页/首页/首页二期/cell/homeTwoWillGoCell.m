//
//  homeTwoWillGoCell.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoWillGoCell.h"
#import "UIImageView+CornerRadius.h"

@interface homeTwoWillGoCell ()
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *staue;
@property (nonatomic,weak) UIButton *followBtn;

@property (nonatomic,weak) UIView *content;
@property (nonatomic,weak) UIImageView *contentImage;
@property (nonatomic,weak) UILabel *contentname;
@property (nonatomic,weak) UILabel *contentContent;

@property (nonatomic,weak) UIView *line;
@end

@implementation homeTwoWillGoCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    homeTwoWillGoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[homeTwoWillGoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *icon = [UIImageView new];
        [self.contentView addSubview:icon];
        
        UIButton *iconBtn = [UIButton new];
        [self.contentView addSubview:iconBtn];
        
        UILabel *name = [UILabel new];
        [self.contentView addSubview:name];
        
        UILabel *staue = [UILabel new];
        [self.contentView addSubview:staue];
        
        UIButton *followBtn = [UIButton new];
        [self.contentView addSubview:followBtn];
        UIView *content = [UIView new];
        [self.contentView addSubview:content];
        UIImageView *contentImage = [UIImageView new];
        [self.contentView addSubview:contentImage];
        UILabel *contentname = [UILabel new];
        [self.contentView addSubview:contentname];
        UILabel *contentContent = [UILabel new];
        [self.contentView addSubview:contentContent];
        UIView *line = [UIView new];
        [self.contentView addSubview:line];
        
        UIButton *contentBtn = [UIButton new];
        [self.contentView addSubview:contentBtn];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(15);
            make.height.equalTo(@(48*HEIGHTICON));
            make.width.equalTo(@(48*HEIGHTICON));
        }];
        [iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon);
            make.right.equalTo(icon);
            make.top.equalTo(icon);
            make.bottom.equalTo(icon);
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon.mas_right).offset(12);
            make.top.equalTo(icon).offset(5*HEIGHTICON);
        }];
        [staue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.top.equalTo(name.mas_bottom).offset(14*HEIGHTICON);
        }];
        [followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-14);
            make.centerY.equalTo(name);
            make.width.equalTo(@(50));
            make.height.equalTo(@(24));
        }];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.right.equalTo(followBtn);
            make.top.equalTo(staue.mas_bottom).offset(16);
        }];
        [contentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(content);
            make.right.equalTo(content);
            make.top.equalTo(content);
            make.bottom.equalTo(content);
        }];
        
        [contentImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(content).offset(10);
            make.top.equalTo(content).offset(10);
            make.bottom.equalTo(content).offset(-10);
            make.height.equalTo(@(60*HEIGHTICON));
            make.width.equalTo(@(80*WIDTHICON));
        }];
        [contentname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(contentImage.mas_right).offset(10);
            make.right.equalTo(content).offset(-10);
            make.top.equalTo(contentImage);
        }];
        [contentContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(contentImage.mas_right).offset(10);
            make.right.equalTo(content).offset(-10);
            make.bottom.equalTo(contentImage);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.right.equalTo(followBtn);
            make.top.equalTo(content.mas_bottom).offset(15);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@0.5);
        }];
        
        
        
        self.icon = icon;
        self.name = name;
        self.staue = staue;
        self.followBtn = followBtn;
        self.content = content;
        self.contentImage = contentImage;
        self.contentname = contentname;
        self.contentContent = contentContent;
        self.line = line;
        
        //set
        [iconBtn addTarget:self action:@selector(iconBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [contentBtn addTarget:self action:@selector(contentBtnClick) forControlEvents:UIControlEventTouchUpInside];
        content.backgroundColor = ColorWithHex(0xF7F7F7, 1.0);
        LRViewRadius(content, cornerRadius_width);
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        [icon zy_cornerRadiusRoundingRect];
        name.font = PingFangSC_Medium(15);
        name.textColor = ColorWithHex(0x000000, 0.87);
        
        staue.font = PingFangSC_Regular(12);
        staue.textColor = ColorWithHex(0x000000, 0.54);
        
        contentname.font = PingFangSC_Regular(14);
        contentname.textColor = ColorWithHex(0x000000, 0.87);
        
        contentContent.font = PingFangSC_Regular(12);
        contentContent.textColor = ColorWithHex(0x000000, 0.54);
        
        LRViewRadius(followBtn, 24/2.0);
        followBtn.titleLabel.font = PingFangSC_Regular(12);
        staue.text = @"即将出行的旅行";
        
        [followBtn addTarget:self action:@selector(PayAttentionTo) forControlEvents:UIControlEventTouchUpInside];
        //test
        
//        icon.image = ImageNamed(@"背景色");
//        contentImage.image = ImageNamed(@"背景色");
//        name.text = @"adfname";
//        
//        contentname.text = @"contentname";
//        contentContent.text = @"contentContentasdf";
        
    }
    return self;
}

- (void)iconBtnClick{
    if (self.IconClick) {
        self.IconClick(self.date);
    }
}
- (void)contentBtnClick{
    if (self.SelectionIndex) {
        self.SelectionIndex(self.date);
    }
}
- (void)PayAttentionTo{
    self.followBtn.userInteractionEnabled = NO;
    kWeakSelf(self);
    [[ToolRequest sharedInstance]followupdateWithtravelId:self.date.idd success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD showPrompt:msg];
        weakself.date.isFollow = !weakself.date.isFollow;
        weakself.followBtn.selected = !weakself.followBtn.selected;
        [weakself setStaueForBtn];
        
        NSNotification *notification =[NSNotification notificationWithName:myselfGuanNum object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        weakself.followBtn.userInteractionEnabled = YES;
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg];
        weakself.followBtn.userInteractionEnabled = YES;
    }];
}
- (void)setDate:(UserS *)date{
    if (date) {
        _date = date;
        [self.icon sd_setImageWithURL:[NSURL URLWithString:date.avatar] placeholderImage:ImageNamed(place_image_image)];
        [self.contentImage sd_setImageWithURL:[NSURL URLWithString:date.travelImage] placeholderImage:ImageNamed(place_image_image)];
        self.name.text = date.nickName && date.nickName.length?date.nickName:date.name;
        self.contentname.text = date.travelName;
        self.contentContent.text = [NSString stringWithFormat:@"%@  |  %@",date.date,date.numbers];
        self.followBtn.selected = !date.isFollow;
        
        if (date.idd == [tourInfo sharedInstance].UserInfo.idd) {
            self.followBtn.hidden = YES;
        }else{
            [self setStaueForBtn];
            self.followBtn.hidden = NO;
        }
    }
}
- (void)setStaueForBtn{
    if (self.followBtn.selected) {
        [self guanzhu];
    } else {
        [self Noguanzhu];
    }
}

- (void)guanzhu{
    [self.followBtn setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    [self.followBtn setTitle:@"关注" forState:UIControlStateNormal];
    self.followBtn.backgroundColor = ColorWithHex(0x789BF1, 1.0);
    LRViewBorder(self.followBtn, 0.0, [UIColor clearColor]);
}
- (void)Noguanzhu{
    [self.followBtn setTitleColor:ColorWithHex(0x000000, 0.3) forState:UIControlStateNormal];
    [self.followBtn setTitle:@"已关注" forState:UIControlStateNormal];
    self.followBtn.backgroundColor = [UIColor clearColor];
    LRViewBorder(self.followBtn, 0.5, ColorWithHex(0xB8B8B8, 1.0));
}
@end
