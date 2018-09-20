//
//  emptyMyOrOtherCell.m
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "emptyMyOrOtherCell.h"
#import "emptyMyOrOther.h"


@interface emptyMyOrOtherCell ()
@property (nonatomic,weak) emptyMyOrOther *emptyMyOrother;
@end


@implementation emptyMyOrOtherCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    emptyMyOrOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[emptyMyOrOtherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        emptyMyOrOther *emptyMyOrother =[[emptyMyOrOther alloc]init];
        [self.contentView addSubview:emptyMyOrother];
        self.emptyMyOrother = emptyMyOrother;
        [emptyMyOrother mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
    }
    return self;
}
- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    self.emptyMyOrother.imageStr = imageStr;
}
- (void)setDesStr:(NSString *)desStr{
    _desStr = desStr;
    self.emptyMyOrother.desStr = desStr;
}
@end
