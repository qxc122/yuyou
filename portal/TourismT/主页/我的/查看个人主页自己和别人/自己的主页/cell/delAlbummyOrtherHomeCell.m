//
//  delAlbummyOrtherHomeCell.m
//  TourismT
//
//  Created by Store on 2017/6/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "delAlbummyOrtherHomeCell.h"


@interface delAlbummyOrtherHomeCell ()
@property (nonatomic,weak) UIButton *del;
@end

@implementation delAlbummyOrtherHomeCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    delAlbummyOrtherHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[delAlbummyOrtherHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        
        UIButton *del = [[UIButton alloc]init];
        [self.contentView addSubview:del];
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15+24+19);
            make.right.equalTo(self.contentView).offset(-15+(24+19));
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];

        [del mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.width.equalTo(@24);
            make.height.equalTo(@24);
            make.centerY.equalTo(self.image);
        }];

        
        //set
        self.del  =del;
        [self.del setImage:ImageNamed(@"未选择") forState:UIControlStateNormal];
        [self.del setImage:ImageNamed(@"选中") forState:UIControlStateHighlighted];
        [self.del setImage:ImageNamed(@"选中") forState:UIControlStateSelected];
        [self.del addTarget:self action:@selector(GivethethumbsupnumClick) forControlEvents:UIControlEventTouchUpInside];
        //        点赞 点击效果
        //test
        //        image.image = ImageNamed(IMAGE_bigBack);
        //                title.text = @"mas_makeConstra mas_makeConstra";
        //        time.text = @"16-12-20";
        //        [num setTitle:@" 30" forState:UIControlStateNormal];
        
    }
    return self;
}
- (void)GivethethumbsupnumClick{
    self.del.selected =  !self.del.selected;
    if (self.delDraft) {
        self.delDraft(self.data);
    }
}
- (void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    self.del.selected = isSelect;
}
- (void)setIndexPath:(NSIndexPath *)indexPath{
    [super setIndexPath:indexPath];
    if (indexPath && indexPath.section == 0 && indexPath.row == 0) {
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15+24+19);
            make.right.equalTo(self.contentView).offset(-15+(24+19));
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
    }else{
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15+24+19);
            make.right.equalTo(self.contentView).offset(-15+(24+19));
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
    }
}
- (void)setTheLastOne:(BOOL)TheLastOne{
    [super setTheLastOne:TheLastOne];
    if (TheLastOne) {
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15+24+19);
            make.right.equalTo(self.contentView).offset(-15+(24+19));
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15-50);
        }];
    }else{
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15+24+19);
            make.right.equalTo(self.contentView).offset(-15+(24+19));
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
    }
}
@end
