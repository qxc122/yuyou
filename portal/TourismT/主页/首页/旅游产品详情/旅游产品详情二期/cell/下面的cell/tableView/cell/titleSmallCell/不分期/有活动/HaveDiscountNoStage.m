//
//  HaveDiscountNoStage.m
//  TourismT
//
//  Created by Store on 2017/8/7.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "HaveDiscountNoStage.h"


@interface HaveDiscountNoStage ()
@property (nonatomic,weak) UIView *stages;
@property (nonatomic,weak) UIImageView *stagesImage;
@property (nonatomic,weak) UILabel *stagesTitle;
@end

@implementation HaveDiscountNoStage
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    HaveDiscountNoStage *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[HaveDiscountNoStage alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        
        UIView *stages = [UIView new];
        [self.contentView addSubview:stages];
        
        UIImageView *stagesImage = [UIImageView new];
        [self.contentView addSubview:stagesImage];
        
        UILabel *stagesTitle = [UILabel new];
        [self.contentView addSubview:stagesTitle];

        [stages mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.price.mas_bottom).offset(14);
            make.height.equalTo(@50);
        }];
        [stagesImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.price);
            make.centerY.equalTo(stages);
            make.width.equalTo(@18);
            make.height.equalTo(@18);
        }];
        [stagesTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(stagesImage.mas_right).offset(6);
            make.centerY.equalTo(stages);
            make.width.equalTo(@50);
        }];

        [self.lineBottom mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(stages.mas_bottom);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@10);
        }];
        self.stages = stages;
        self.stagesImage = stagesImage;
        self.stagesTitle = stagesTitle;
        stagesTitle.font = PingFangSC_Regular(12);
        stagesTitle.textColor = ColorWithHex(0x000000, 0.54);
        self.stagesImage.image = ImageNamed(@"优惠");

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
