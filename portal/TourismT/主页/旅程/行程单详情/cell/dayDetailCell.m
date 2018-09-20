//
//  dayDetailCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "dayDetailCell.h"
#import "UIImage+cir.h"

@interface dayDetailCell ()
@property (nonatomic,weak) UIImageView *back;
@property (nonatomic,weak) UILabel *day;
@end

@implementation dayDetailCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    dayDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[dayDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *back = [[UIImageView alloc] init];
        [self.contentView addSubview:back];
        
        UILabel *day = [[UILabel alloc]init];
        [self.contentView addSubview:day];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(20);
            make.bottom.equalTo(self.contentView).offset(-25);
            make.width.equalTo(@44);
            make.height.equalTo(@30);
        }];
        
        [day mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.right.equalTo(back);
            make.top.equalTo(back);
            make.bottom.equalTo(back);
        }];
        
            //set
        self.day  =day;
        self.back  =back;
        day.textAlignment = NSTextAlignmentCenter;
        day.font = PingFangSC_Regular(14);
        day.textColor = ColorWithHex(0xFFFFFF, 0.4);
        back.image = ImageNamed(@"RectangleDay");
        //test
        day.text = @"D2";
    }
    return self;
}

@end
