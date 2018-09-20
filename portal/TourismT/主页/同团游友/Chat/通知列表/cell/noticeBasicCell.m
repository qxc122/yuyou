//
//  noticeBasicCell.m
//  TourismT
//
//  Created by Store on 2017/6/22.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "noticeBasicCell.h"


@interface noticeBasicCell ()

@property (nonatomic,weak) UIView *back;
@end

@implementation noticeBasicCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    noticeBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[noticeBasicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *back = [[UIView alloc]init];
        [self.contentView addSubview:back];
        
        UIImageView *more = [[UIImageView alloc]init];
        [self.contentView addSubview:more];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *content = [[UILabel alloc]init];
        [self.contentView addSubview:content];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(30);
            make.top.equalTo(self.contentView).offset(15);
            make.height.equalTo(@16);
        }];
        
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(title);
            make.right.equalTo(self.contentView).offset(-30);
            make.height.equalTo(@6.6);
            make.width.equalTo(@12);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(more);
            make.top.equalTo(title.mas_bottom).offset(15);
            make.height.equalTo(@0.5);
        }];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(more);
            make.top.equalTo(line.mas_bottom).offset(15);
            make.bottom.equalTo(self.contentView).offset(-30);
        }];
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title).offset(-15);
            make.right.equalTo(more).offset(15);
            make.top.equalTo(title).offset(-15);
            make.bottom.equalTo(self.contentView).offset(0);
        }];
//        content.backgroundColor = [UIColor redColor];
        self.content = content;
        self.back = back;
        self.title = title;
        self.more = more;
        self.line = line;
        more.contentMode = UIViewContentModeScaleAspectFill;
        self.back.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        LRViewRadius(self.back, cornerRadius_width);
        self.line.backgroundColor = ColorWithHex(0x000000, 0.08);
        [title settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];
        [content settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];
//        content.highlightedTextColor = ColorWithHex(0x000000, 0.4);
        more.image = ImageNamed(@"点击");   //向右灰色   点击3期
        //test
//        self.title.text  =@"sdfsdf";
//        self.content.text  =@"23234";
    }
    return self;
}
- (void)setOneDate:(banyouNoticationForOneS *)oneDate{
    if (oneDate) {
        _oneDate = oneDate;
        self.title.text  =oneDate.title;
        self.content.text  =oneDate.content;
        if ([oneDate.type isEqualToString:notication_order] || [oneDate.type isEqualToString:notication_repayment] || [oneDate.type isEqualToString:notication_activity] || [oneDate.type isEqualToString:notication_coupon]) {
            self.more.hidden = NO;
        }else {
            self.more.hidden = YES;
        }
        
        if (oneDate.isRead) {
            self.title.textColor = ColorWithHex(0x000000, 0.4);
            self.content.textColor = ColorWithHex(0x000000, 0.4);
        } else {
            self.title.textColor = ColorWithHex(0x000000, 0.87);
            self.content.textColor = ColorWithHex(0x000000, 0.87);
        }
    }
}

@end
