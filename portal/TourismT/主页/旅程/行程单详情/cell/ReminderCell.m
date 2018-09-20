//
//  ReminderCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "ReminderCell.h"



@interface ReminderCell ()
@property (nonatomic,weak) UIView *back;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *content;
@end

@implementation ReminderCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    ReminderCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[ReminderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *back = [[UIView alloc] init];
        [self.contentView addSubview:back];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *content = [[UILabel alloc]init];
        [self.contentView addSubview:content];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(-4);
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.right.equalTo(back).offset(-15);
            make.top.equalTo(back.mas_top).offset(13);
        }];

        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(title);
            make.top.equalTo(title.mas_bottom).offset(4);
            make.bottom.equalTo(back).offset(-15);
        }];
        //set
        self.title  =title;
        self.content  =content;
        self.back  =back;
        content.numberOfLines = 0;
        content.font = PingFangSC_Regular(14);
        title.font = PingFangSC_Regular(14);
        LRViewRadius(back, cornerRadius_width);
        content.textColor = ColorWithHex(0x000000, 0.4);
        title.textColor = ColorWithHex(0x000000, 0.4);
        back.backgroundColor = ColorWithHex(0xF2F2F2, 1.0);
        title.text = @"温馨提示";
        //test
        content.text = @"百年电电车之asdfasdfas电车之asdfasdfas车之asdfasdfasdfasdfasdf旅asdfasdf";
    }
    return self;
}

@end
