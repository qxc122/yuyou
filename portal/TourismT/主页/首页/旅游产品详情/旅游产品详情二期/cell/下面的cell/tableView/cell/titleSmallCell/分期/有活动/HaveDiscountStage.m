//
//  HaveDiscountStage.m
//  TourismT
//
//  Created by Store on 2017/8/7.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "HaveDiscountStage.h"



@interface HaveDiscountStage ()
@property (nonatomic,weak) UIView *stagesTwo;
@property (nonatomic,weak) UIImageView *stagesImage;
@property (nonatomic,weak) UILabel *stagesTitle;
@end

@implementation HaveDiscountStage
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    HaveDiscountStage *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[HaveDiscountStage alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *lineTwo = [UIView new];
        [self.contentView addSubview:lineTwo];
        
        UIView *stagesTwo = [UIView new];
        [self.contentView addSubview:stagesTwo];
        
        UIImageView *stagesImage = [UIImageView new];
        [self.contentView addSubview:stagesImage];
        
        UILabel *stagesTitle = [UILabel new];
        [self.contentView addSubview:stagesTitle];
        
        [lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.stagesTwo.mas_bottom);
            make.height.equalTo(@10);
        }];
        
        [stagesTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(lineTwo.mas_bottom);
            make.height.equalTo(@50);
        }];
        [stagesImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.price);
            make.centerY.equalTo(stagesTwo);
            make.width.equalTo(@18);
            make.height.equalTo(@18);
        }];
        [stagesTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(stagesImage.mas_right).offset(6);
            make.centerY.equalTo(stagesTwo);
            make.width.equalTo(@50);
        }];
        
        [self.lineBottom mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(stagesTwo.mas_bottom);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@10);
        }];
        self.stagesTwo = stagesTwo;
        self.stagesImage = stagesImage;
        self.stagesTitle = stagesTitle;
        stagesTitle.font = PingFangSC_Regular(12);
        stagesTitle.textColor = ColorWithHex(0x000000, 0.54);
        self.stagesImage.image = ImageNamed(@"优惠");
        lineTwo.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        
        //test
        //        self.stagesTitle.text = @"免息分期";
    }
    return self;
}
- (void)setData:(tourDetaisData *)data{
    [super setData:data];
    self.stagesTitle.text = data.couponDiscountStr;
}

@end
