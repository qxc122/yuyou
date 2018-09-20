//
//  StagingListCell.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "StagingListCell.h"



@interface StagingListCell ()

@property (nonatomic,weak) UILabel *numberMy;
@property (nonatomic,weak) UILabel *money;
@end

@implementation StagingListCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    StagingListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[StagingListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *numberMy = [[UILabel alloc]init];
        [self.contentView  addSubview:numberMy];
        
        UILabel *money = [[UILabel alloc]init];
        [self.contentView  addSubview:money];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView  addSubview:line];
        
        [numberMy mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView ).offset(15);
            make.bottom.equalTo(self.contentView ).offset(-20);
            make.top.equalTo(self.contentView ).offset(20);
        }];
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(numberMy);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);;
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
        numberMy.textColor = ColorWithHex(0x000000, 0.54);
        numberMy.font = PingFangSC_Regular(14);
        
        money.textColor = ColorWithHex(0x000000, 0.54);
        money.font = PingFangSC_Regular(14);
        
        line.backgroundColor = ColorWithHex(0x979797, 0.2);
        
        self.numberMy = numberMy;
        self.money = money;
        
        //test;
//        numberMy.text = @"{111111}";
//        money.text = @"ads";
        
    }
    return self;
}

- (void)setDate:(jisuanInfoForOne *)date{
    if (date) {
        _date = date;
        self.numberMy.text = date.period;
        self.money.text = date.amount;
    }
}
@end
