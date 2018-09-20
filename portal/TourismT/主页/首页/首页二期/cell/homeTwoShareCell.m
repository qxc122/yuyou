//
//  homeTwoShareCell.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoShareCell.h"
#import "UIImageView+CornerRadius.h"
#import "NSString+check.h"

@interface homeTwoShareCell ()
@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) UIView *lineSamll;
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *content;
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UILabel *name;
@end

@implementation homeTwoShareCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    homeTwoShareCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[homeTwoShareCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        
        UIImageView *image = [UIImageView new];
        [self.contentView addSubview:image];
        
        UILabel *title = [UILabel new];
        [self.contentView addSubview:title];
        
        UILabel *content = [UILabel new];
        [self.contentView addSubview:content];

        UIButton *contentBtn = [UIButton new];
        [self.contentView addSubview:contentBtn];
        
        UIView *lineSamll = [UIView new];
        [self.contentView addSubview:lineSamll];
        
        UIImageView *icon = [UIImageView new];
        [self.contentView addSubview:icon];
        
        UILabel *name = [UILabel new];
        [self.contentView addSubview:name];
        
        UIButton *iconBtn = [UIButton new];
        [self.contentView addSubview:iconBtn];
        
        
        UIView *line = [UIView new];
        [self.contentView addSubview:line];

        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
            make.height.equalTo(@(80*HEIGHTICON));
            make.width.equalTo(@(100*WIDTHICON));
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(image.mas_left).offset(-15);
            make.top.equalTo(image);
        }];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(image.mas_left).offset(-15);
            make.bottom.equalTo(image);
        }];
        [contentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(image);
            make.top.equalTo(image);
            make.bottom.equalTo(image);
        }];
        
        
        [lineSamll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(content);
            make.top.equalTo(content.mas_bottom).offset(8);
            make.height.equalTo(@0.5);
            make.width.equalTo(@36);
        }];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(content);
            make.top.equalTo(lineSamll.mas_bottom).offset(12);
            make.height.equalTo(@24);
            make.width.equalTo(@24);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lineSamll.mas_right);
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(icon);
        }];
        [iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon);
            make.right.equalTo(name);
            make.centerY.equalTo(name);
            make.height.equalTo(@40);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(0);
            make.right.equalTo(self.contentView).offset(0);
            make.top.equalTo(icon.mas_bottom).offset(15);
            make.bottom.equalTo(self.contentView).offset(0);
            make.height.equalTo(@(0.5));
        }];
        
        self.image = image;
        self.name = name;
        self.title = title;
        self.content = content;
        self.icon = icon;
        self.lineSamll = lineSamll;
        self.line = line;
        //set
        
        [iconBtn addTarget:self action:@selector(iconBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [contentBtn addTarget:self action:@selector(contentBtnClick) forControlEvents:UIControlEventTouchUpInside];
        LRViewRadius(icon, 24/2.0);
//        [icon zy_cornerRadiusRoundingRect];
        IMAGEsetCONTENTMODE(image);
//        IMAGEsetCONTENTMODE(icon);
        lineSamll.backgroundColor = ColorWithHex(0x979797, 0.3);
        line.backgroundColor = ColorWithHex(0x979797, 0.3);

        title.font = PingFangSC_Medium(16);
        title.textColor = ColorWithHex(0x000000, 0.87);
        
//        self.content.lineBreakMode = NSLineBreakByCharWrapping;
//        content.font = PingFangSC_Regular(14);
//        content.textColor = ColorWithHex(0x000000, 0.54);
        name.font = PingFangSC_Regular(12);
        name.textColor = ColorWithHex(0x000000, 0.54);
        content.numberOfLines = 2;
        
        //test
//        icon.image = ImageNamed(@"背景色");
//        image.image = ImageNamed(@"背景色");
//        
//        title.text = @"adfname";
//        content.text = @"asdfstaue";
//        name.text = @"contentname";
    }
    return self;
}

- (void)contentBtnClick{
    if (self.SelectionIndex) {
        self.SelectionIndex(self.date);
    }
    
}
- (void)iconBtnClick{
    if (self.IconClick) {
//        self.IconClick(self.date.idd);
    }
}
- (void)setDate:(travelSharingsS *)date{
    if (date) {
        _date = date;
        [self.icon sd_setImageWithURL:[NSURL URLWithString:date.userAvatar] placeholderImage:ImageNamed(place_image_image)];
        [self.image sd_setImageWithURL:[NSURL URLWithString:date.coverImage] placeholderImage:ImageNamed(place_image_image)];
        self.name.text = date.username;
        self.title.text = date.title;
        
        if (date.content && date.content.length) {
            self.content.attributedText = [NSString creatStrWithText:date.content Font:PingFangSC_Regular(14) Color:ColorWithHex(0x000000, 0.54) LineSpacing:8 Alignment:NSTextAlignmentLeft BreakMode:NSLineBreakByCharWrapping firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
            self.content.lineBreakMode = NSLineBreakByTruncatingTail;
        }else{
            self.content.attributedText = nil;
        }
    }
}
@end
