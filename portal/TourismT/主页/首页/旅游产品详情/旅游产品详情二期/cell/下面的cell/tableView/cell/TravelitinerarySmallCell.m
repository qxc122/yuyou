//
//  TravelitinerarySmallCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TravelitinerarySmallCell.h"


@interface TravelitinerarySmallCell ()

@end

@implementation TravelitinerarySmallCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    TravelitinerarySmallCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[TravelitinerarySmallCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *title = [UILabel new];
        [self.contentView addSubview:title];
        
        UIView *line = [UIView new];
        [self.contentView addSubview:line];

        UIImageView *more = [UIImageView new];
        [self.contentView addSubview:more];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(22);
        }];
        
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(title);
            make.width.equalTo(@6);
            make.height.equalTo(@12);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(title.mas_bottom).offset(22);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@10);
        }];
        //set
        more.image = ImageNamed(@"向右灰色");
        title.font = PingFangSC_Medium(16);
        title.textColor = ColorWithHex(0x000000, 0.87);
        line.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        title.text= @"行程单";
        
    }
    return self;
}

@end
