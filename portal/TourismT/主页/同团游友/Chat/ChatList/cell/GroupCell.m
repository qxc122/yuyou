//
//  GroupCell.m
//  TourismT
//
//  Created by Store on 2017/6/21.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "GroupCell.h"


#define widthGroupCellIcon  33.6f
@interface GroupCell ()
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UIImageView *icon1;
@property (nonatomic,weak) UIImageView *icon2;
@property (nonatomic,weak) UIImageView *icon3;
@property (nonatomic,weak) UIImageView *icon4;
@end

@implementation GroupCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    GroupCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[GroupCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        

        
        UIImageView *icon4 = [[UIImageView alloc] init];
        [self.contentView addSubview:icon4];
        
        UIImageView *icon2 = [[UIImageView alloc] init];
        [self.contentView addSubview:icon2];
        
        UIImageView *icon1 = [[UIImageView alloc] init];
        [self.contentView addSubview:icon1];
        
        UIImageView *icon3 = [[UIImageView alloc] init];
        [self.contentView addSubview:icon3];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(12);
            make.left.equalTo(self.contentView).offset(15);
            make.width.equalTo(@(55));
            make.height.equalTo(@(55));
        }];
        
        [icon4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-12);
            make.left.equalTo(self.contentView).offset(36.4);
            make.width.equalTo(@(widthGroupCellIcon));
            make.height.equalTo(@(widthGroupCellIcon));
        }];
        [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(12);
            make.left.equalTo(self.contentView).offset(36.4);
            make.width.equalTo(@(widthGroupCellIcon));
            make.height.equalTo(@(widthGroupCellIcon));
        }];
        [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(12);
            make.left.equalTo(self.contentView).offset(15);
            make.width.equalTo(@(widthGroupCellIcon));
            make.height.equalTo(@(widthGroupCellIcon));
        }];
        [icon3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-12);
            make.left.equalTo(self.contentView).offset(15);
            make.width.equalTo(@(widthGroupCellIcon));
            make.height.equalTo(@(widthGroupCellIcon));
        }];
        
        //set
        self.icon  =icon;
        self.icon1  =icon1;
        self.icon2  =icon2;
        self.icon3  =icon3;
        self.icon4  =icon4;
        LRViewRadius(icon, 55/2.0);
        LRViewRadius(icon1, widthGroupCellIcon/2.0);
        LRViewRadius(icon1, widthGroupCellIcon/2.0);
        LRViewRadius(icon2, widthGroupCellIcon/2.0);
        LRViewRadius(icon3, widthGroupCellIcon/2.0);
        LRViewRadius(icon4, widthGroupCellIcon/2.0);
        LRViewBorder(icon1, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        LRViewBorder(icon2, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        LRViewBorder(icon3, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        LRViewBorder(icon4, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        //tset
//        icon1.image = ImageNamed(@"1");
//        icon2.image = ImageNamed(@"1");
//        icon3.image = ImageNamed(@"1");
//        icon4.image = ImageNamed(@"1");
    }
    return self;
}
- (void)setModel:(id<IConversationModel>)model{
    [super setModel:model];
    [self setTitleAndIconMsg:model];
}

- (void)setTitleAndIconMsg:(id<IConversationModel>)model{
    NSString *EmchatId = model.conversation.conversationId;
    if ([EmchatId isEqualToString:kefu_head_emoid]) {
        model.title = kefu_name_emoid;
        model.avatarImage = ImageNamed(kefu_head_image);
    } else {
        NSString *pathUserTmp = [NSString stringWithFormat:@"%@group.data",model.conversation.conversationId];
        NSString *pathUser = [PATH_OF_DOCUMENT stringByAppendingPathComponent:pathUserTmp];
        membersGroupS *embersPe = [NSKeyedUnarchiver unarchiveObjectWithFile:pathUser];
        if (embersPe && [embersPe isKindOfClass:[membersGroupS class]]) {
            [self setdate:embersPe];
        }else{
            [self getInfo:EmchatId :pathUser];
        }
    }
}
- (void)setdate:(membersGroupS *)date{
    self.model.title = date.name;
    self.title.text = date.name;
    
    self.icon.hidden  =YES;
    self.icon1.hidden  =YES;
    self.icon2.hidden  =YES;
    self.icon3.hidden  =YES;
    self.icon4.hidden  =YES;
    if (date.membersA.count>1) {
        NSInteger index=0;
        UIImageView *tmp;
        for (groupsForOneS *one in date.membersA) {
            if (index == 0) {
                tmp = self.icon4;
            } else if (index == 1) {
                tmp = self.icon1;
            } else if (index == 2) {
                tmp = self.icon2;
            } else if (index == 3) {
                tmp = self.icon3;
            }
            tmp.hidden = NO;
            [tmp sd_setImageWithURL:[NSURL URLWithString:one.avatar] placeholderImage:ImageNamed(load_fail_head_image)];
            index++;
            if (index == 4) {
                break;
            }
        }
        self.icon1.transform = CGAffineTransformIdentity;
        self.icon2.transform = CGAffineTransformIdentity;
        self.icon3.transform = CGAffineTransformIdentity;
        self.icon4.transform = CGAffineTransformIdentity;
        if (date.membersA.count ==2) {
            self.icon1.transform = CGAffineTransformTranslate(self.icon1.transform , 0, (55-widthGroupCellIcon)/2.0);
            self.icon4.transform = CGAffineTransformTranslate(self.icon4.transform , 0, -(55-widthGroupCellIcon)/2.0);
        } else if (date.membersA.count ==3) {
            self.icon1.transform = CGAffineTransformTranslate(self.icon1.transform , 0, (55-widthGroupCellIcon));
            self.icon2.transform = CGAffineTransformTranslate(self.icon2.transform , -(55-widthGroupCellIcon)/2.0, 0);
        }
    } else  if (date.membersA.count==1){
        self.icon.hidden = NO;
        groupsForOneS *one  = [date.membersA firstObject];
        [self.icon sd_setImageWithURL:[NSURL URLWithString:one.avatar] placeholderImage:ImageNamed(load_fail_head_image)];
    }else{
        self.icon.hidden = NO;
        self.icon.image = ImageNamed(load_fail_head_image);
    }
}

- (void)getInfo:(NSString *)EmchatId :(NSString *)pathUser{
    kWeakSelf(self);
    [[ToolRequest sharedInstance] appuseremchatmembersWithidd:EmchatId NONEsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        membersGroupS *embersPeo = [membersGroupS mj_objectWithKeyValues:dataDict];
        [NSKeyedArchiver archiveRootObject:embersPeo toFile:pathUser];
        [weakself setdate:embersPeo];
    } failure:^(NSInteger errorCode, NSString *msg) {
        weakself.title.text = [NSString stringWithFormat:@"群组：%@",EmchatId];
        weakself.icon.hidden  =NO;
        weakself.icon.image  =ImageNamed(load_fail_head_image);
//        [weakself getInfo:EmchatId :pathUser];
    }];
}
@end
