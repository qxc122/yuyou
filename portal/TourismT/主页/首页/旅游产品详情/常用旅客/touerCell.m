//
//  touerCell.m
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "touerCell.h"


typedef NS_ENUM(NSInteger, btntouerCell_ENMU)
{
    editBtn_btntouerCell_ENMU,//编辑
    deleteBtn_btntouerCell_ENMU,//删除
};

@interface touerCell ()
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *crarType;
@property (nonatomic,weak) UILabel *crarNumber;
@property (nonatomic,weak) UIButton *okGo;
@end

@implementation touerCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    touerCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[touerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        UIView *backWhile = [[UIView alloc]init];
        [self.contentView addSubview:backWhile];

        UIButton *okGoTwo = [[UIButton alloc]init];
        [okGoTwo addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:okGoTwo];
        
        UIButton *okGo = [[UIButton alloc]init];
        okGo.userInteractionEnabled = NO;
        self.okGo = okGo;
        [okGo setImage:ImageNamed(@"选择框空心") forState:UIControlStateNormal];
        [okGo setImage:ImageNamed(@"选中") forState:UIControlStateHighlighted];
        [okGo setImage:ImageNamed(@"选中") forState:UIControlStateSelected];

        [self.contentView addSubview:okGo];
        
        UILabel *name = [[UILabel alloc]init];
        [self.contentView addSubview:name];
        
        UILabel *crarType = [[UILabel alloc]init];
        [self.contentView addSubview:crarType];
        
        UILabel *crarNumber = [[UILabel alloc]init];
        [self.contentView addSubview:crarNumber];
        
        UIButton *deleteBtn = [[UIButton alloc]init];
        deleteBtn.tag = deleteBtn_btntouerCell_ENMU;
        [self.contentView addSubview:deleteBtn];
        [deleteBtn setImage:ImageNamed(@"垃圾桶 (1)") forState:UIControlStateNormal];
        [deleteBtn addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *editBtn = [[UIButton alloc]init];
        [self.contentView addSubview:editBtn];
        editBtn.tag = editBtn_btntouerCell_ENMU;
        [editBtn setImage:ImageNamed(@"编辑cylyr") forState:UIControlStateNormal];
        [editBtn addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [backWhile mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(0);
        }];
        [okGoTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backWhile).offset(0);
            make.right.equalTo(backWhile).offset(0);
            make.top.equalTo(backWhile).offset(0);
            make.bottom.equalTo(backWhile).offset(0);
        }];
        
        [okGo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backWhile).offset(15);
            make.centerY.equalTo(backWhile);
            make.width.equalTo(@(15));
            make.height.mas_equalTo(okGo.mas_width).multipliedBy(1.0);
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(okGo.mas_right).offset(15);
            make.right.equalTo(editBtn.mas_left).offset(-5);
            make.top.equalTo(backWhile.mas_top).offset(15);
        }];
        
        [crarType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.width.equalTo(@60);
            make.top.equalTo(name.mas_bottom).offset(15);;
        }];
        
        [crarNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(crarType.mas_right).offset(15);
//            if (ScreenWidth==320) {
                make.right.equalTo(backWhile).offset(-15);
//            }
            make.centerY.equalTo(crarType);
            make.bottom.equalTo(backWhile).offset(-15);
        }];
        
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(backWhile).offset(0);
            make.top.equalTo(backWhile).offset(5);
            make.width.equalTo(@(44));
            make.height.mas_equalTo(deleteBtn.mas_width).multipliedBy(1.0);
        }];
        
        [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(deleteBtn.mas_left).offset(-0);
            make.centerY.equalTo(deleteBtn).offset(0);
            make.width.equalTo(deleteBtn);
            make.height.mas_equalTo(editBtn.mas_width).multipliedBy(1.0);
        }];
        
        self.crarType = crarType;
        self.name = name;
        self.crarNumber = crarNumber;
        backWhile.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        LRViewRadius(backWhile, cornerRadius_width);
        name.numberOfLines = 0;

        
        name.font = PingFangSC_Regular(14);
        name.textColor = ColorWithHex(0x000000, 0.86);
        crarType.font = PingFangSC_Regular(14);
        crarType.textColor = ColorWithHex(0x000000, 0.86);
//        crarNumber.font = PingFangSC_Medium(14);
        crarNumber.font = [UIFont systemFontOfSize:14];
        crarNumber.textColor = ColorWithHex(0x000000, 0.86);

        //test
//        name.text = @"Angelababy";
//        crarNumber.text = @"E37389133";
//        crarType.text = @"僧分钟";
    }
    return self;
}
- (void)editBtnClick:(UIButton *)btn{
    //TODO
    if (btn.tag == editBtn_btntouerCell_ENMU) {
        if (self.editTouerClick) {
            self.editTouerClick(self.index,self.peopleOne);
        }
    } else if (btn.tag == deleteBtn_btntouerCell_ENMU){
        if (self.deleteTouerClick) {
            self.deleteTouerClick(self.index,self.peopleOne);
        }
    }
}
- (void)BtnClick:(UIButton *)sender{
    self.okGo.selected = !self.okGo.selected;
    if (self.touerGOTOClick) {
        self.touerGOTOClick(self.index,self.okGo.selected,self.peopleOne);
    }
//    选中表示去  idMyGo ＝ YES;
}
- (void)setPeopleOne:(travellerS *)peopleOne{
    _peopleOne = peopleOne;
    if ([peopleOne.idType isEqualToString:SFZ]) {
        self.crarType.text = @"身份证";
        self.crarNumber.text = peopleOne.idNumber;
        self.name.text = peopleOne.realname;
    }else  if ([peopleOne.idType isEqualToString:GUOJIHUzhao]) {
        self.crarType.text = @"护照号码";
        self.crarNumber.text = peopleOne.passportNumber;
        self.name.text = [NSString stringWithFormat:@"%@ / %@",peopleOne.firstname,peopleOne.lastname];
    }
}
- (void)setIdMyGo:(BOOL)idMyGo{
    _idMyGo = idMyGo;
    self.okGo.selected = idMyGo;
}
@end
