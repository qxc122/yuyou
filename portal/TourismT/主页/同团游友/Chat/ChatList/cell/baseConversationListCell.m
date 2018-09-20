//
//  baseConversationListCell.m
//  TourismT
//
//  Created by Store on 2017/6/21.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "baseConversationListCell.h"
#import "ChatDemoHelper.h"

@interface baseConversationListCell ()


@property (nonatomic,weak) UIView *lineBottom;
@end

@implementation baseConversationListCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    baseConversationListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[baseConversationListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *title = [[UILabel alloc] init];
        [self.contentView addSubview:title];
        [title setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];

        UILabel *time = [[UILabel alloc] init];
        [self.contentView addSubview:time];
        
        UILabel *content = [[UILabel alloc] init];
        [self.contentView addSubview:content];
        [content setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        
        UILabel *num = [[UILabel alloc] init];
        [self.contentView addSubview:num];
        
        UIView *lineBottom = [[UIView alloc] init];
        [self.contentView addSubview:lineBottom];

        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(85);
            make.top.equalTo(self.contentView).offset(18);
            make.height.equalTo(@(16));
        }];
        
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title.mas_right).offset(5);
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(title);
        }];
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.right.equalTo(time.mas_left).offset(-5);
            make.top.equalTo(title.mas_bottom).offset(15);
        }];
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(time);
            make.top.equalTo(title.mas_bottom).offset(15);
            make.width.equalTo(@(31));
            make.height.equalTo(@(21));
        }];
        [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(time);
            make.left.equalTo(title);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(1));
        }];
        
        //set
        time.textAlignment = NSTextAlignmentRight;
        self.title  =title;
        self.time  =time;
        self.content  =content;
        self.num  =num;
        self.lineBottom  =lineBottom;
        LRViewRadius(num, 21/2.0);
        num.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        lineBottom.backgroundColor = ColorWithHex(0xEEEEEE, 1.0);
        title.font = PingFangSC_Regular(16);
        title.textColor = ColorWithHex(0x000000, 0.87);
        time.font = PingFangSC_Regular(12);
        time.textColor = ColorWithHex(0x000000, 0.3);
        content.font = PingFangSC_Regular(12);
        content.textColor = ColorWithHex(0x000000, 0.54);
        num.font = PingFangSC_Regular(12);
        num.textColor = ColorWithHex(0xFFECE7, 1.0);
        num.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        num.textAlignment = NSTextAlignmentCenter;
        self.num.hidden = YES;
        //tset
//        title.text  =@"sdfsdf";
//        time.text  =@"sdfsdf";
//        content.text  =@"sdfsdf";
//        num.text  =@"99+";
    }
    return self;
}

- (void)setModel:(id<IConversationModel>)model{
    if (model && ![model isEqual:_model]) {
        _model = model;
        [self setTimeMsg:model];
        [self setContentMsg:model];
        int msgNum = model.conversation.unreadMessagesCount;
        CGFloat widthNum = 0;
        if (msgNum>99) {
            self.num.text = @"99+";
            self.num.hidden = NO;
            widthNum = 31.0f;
        } else if(0<msgNum && msgNum<=99){
            self.num.hidden = NO;
            self.num.text = [NSString stringWithFormat:@"%d",msgNum];
            widthNum = 21.0f;
        } else if(0==msgNum){
            self.num.hidden = YES;
        }
        [self.num mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.time);
            make.bottom.equalTo(self.content);
            make.width.equalTo(@(widthNum));
            make.height.equalTo(@(21));
        }];
    }
}

- (void)setContentMsg:(id<IConversationModel>)model{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@""];
    EMMessage *lastMessage = [model.conversation latestMessage];
    if (lastMessage) {
        NSString *latestMessageTitle = @"";
        EMMessageBody *messageBody = lastMessage.body;
        switch (messageBody.type) {
            case EMMessageBodyTypeImage:{
                latestMessageTitle = NSLocalizedString(@"message.image1", @"[image]");
            } break;
            case EMMessageBodyTypeText:{
                // 表情映射。
                NSString *didReceiveText = [EaseConvertToCommonEmoticonsHelper
                                            convertToSystemEmoticons:((EMTextMessageBody *)messageBody).text];
                latestMessageTitle = didReceiveText;
                if ([lastMessage.ext objectForKey:MESSAGE_ATTR_IS_BIG_EXPRESSION]) {
                    latestMessageTitle = @"[动画表情]";
                }
            } break;
            case EMMessageBodyTypeVoice:{
                
                latestMessageTitle = NSLocalizedString(@"message.voice1", @"[voice]");
            } break;
            case EMMessageBodyTypeLocation: {
                latestMessageTitle = NSLocalizedString(@"message.location1", @"[location]");
            } break;
            case EMMessageBodyTypeVideo: {
                latestMessageTitle = NSLocalizedString(@"message.video1", @"[video]");
            } break;
            case EMMessageBodyTypeFile: {
                latestMessageTitle = NSLocalizedString(@"message.file1", @"[file]");
            } break;
            default: {
            } break;
        }
        
        //            if (lastMessage.direction == EMMessageDirectionReceive) {
        //                //            NSString *from = lastMessage.from;
        //                //            from = @"sdf";
        //                //            latestMessageTitle = [NSString stringWithFormat:@"%@: %@", from, latestMessageTitle];
        //
        //                latestMessageTitle = latestMessageTitle;
        //            }
        
        NSDictionary *ext = model.conversation.ext;
        if (ext && [ext[kHaveUnreadAtMessage] intValue] == kAtAllMessage) {
            latestMessageTitle = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"group.atAll", nil), latestMessageTitle];
            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
            [attributedStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:.0 blue:.0 alpha:0.5]} range:NSMakeRange(0, NSLocalizedString(@"group.atAll", nil).length)];
            
        }
        else if (ext && [ext[kHaveUnreadAtMessage] intValue] == kAtYouMessage) {
            latestMessageTitle = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"group.atMe", @"[Somebody @ me]"), latestMessageTitle];
            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
            [attributedStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:.0 blue:.0 alpha:0.5]} range:NSMakeRange(0, NSLocalizedString(@"group.atMe", @"[Somebody @ me]").length)];
        }
        else {
            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
        }
    }
    self.content.attributedText = attributedStr;
}
- (void)setTimeMsg:(id<IConversationModel>)model{
    NSString *latestMessageTime = @"";
    EMMessage *lastMessage = [model.conversation latestMessage];
    if (lastMessage) {
        latestMessageTime = [NSDate formattedTimeFromTimeInterval:lastMessage.timestamp];
    }
    self.time.text = latestMessageTime;
}
@end
