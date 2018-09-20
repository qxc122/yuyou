//
//  headLastOkCell.m
//  TourismT
//
//  Created by Store on 2017/3/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "headLastOkCell.h"


@interface headLastOkCell ()
@property (nonatomic,weak) UILabel *title;
@end

@implementation headLastOkCell

+ (instancetype)returnCellWith:(UITableView *)tableView
{
    headLastOkCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[headLastOkCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(20);
            make.right.equalTo(self.contentView).offset(-20);
            make.top.equalTo(self.contentView).offset(30);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(14));
        }];
        title.textColor = ColorWithHex(0x000000, 0.56);
        title.font = PingFangSC_Regular(12);
        self.title = title;
    }
    return self;
}
- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.title.text = titleStr;
}
@end
