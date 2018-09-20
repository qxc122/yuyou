/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import "ConversationListController.h"
#import "login.h"
#import "ChatViewController.h"
#import "noticeVc.h"
//#import "RobotManager.h"
//#import "RobotChatViewController.h"
//#import "UserProfileManager.h"
//#import "RealtimeSearchUtil.h"
//#import "RedPacketChatViewController.h"
#import "ChatDemoHelper.h"

//#import "UIViewController+SearchController.h"

#import "GroupCell.h"
#import "singleCell.h"
@interface ConversationListController ()<EaseConversationListViewControllerDelegate, EaseConversationListViewControllerDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong) UIView *networkStateView;
//@property (nonatomic,weak) UITableView *basicTableView;


@property (nonatomic,strong) myAppInfoS *date;
@end

@implementation ConversationListController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    // Do any additional setup after loading the view.
    self.showRefreshHeader = YES;
    self.delegate = self;
    self.dataSource = self;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    [self networkStateView];

    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self tableViewDidTriggerHeaderRefresh];
//    [self removeEmptyConversationsFromDB]; //移动到了will中
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(LoginAndExitNoticeFuc:)
                                                 name:LoginAndExitNotice
                                               object:nil];
   // [[NSNotificationCenter defaultCenter] addObserver:self
      //                                       selector:@selector(MorepersonalinformationHeadNoticeFunc:)
               //                                  name:MorepersonalinformationHeadNotice
         //                                      object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(HyunreadCountFuc:)
                                                 name:HyunreadCount
                                               object:nil];
}


#pragma --mark<消息数量>
- (void)HyunreadCountFuc:(NSNotification *)user{
//    [self.tableView reloadData];
    [self refreshDataSource];
}


/*
#pragma --mark<更该 头像 >
- (void)MorepersonalinformationHeadNoticeFunc:(NSNotification *)user{
    appS *decodedBag = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_userForApp];
    [self.tableView reloadData];
}
*/


#pragma --mark<登录退出的通知>
- (void)LoginAndExitNoticeFuc:(NSNotification *)user{
//    self.tableView.mj_header.hidden = NO;
//    [self.tableView.mj_header beginRefreshing];
    [self refreshDataSource];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshDataSource];
    if ([tourInfo sharedInstance].UserInfo) { // && !self.date
        [self loadTongzhi];
    }
//    if ([tourInfo sharedInstance].UserInfo) {
//    } else {   //退出了
//        kWeakSelf(self);
//        [[tourHelper sharedInstance]HylogOutmsg:nil  isToken:NO  loginSuccess:^(NSString *msg) {
//            [weakself refreshDataSource];
//        } loginFailure:^(NSString *msg) {
////            [MBProgressHUD showPrompt:msg toView:weakself.view];
//        }];
//    }
    
//    [self removeEmptyConversationsFromDB];
//    [self refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)removeEmptyConversationsFromDB
{
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSMutableArray *needRemoveConversations;
    for (EMConversation *conversation in conversations) {
        if (!conversation.latestMessage || (conversation.type == EMConversationTypeChatRoom)) {
            if (!needRemoveConversations) {
                needRemoveConversations = [[NSMutableArray alloc] initWithCapacity:0];
            }
            
            [needRemoveConversations addObject:conversation];
        }
    }
    
    if (needRemoveConversations && needRemoveConversations.count > 0) {
        [[EMClient sharedClient].chatManager deleteConversations:needRemoveConversations isDeleteMessages:YES completion:nil];
    }
}

#pragma mark - getter

- (UIView *)networkStateView
{
    if (_networkStateView == nil) {
        _networkStateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
        _networkStateView.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:199 / 255.0 blue:199 / 255.0 alpha:0.5];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (_networkStateView.frame.size.height - 20) / 2, 20, 20)];
        imageView.image = [UIImage imageNamed:@"messageSendFail"];
        [_networkStateView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 5, 0, _networkStateView.frame.size.width - (CGRectGetMaxX(imageView.frame) + 15), _networkStateView.frame.size.height)];
        label.font = [UIFont systemFontOfSize:15.0];
        label.textColor = [UIColor grayColor];
        label.backgroundColor = [UIColor clearColor];
        label.text = NSLocalizedString(@"network.disconnection", @"Network disconnection");
        [_networkStateView addSubview:label];
    }
    
    return _networkStateView;
}

#pragma mark - EaseConversationListViewControllerDelegate

- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
            didSelectConversationModel:(id<IConversationModel>)conversationModel
{
    if (conversationModel) {
        EMConversation *conversation = conversationModel.conversation;
        if (conversation) {

                ChatViewController *chatController = nil;
#ifdef REDPACKET_AVALABLE
                chatController = [[RedPacketChatViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
#else
                chatController = [[ChatViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
//                [ChatDemoHelper shareHelper].chatVC = (ChatViewController *)chatController;
#endif
                chatController.title = conversationModel.title;
//                EaseConversationModel *modelTmp = (EaseConversationModel *)conversationModel;
            chatController.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:chatController animated:YES];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setupUnreadMessageCount" object:nil];
        [self.tableView reloadData];
    }
}
//#pragma --mark<根据环信id 查找用户的信息>
//- (void)getUserInfoWithEmchatId:(NSString *)EmchatId{
//   [[ToolRequest sharedInstance]appuseremchatuser_infoWithidd:EmchatId success:^(id dataDict, NSString *msg, NSInteger code) {
////       UserS *userInfo = [UserS mj_objectWithKeyValues:dataDict];
//       
//       NSLog(@"sdf");
//   } failure:^(NSInteger errorCode, NSString *msg) {
//       NSLog(@"sdf");
//   }];
//}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([[tourHelper sharedInstance]judgeisLogin]) {//登录
        return 2;
    }
    return 0;
}

- (void)loadTongzhi{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appuserindexWithsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.date = [myAppInfoS mj_objectWithKeyValues:dataDict];
//        if (!weakself.date.MynewNotify) {
//            banyouNoticationForOneS *tmp = [banyouNoticationForOneS new];
//            tmp.title = @"通知";
//            weakself.date.MynewNotify = tmp;
//        }
        [weakself.tableView reloadData];
//        [weakself.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return [self.dataArray count];
    }
    return 0;
    // Return the number of rows in the section.
}

#pragma --mark<cell 创建>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cellRes;
    if (indexPath.section == 0) {
        singleCell *cell = [singleCell returnCellWith:tableView];
        [self configuresingleCell:cell atIndexPath:indexPath];
        cellRes = cell;
    } else if (indexPath.section == 1) {
        id<IConversationModel> model = [self.dataArray objectAtIndex:indexPath.row];
        if (model.conversation.type == EMConversationTypeChat) {
            singleCell *cell = [singleCell returnCellWith:tableView];
            [self configuresingleCell:cell atIndexPath:indexPath];
            cellRes = cell;
        }else{
            GroupCell *cell = [GroupCell returnCellWith:tableView];
            [self configureGroupCell:cell atIndexPath:indexPath];
            cellRes =  cell;
        }
    }
    return cellRes;
}
#pragma --mark< 配置cell 的数据>
- (void)configureGroupCell:(GroupCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.model = self.dataArray[indexPath.row];
}
#pragma --mark< 配置cell 的数据>
- (void)configuresingleCell:(singleCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        cell.date = self.date;
    } else if (indexPath.section == 1) {
        cell.model = self.dataArray[indexPath.row];
    }
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55+24;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        noticeVc *vc = [noticeVc new];
//        kWeakSelf(self);
//        vc.noticeVcLook = ^{
//            [weakself loadTongzhi];
//        };
//        self.date.messageCount = @"0";
//        [self.tableView reloadData];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 1) {
        [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {

    } else if (indexPath.section == 1 && indexPath.row != 0) {
        return YES;
    }
    return NO;
}


#pragma mark - EaseConversationListViewControllerDataSource

- (id<IConversationModel>)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
                                    modelForConversation:(EMConversation *)conversation
{
    EaseConversationModel *model = [[EaseConversationModel alloc] initWithConversation:conversation];
    
    NSLog(@"conversation.type=%u",conversation.type);
            NSLog(@"sdfsdf model.conversation.conversationId=%@",model.conversation.conversationId);
    if (model.conversation.type == EMConversationTypeChat) {
            NSString *EmchatId = model.conversation.conversationId;
            if ([EmchatId isEqualToString:kefu_head_emoid]) {
                model.title = kefu_name_emoid;
                model.avatarImage = ImageNamed(kefu_head_image);
            } else {
                NSString *pathUserTmp = [NSString stringWithFormat:@"%@single.data",EmchatId];
                NSString *pathUser = [PATH_OF_DOCUMENT stringByAppendingPathComponent:pathUserTmp];
                UserS *decodedBag = [NSKeyedUnarchiver unarchiveObjectWithFile:pathUser];
                //TODO
//                decodedBag = nil;
                if (decodedBag && [decodedBag isKindOfClass:[UserS class]]) {
                    //qxc model.userInfoBy = decodedBag;
                    model.title = decodedBag.nickName?decodedBag.nickName:decodedBag.emChatId;
                    model.avatarURLPath = decodedBag.avatar;
                    if (!model.avatarURLPath || !model.avatarURLPath.length) {
                        model.avatarImage = ImageNamed(load_fail_head_image);
                    }
                    if (!model.title || !model.title.length) {
                        model.title = @"暂无昵称";
                    }
                }
                NSInteger index = [self.dataArray indexOfObject:model];
//                [self getGroupForOneDate:EmchatId isNeedRefresh:decodedBag?NO:YES path:pathUser index:index];
            }
    } else if (model.conversation.type == EMConversationTypeGroupChat) {
#pragma --mark<获取群成员所有信息>
        EMGroup *group = [EMGroup groupWithId:model.conversation.conversationId];
        model.title = group.subject;
        NSLog(@"group.subject 组名字 =%@",group.subject);
        
        NSString *pathUserTmp = [NSString stringWithFormat:@"%@group.data",model.conversation.conversationId];
        NSString *pathUser = [PATH_OF_DOCUMENT stringByAppendingPathComponent:pathUserTmp];
        membersGroupS *embersPe = [NSKeyedUnarchiver unarchiveObjectWithFile:pathUser];
        //TODO
//        embersPe = nil;
        if (embersPe  && [embersPe isKindOfClass:[membersGroupS class]]) {
            NSMutableArray *muArry = [NSMutableArray array];
            for (groupsForOneS *one in embersPe.membersA) {
                [muArry addObject:one.avatar];
            }
            //qxc model.avatarImageS = muArry;
            //model.avatarAndName = embersPeo.membersA;
            if (!group.subject || !group.subject.length) {
                model.title = embersPe.name;
            }
            
           //qxc  model.dateIcon = embersPe;
        }
        NSInteger index = [self.dataArray indexOfObject:model];
//        [self getGroupDate:model.conversation.conversationId isNeedRefresh:embersPe?NO:YES path:pathUser index:index];
    }
    return model;
}
//- (void)getGroupForOneDate:(NSString *)idd isNeedRefresh:(BOOL)isNeedRefresh  path:(NSString *)path index:(NSInteger)index{
//    kWeakSelf(self);
//    [[ToolRequest sharedInstance]appuseremchatuser_infoWithidd:idd success:^(id dataDict, NSString *msg, NSInteger code) {
//        UserS *userInfo = [UserS mj_objectWithKeyValues:dataDict[@"user"]];
//        [NSKeyedArchiver archiveRootObject:userInfo toFile:path];
//        if (isNeedRefresh) {
////            [self.tableView reloadData];
//            [weakself refreshDataSource];
////            [weakself.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//            NSLog(@"sdfsdf index=%ld",index);
//        }
//    } failure:^(NSInteger errorCode, NSString *msg) {
//        [weakself getGroupForOneDate:idd isNeedRefresh:isNeedRefresh path:path index:index];
////        XAlertView *aler =[[XAlertView alloc]initWithTitle:@"个人信息失败" message:@"重新加载" clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
////            if (!canceled) {
////                [weakself getGroupForOneDate:idd isNeedRefresh:isNeedRefresh path:path index:index];
////            }
////        } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
////        [aler show];
//    }];
//}
//
//- (void)getGroupDate:(NSString *)idd isNeedRefresh:(BOOL)isNeedRefresh  path:(NSString *)path index:(NSInteger)index{
//    kWeakSelf(self);
//    [[ToolRequest sharedInstance] appuseremchatmembersWithidd:idd NONEsuccess:^(id dataDict, NSString *msg, NSInteger code) {
//        membersGroupS *embersPeo = [membersGroupS mj_objectWithKeyValues:dataDict];
//        [NSKeyedArchiver archiveRootObject:embersPeo toFile:path];
//        if (isNeedRefresh) {
//            [weakself refreshDataSource];
////            [weakself.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
//        }
//    } failure:^(NSInteger errorCode, NSString *msg) {
//        //         [weakself getGroupDate:idd isNeedRefresh:isNeedRefresh path:path index:index];
//        [MBProgressHUD showPrompt:msg toView:weakself.view];
//        //        XAlertView *aler =[[XAlertView alloc]initWithTitle:@"个人信息失败" message:@"重新加载" clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
//        //            if (!canceled) {
//        //                [weakself getGroupDate:idd isNeedRefresh:isNeedRefresh path:path index:index];
//        //            }
//        //        } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        //        [aler show];
//    }];
//}

/*

- (NSAttributedString *)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
      latestMessageTitleForConversationModel:(id<IConversationModel>)conversationModel
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@""];
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];
    if (lastMessage) {
        NSString *latestMessageTitle = @"";
        EMMessageBody *messageBody = lastMessage.body;
        switch (messageBody.type) {
            case EMMessageBodyTypeImage:{
                latestMessageTitle = @"[图片]";
//                latestMessageTitle = NSLocalizedString(@"message.image1", @"[image]");
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
                latestMessageTitle = @"[视频]";
//                latestMessageTitle = NSLocalizedString(@"message.video1", @"[video]");
            } break;
            case EMMessageBodyTypeFile: {
                latestMessageTitle = NSLocalizedString(@"message.file1", @"[file]");
            } break;
            default: {
            } break;
        }
        
        if (lastMessage.direction == EMMessageDirectionReceive) {
//            NSString *from = lastMessage.from;
//            from = @"sdf";
//            latestMessageTitle = [NSString stringWithFormat:@"%@: %@", from, latestMessageTitle];
            
            latestMessageTitle = latestMessageTitle;
        }
        
        NSDictionary *ext = conversationModel.conversation.ext;
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
    
    return attributedStr;
}

- (NSString *)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
       latestMessageTimeForConversationModel:(id<IConversationModel>)conversationModel
{
    NSString *latestMessageTime = @"";
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];;
    if (lastMessage) {
        latestMessageTime = [NSDate formattedTimeFromTimeInterval:lastMessage.timestamp];
    }

    
    return latestMessageTime;
}

*/


#pragma mark - public

-(void)refresh
{
    [self refreshAndSortView];
}

-(void)refreshDataSource
{
    [self tableViewDidTriggerHeaderRefresh];
    //TODO  把客服放到最上面
//    NSInteger index=0;
//    for ( id<IConversationModel> model in self.dataArray) {
//        if (model.conversation.type == EMConversationTypeChat) {
//            NSLog(@"%@",model.conversation.conversationId);
//            if ([model.conversation.conversationId isEqualToString:kefu_head_emoid]) {
//                [self.dataArray exchangeObjectAtIndex:0 withObjectAtIndex:index];
//                [self.tableView reloadData];
//                break;
//            }
//            index++;
//        }
//    }
}

- (void)isConnect:(BOOL)isConnect{
    if (!isConnect) {
        self.tableView.tableHeaderView = _networkStateView;
    }
    else{
        self.tableView.tableHeaderView = nil;
    }
    
}

- (void)networkChanged:(EMConnectionState)connectionState
{
    if (connectionState == EMConnectionDisconnected) {
        self.tableView.tableHeaderView = _networkStateView;
    }
    else{
        self.tableView.tableHeaderView = nil;
    }
}


#pragma --<空白页处理>
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:chat_place_Pic];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"亲，暂无聊天记录哦\n快去寻找你的游友吧";
    NSDictionary *attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                                 NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    if (ScreenHeight==812){
        return -HEIGHT_NavbarX*0.5;
    }else{
        return -HEIGHT_Navbar*0.5;
    }

}

- (void)loadNewDataConversationListController{
    [self tableViewDidTriggerHeaderRefresh];
}
//空白页的背景色

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor clearColor];
}

//是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return YES;
}

//空白页点击事件
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
    [self DidTap];
}

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{
    [self DidTap];
}
- (void)DidTap{
    if (![tourHelper sharedInstance].judgeisLogin) {
        login *losgin = [[login alloc]init];
        UINavigationController *nnvc = [[UINavigationController alloc]initWithRootViewController:losgin];;
        [self presentViewController:nnvc animated:YES completion:nil];
    }
}

#pragma --mark<重写父类方法>
- (void)tableViewDidTriggerHeaderRefresh
{
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSArray* sorted = [conversations sortedArrayUsingComparator:
                       ^(EMConversation *obj1, EMConversation* obj2){
                           EMMessage *message1 = [obj1 latestMessage];
                           EMMessage *message2 = [obj2 latestMessage];
                           if(message1.timestamp > message2.timestamp) {
                               return(NSComparisonResult)NSOrderedAscending;
                           }else {
                               return(NSComparisonResult)NSOrderedDescending;
                           }
                       }];
    

    NSMutableArray *sortedCopy = [NSMutableArray arrayWithArray:sorted];
    BOOL isHaveKefu = NO;
    NSInteger indexKefu=0;
    for (EMConversation *converstion in sortedCopy) {
        if ([converstion.conversationId isEqualToString:kefu_head_emoid]) {
            isHaveKefu = YES;
            [sortedCopy exchangeObjectAtIndex:indexKefu withObjectAtIndex:0];
            break;
        }
        indexKefu++;
    }
    if (!isHaveKefu) {
        EMConversation *kefu = [[EMClient sharedClient].chatManager getConversation:kefu_head_emoid type:EMConversationTypeChat createIfNotExist:YES];
        [sortedCopy insertObject:kefu atIndex:0];
    }
    sorted = sortedCopy;
    
    [self.dataArray removeAllObjects];
    for (EMConversation *converstion in sorted) {
        EaseConversationModel *model = nil;
        if (self.dataSource && [self.dataSource respondsToSelector:@selector(conversationListViewController:modelForConversation:)]) {
            model = [self.dataSource conversationListViewController:self
                                               modelForConversation:converstion];
        }
        else{
            model = [[EaseConversationModel alloc] initWithConversation:converstion];
        }
        
        if (model) {
            if (converstion.latestMessage || [converstion.conversationId isEqualToString:kefu_head_emoid]) {
                [self.dataArray addObject:model];
            }
        }
    }
    
    [self.tableView reloadData];
    [self tableViewDidFinishTriggerHeader:YES reload:NO];
}

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    [super setShowRefreshHeader:showRefreshHeader];
    if (showRefreshHeader) {
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataConversationListController)];
        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStateIdle];
        // Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStatePulling];
        // Set the refreshing state of animated images
        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStateRefreshing];
        
        // Hide the time
        header.lastUpdatedTimeLabel.hidden = YES;
        
        // Hide the status
        header.stateLabel.hidden = YES;
        self.tableView.mj_header = header;
        self.tableView.mj_header.accessibilityIdentifier = @"refresh_header";
        //            header.updatedTimeHidden = YES;
    }
}
@end
