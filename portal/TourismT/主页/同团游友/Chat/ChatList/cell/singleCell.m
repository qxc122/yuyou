//
//  singleCell.m
//  TourismT
//
//  Created by Store on 2017/6/21.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "singleCell.h"


@interface singleCell ()
@property (nonatomic,weak) UIImageView *icon;
@end

@implementation singleCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    singleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[singleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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

        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(12);
            make.left.equalTo(self.contentView).offset(15);
            make.width.equalTo(@(55));
            make.height.equalTo(@(55));
        }];
        
        //set
        self.icon  =icon;
        LRViewRadius(icon, 55/2.0);

        //tset
//        icon.image = ImageNamed(@"1");
        

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
        self.title.text = kefu_name_emoid;
        self.icon.image = ImageNamed(kefu_head_image);
    } else {
        NSString *pathUserTmp = [NSString stringWithFormat:@"%@single.data",model.conversation.conversationId];
        NSString *pathUser = [PATH_OF_DOCUMENT stringByAppendingPathComponent:pathUserTmp];
        UserS *decodedBag = [NSKeyedUnarchiver unarchiveObjectWithFile:pathUser];
        if (decodedBag && [decodedBag isKindOfClass:[UserS class]]) {
            [self setdate:decodedBag];
        }else{
            [self getInfo:EmchatId :pathUser];
        }
        
    }
}
- (void)setdate:(UserS *)date{
    self.model.title = date.nickName?date.nickName:date.emChatId;
    self.model.avatarURLPath = date.avatar;
    if (!self.model.avatarURLPath || !self.model.avatarURLPath.length) {
        self.model.avatarImage = ImageNamed(load_fail_head_image);
    }
    if (!self.model.title || !self.model.title.length) {
        self.model.title = @"暂无昵称";
    }
    self.title.text = self.model.title;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:self.model.avatarURLPath] placeholderImage:ImageNamed(load_fail_head_image)];
}

- (void)getInfo:(NSString *)EmchatId :(NSString *)pathUser{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appuseremchatuser_infoWithidd:EmchatId success:^(id dataDict, NSString *msg, NSInteger code) {
        UserS *userInfo = [UserS mj_objectWithKeyValues:dataDict[@"user"]];
        [NSKeyedArchiver archiveRootObject:userInfo toFile:pathUser];
        [weakself setdate:userInfo];
    } failure:^(NSInteger errorCode, NSString *msg) {
        weakself.title.text = [NSString stringWithFormat:@"用户：%@",EmchatId];
        weakself.icon.image  =ImageNamed(load_fail_head_image);
//        [weakself getInfo:EmchatId :pathUser];
    }];
}

- (void)setDate:(myAppInfoS *)date{
    _date = date;
    if (date.MynewNotify) {
        if (date.messageCount && date.messageCount.length) {
            NSInteger msgNum = [date.messageCount integerValue];
            CGFloat widthNum = 0;
            if (msgNum>99) {
                self.num.text = @"99+";
                self.num.hidden = NO;
                widthNum = 31.0f;
            } else if(0<msgNum && msgNum<=99){
                self.num.hidden = NO;
                self.num.text = [NSString stringWithFormat:@"%ld",(long)msgNum];
                widthNum = 21.0f;
            } else if(0>=msgNum){
                self.num.hidden = YES;
            }
            [self.num mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.time);
                make.top.equalTo(self.title.mas_bottom).offset(15);
                make.width.equalTo(@(widthNum));
                make.height.equalTo(@(21));
            }];
        }else{
            self.num.hidden = YES;
        }
        self.time.text = date.MynewNotify.timeStr;
        self.content.text = (date.MynewNotify.content&&date.MynewNotify.content.length)?date.MynewNotify.content:@"暂无内容";
        self.title.text = date.MynewNotify.title;
        self.icon.image = ImageNamed(@"系统通知");
    }else{
        self.num.hidden = YES;
        self.title.text = @"通知";
        self.icon.image = ImageNamed(@"系统通知");
        
        self.content.text = nil;
        self.time.text = nil;
    }
}
@end
