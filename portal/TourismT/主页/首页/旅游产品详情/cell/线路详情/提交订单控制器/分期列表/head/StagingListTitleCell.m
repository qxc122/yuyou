//
//  StagingListTitleCell.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "StagingListTitleCell.h"



@interface StagingListTitleCell ()


@end

@implementation StagingListTitleCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    StagingListTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[StagingListTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *des = [[UILabel alloc]init];
        [self.contentView  addSubview:des];
        
        UIButton *close = [[UIButton alloc]init];
        [self.contentView  addSubview:close];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView  addSubview:line];
        
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView );
            make.bottom.equalTo(self.contentView ).offset(-20);
            make.top.equalTo(self.contentView ).offset(20);
        }];
        [close mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(17-15);
            make.centerY.equalTo(self.contentView);
            make.width.equalTo(@(12+30));
            make.height.equalTo(@(12+30));
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);;
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
        des.textColor = ColorWithHex(0x000000, 0.87);
        des.font = PingFangSC_Regular(17);
        line.backgroundColor = ColorWithHex(0x979797, 0.2);
        
        [close addTarget:self action:@selector(closeClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [close setImage:ImageNamed(@"删除") forState:UIControlStateNormal];
        //test
        des.text = @"分期详情";
    }
    return self;
}
- (void)closeClick:(UIButton *)sender{
    NSLog(@"sdfsdf");
    if (self.closeStagingList) {
        self.closeStagingList();
    }
}
@end
