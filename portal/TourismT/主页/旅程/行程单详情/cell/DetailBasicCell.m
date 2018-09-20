//
//  DetailBasicCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "DetailBasicCell.h"


@interface DetailBasicCell ()

@end

@implementation DetailBasicCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    DetailBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[DetailBasicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *lineV = [[UIView alloc] init];
        [self.contentView addSubview:lineV];

        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(25);
            make.width.equalTo(@2);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];

        self.lineV  =lineV;

        
        //声明一个背景图片
        UIImage *backgroundImage = ImageNamed(@"Path 12");
        //将刚刚生成的图片转换为UIColor对象。这样便可以实现平铺了。
        UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
        [lineV setBackgroundColor:backgroundColor];
    }
    return self;
}

@end
