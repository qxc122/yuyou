
//  mainVc.m
//  Tourism
//
//  Created by Store on 16/11/9.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "mainVc.h"
#import "Masonry.h"
#import "MACRO_UI.h"
#import "AFNetworkReachabilityManager.h"
#import "UITabBar+XSDExt.h"
#import "sameGroupVc.h"
#import "myDeVc.h"
#import "login.h"
#import "sysPhto.h"
#import "TravelItineraryVc.h"
#import "homeTwo.h"
#import "ActivePage.h"
#import "lookWkweb.h"
#define TITLEHEADONE @"旅游"
#define TITLEHEADTWO NSLocalizedString(@"Travel itinerary", @"Travel itinerary")
#define TITLEHEADTHREE @"同团游友"
#define TITLEHEADFOUR @"我的"

#define TITLEFOOTONE @"首页"
#define TITLEFOOTTWO NSLocalizedString(@"Travel itinerary", @"Travel itinerary")
#define TITLEFOOTTHREE @"同团游友"
#define TITLEFOOTFOUR @"我的"

#define IMAGE_ONE_DEFAULT   @"首页副本"
#define IMAGE_ONE_SELECT    @"首页"
#define IMAGE_TWO_DEFAULT   @"旅程"
#define IMAGE_TWO_SELECT    @"旅程点击后"
#define IMAGE_THREE_DEFAULT   @"同团游友"
#define IMAGE_THREE_SELECT    @"聊天ttyy"
#define IMAGE_FOUR_DEFAULT   @"我的"
#define IMAGE_FOUR_SELECT    @"我的xuanzhogn"


#import "NSString+check.h"


#pragma --mark<环信设置>
//#import "SettingsViewController.h"
//#import "ApplyViewController.h"
#import "ChatViewController.h"
//#import "UserProfileManager.h"
#import "ConversationListController.h"
//#import "ContactListViewController.h"
#import "ChatDemoHelper.h"
//#import "RedPacketChatViewController.h"
#import <UserNotifications/UserNotifications.h>

//两次提示的默认间隔
static const CGFloat kDefaultPlaySoundInterval = 3.0;
static NSString *kMessageType = @"MessageType";
static NSString *kConversationChatter = @"ConversationChatter";
static NSString *kGroupName = @"GroupName";




#if DEMO_CALL == 1
@interface mainVc () <UIAlertViewDelegate,UITabBarDelegate, EMCallManagerDelegate>
#else
@interface mainVc () <UIAlertViewDelegate,UITabBarDelegate>
#endif
@property (strong, nonatomic) NSDate *lastPlaySoundDate;

@property (weak, nonatomic) UIImageView *HomeImage;
@property (weak, nonatomic) UIView *HomeImageBack;

@property (assign, nonatomic) BOOL Loadglobal_paramStaue;

@end


@implementation mainVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self customNavigationBar];
    
    homeTwo *homePagevc = [[homeTwo alloc]init];
    homePagevc.title = TITLEHEADONE;
    UINavigationController *navhomePagevc = [[UINavigationController alloc] initWithRootViewController:homePagevc];
    TravelItineraryVc *Journeyvc = [[TravelItineraryVc alloc]init];
    Journeyvc.title = TITLEHEADTWO;
    UINavigationController *navJourneyvc = [[UINavigationController alloc] initWithRootViewController:Journeyvc];
    sameGroupVc *sameGroupvc = [[sameGroupVc alloc]init];
    sameGroupvc.title = TITLEHEADTHREE;
    UINavigationController *navsameGroupvc = [[UINavigationController alloc] initWithRootViewController:sameGroupvc];
    [self addChildViewController:navsameGroupvc];
    self.navsameGroupvc = navsameGroupvc;
    myDeVc *myDevc = [[myDeVc alloc]init];
    myDevc.title = TITLEHEADFOUR;
    UINavigationController *navmyDevc = [[UINavigationController alloc] initWithRootViewController:myDevc];

    UIImage * normalImage1 = [[UIImage imageNamed:IMAGE_ONE_DEFAULT] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * selectImage1 = [[UIImage imageNamed:IMAGE_ONE_SELECT] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navhomePagevc.tabBarItem = [[UITabBarItem alloc] initWithTitle:TITLEFOOTONE image:normalImage1 selectedImage:selectImage1];
//    nav1.tabBarItem.imageInsets = UIEdgeInsetsMake(0,0,0,0);
//    [nav1.tabBarItem setTitlePositionAdjustment: UIOffsetMake(0,0)];
    
    UIImage * normalImage2 = [[UIImage imageNamed:IMAGE_TWO_DEFAULT] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * selectImage2 = [[UIImage imageNamed:IMAGE_TWO_SELECT] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navJourneyvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:TITLEFOOTTWO image:normalImage2 selectedImage:selectImage2];
    
    UIImage * normalImage3 = [[UIImage imageNamed:IMAGE_THREE_DEFAULT] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * selectImage3 = [[UIImage imageNamed:IMAGE_THREE_SELECT] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navsameGroupvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:TITLEFOOTTHREE image:normalImage3 selectedImage:selectImage3];
    
    UIImage * normalImage4 = [[UIImage imageNamed:IMAGE_FOUR_DEFAULT] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * selectImage4 = [[UIImage imageNamed:IMAGE_FOUR_SELECT] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navmyDevc.tabBarItem = [[UITabBarItem alloc] initWithTitle:TITLEFOOTFOUR image:normalImage4 selectedImage:selectImage4];

    self.viewControllers = [NSArray arrayWithObjects:navhomePagevc,navJourneyvc,navsameGroupvc,navmyDevc, nil];
    self.tabBar.backgroundColor = ColorWithHex(0xF9F9F9, 1.0);
    [self.tabBar setTintColor:ColorWithHex(0x6F80F1, 1.0)];
#pragma --mark<小红点>
    [self setHy];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(jumpToHomePageVc)
                                                 name:Goshopping
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(TOKENSUCCESS_block:)
                                                 name:TOKENSUCCESS
                                               object:nil];
    
    [self Loadglobal_param];
    [[tourHelper sharedInstance]photoSHouquan];
}
- (void)TOKENSUCCESS_block:(NSNotification *)user{
    if (!self.Loadglobal_paramStaue) {
        [self Loadglobal_param];
    }
}
#pragma --mark<加载全局参数>
- (void)Loadglobal_param{
    if ([tourInfo sharedInstance].tokenInfoModed.accessToken) {
        kWeakSelf(self);
        [[tourHelper sharedInstance] appcommonglobal_paramWithsuccess:^(id dataDict, NSString *msg, NSInteger code) {
            appcommonglobalS *data = [appcommonglobalS mj_objectWithKeyValues:dataDict];
            if (data.popup.image && data.popup.image.length) {
                weakself.Loadglobal_paramStaue = YES;
                ActivePage *page = [ActivePage new];
                page.btnClick = ^(NSURL *url) {
                    if (data.popup.isBrowser) {
                        if ([[UIApplication sharedApplication] canOpenURL:url]) {
                            NSLog(@"canOpenURL");
                            [[UIApplication sharedApplication] openURL:url];
                        }
                    } else {
                        lookWkweb *vc = [lookWkweb new];
                        vc.IsHaveDelBtn = NO;
                        vc.IsdemeiPan = NO;
                        vc.isHaveRightBtnb = NO;
                        vc.isHaveRightBtnDelete = NO;
                        vc.url = url;
                        vc.IsHaveshareBtn = NO;
                        [weakself.selectedViewController pushViewController:vc animated:YES];
                    }
                };
                page.data = data;
                [page windosViewshow];
            }
        } failure:^(NSInteger errorCode, NSString *msg) {
            
        }];
    }
}


- (void)customNavigationBar
{
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:IMAGE_NAVIGATIONBAR]  forBarMetrics:UIBarMetricsDefault];
    // 1.2设置所有导航条的标题颜色
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTintColor:[UIColor whiteColor]];
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSFontAttributeName] = PingFangSC_Medium(17);
    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:md];
}

- (void)setHy
{
    //if 使tabBarController中管理的viewControllers都符合 UIRectEdgeNone
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout: UIRectEdgeNone];
    }
    
//    self.title = NSLocalizedString(@"title.conversation", @"Conversations");
    
    //获取未读消息数，此时并没有把self注册为SDK的delegate，读取出的未读数是上次退出程序时的
    //    [self didUnreadMessagesCountChanged];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUntreatedApplyCount) name:@"setupUntreatedApplyCount" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUnreadMessageCount) name:@"setupUnreadMessageCount" object:nil];
    
//    [self setupSubviews];


    
    [self setupUnreadMessageCount];
//    [self setupUntreatedApplyCount];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIImageView *)HomeImage{
    if (!_HomeImage) {
        UIImageView *HomeImage = [UIImageView new];
        HomeImage.frame =  CGRectMake(ScreenWidth/4.0/2.0-51*0.5, 0, 51, 49);
        HomeImage.image = ImageNamed(@"首页默认");
        [self.tabBar addSubview:HomeImage];
        HomeImage.backgroundColor = self.tabBar.backgroundColor;
        HomeImage.transform = CGAffineTransformScale(HomeImage.transform,0.0,0.0);
        HomeImage.hidden = YES;
        _HomeImage = HomeImage;
    }
    return _HomeImage;
}
- (UIView *)HomeImageBack{
    if (!_HomeImageBack) {
        UIView *HomeImageBack = [UIView new];
        HomeImageBack.frame =  CGRectMake(ScreenWidth/4.0/2.0-51*0.5, 0, 51, 49);
        HomeImageBack.backgroundColor = self.tabBar.backgroundColor;
        HomeImageBack.hidden = YES;
        [self.tabBar addSubview:HomeImageBack];
        _HomeImageBack = HomeImageBack;
    }
    return _HomeImageBack;
}
#pragma --mark<点击了 首页 items>
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if ([item.title isEqualToString:TITLEFOOTONE]) {
        NSLog(TITLEFOOTONE);
        self.HomeImageBack.hidden = NO;
        self.HomeImage.hidden = NO;
        [UIView animateWithDuration:0.15 animations:^{
            self.HomeImage.transform = CGAffineTransformIdentity;
        }];
    }else{
        self.HomeImageBack.hidden = YES;
        self.HomeImage.hidden = YES;
        self.HomeImage.transform = CGAffineTransformScale(self.HomeImage.transform,0.0,0.0);
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.selectedViewController == [self.viewControllers objectAtIndex:0]) {
        self.HomeImageBack.hidden = NO;
        self.HomeImage.hidden = NO;
        self.HomeImage.transform = CGAffineTransformIdentity;
    }
}

#pragma mark - UITabBarDelegate

//- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
//{
//    if (item.tag == 0) {
//        self.title = NSLocalizedString(@"title.conversation", @"Conversations");
//        self.navigationItem.rightBarButtonItem = nil;
//    }else if (item.tag == 1){
//        self.title = NSLocalizedString(@"title.addressbook", @"AddressBook");
//        self.navigationItem.rightBarButtonItem = _addFriendItem;
//    }else if (item.tag == 2){
//        self.title = NSLocalizedString(@"title.setting", @"Setting");
//        self.navigationItem.rightBarButtonItem = nil;
//        [_settingsVC refreshConfig];
//    }
//}

#pragma mark - private

//- (void)setupSubviews
//{
//    self.tabBar.accessibilityIdentifier = @"tabbar";
//    self.tabBar.backgroundImage = [[UIImage imageNamed:@"tabbarBackground"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
//    self.tabBar.selectionIndicatorImage = [[UIImage imageNamed:@"tabbarSelectBg"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
//    
//    _chatListVC = [[ConversationListController alloc] initWithNibName:nil bundle:nil];
//    [_chatListVC networkChanged:_connectionState];
//    _chatListVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"title.conversation", @"Conversations")
//                                                           image:[UIImage imageNamed:@"tabbar_chats"]
//                                                   selectedImage:[UIImage imageNamed:@"tabbar_chatsHL"]];
//    _chatListVC.tabBarItem.tag = 0;
//    _chatListVC.tabBarItem.accessibilityIdentifier = @"conversation";
//    [self unSelectedTapTabBarItems:_chatListVC.tabBarItem];
//    [self selectedTapTabBarItems:_chatListVC.tabBarItem];
//    
//    _contactsVC = [[ContactListViewController alloc] initWithNibName:nil bundle:nil];
//    _contactsVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"title.addressbook", @"AddressBook")
//                                                           image:[UIImage imageNamed:@"tabbar_contacts"]
//                                                   selectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
//    _contactsVC.tabBarItem.tag = 1;
//    _contactsVC.tabBarItem.accessibilityIdentifier = @"contact";
//    [self unSelectedTapTabBarItems:_contactsVC.tabBarItem];
//    [self selectedTapTabBarItems:_contactsVC.tabBarItem];
//    
//    _settingsVC = [[SettingsViewController alloc] init];
//    _settingsVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"title.setting", @"Setting")
//                                                           image:[UIImage imageNamed:@"tabbar_setting"]
//                                                   selectedImage:[UIImage imageNamed:@"tabbar_settingHL"]];
//    _settingsVC.tabBarItem.tag = 2;
//    _settingsVC.tabBarItem.accessibilityIdentifier = @"setting";
//    _settingsVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    [self unSelectedTapTabBarItems:_settingsVC.tabBarItem];
//    [self selectedTapTabBarItems:_settingsVC.tabBarItem];
//    
//    self.viewControllers = @[_chatListVC, _contactsVC, _settingsVC];
//    [self selectedTapTabBarItems:_chatListVC.tabBarItem];
//}

//-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
//{
//    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                        [UIFont systemFontOfSize:14], NSFontAttributeName,
//                                        [UIColor whiteColor],NSForegroundColorAttributeName,
//                                        nil] forState:UIControlStateNormal];
//}
//
//-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
//{
//    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                        [UIFont systemFontOfSize:14],NSFontAttributeName,
//                                        RGBACOLOR(0x00, 0xac, 0xff, 1),NSForegroundColorAttributeName,
//                                        nil] forState:UIControlStateSelected];
//}

// 统计未读消息数
-(void)setupUnreadMessageCount
{
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSInteger unreadCount = 0;
    NSInteger unreadCountKefu = 0;
    for (EMConversation *conversation in conversations) {
        if ([conversation.latestMessage.from isEqualToString:kefu_name_emoid]) {
            unreadCountKefu += conversation.unreadMessagesCount;
        }
        unreadCount += conversation.unreadMessagesCount;
    }
//    if (self.sameGroupvc) {
//        if (unreadCount > 0) {
//            _chatListVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%i",(int)unreadCount];
//        }else{
//            _chatListVC.tabBarItem.badgeValue = nil;
//        }
//    }
    NSDictionary *dictTmp = @{HyunreadCount:[NSString stringWithFormat:@"%ld",(long)unreadCount],};
    NSNotification *notification =[NSNotification notificationWithName:HyunreadCount object:nil userInfo:dictTmp];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    
    NSDictionary *dictTmpKefu = @{HyunreadCountKefu:[NSString stringWithFormat:@"%ld",(long)unreadCountKefu],};
    NSNotification *notificationKefu =[NSNotification notificationWithName:HyunreadCountKefu object:nil userInfo:dictTmpKefu];
    [[NSNotificationCenter defaultCenter] postNotification:notificationKefu];
    
    
    
    if (unreadCount > 0 ) {
        //显示
        [self.tabBar showBadgeOnItemIndex:2];
//        self.navsameGroupvc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",unreadCount];
    }else{
        //隐藏
        [self.tabBar hideBadgeOnItemIndex:2];
//        self.navsameGroupvc.tabBarItem.badgeValue = nil;
    }
    
    
    UIApplication *application = [UIApplication sharedApplication];
    [application setApplicationIconBadgeNumber:unreadCount];
}

- (void)setupUntreatedApplyCount
{
//    NSInteger unreadCount = [[[ApplyViewController shareController] dataSource] count];
//    if (_contactsVC) {
//        if (unreadCount > 0) {
//            _contactsVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%i",(int)unreadCount];
//        }else{
//            _contactsVC.tabBarItem.badgeValue = nil;
//        }
//    }
}

- (void)networkChanged:(EMConnectionState)connectionState
{
    _connectionState = connectionState;
//    [_chatListVC networkChanged:connectionState];
}

- (void)playSoundAndVibration{
    NSTimeInterval timeInterval = [[NSDate date]
                                   timeIntervalSinceDate:self.lastPlaySoundDate];
    if (timeInterval < kDefaultPlaySoundInterval) {
        //如果距离上次响铃和震动时间太短, 则跳过响铃
        NSLog(@"skip ringing & vibration %@, %@", [NSDate date], self.lastPlaySoundDate);
        return;
    }
    
    //保存最后一次响铃时间
    self.lastPlaySoundDate = [NSDate date];
    
    // 收到消息时，播放音频
    [[EMCDDeviceManager sharedInstance] playNewMessageSound];
    // 收到消息时，震动
    [[EMCDDeviceManager sharedInstance] playVibration];
}

- (void)showNotificationWithMessage:(EMMessage *)message
{
//    EMPushOptions *options = [[EMClient sharedClient] pushOptions];
    NSString *alertBody = nil;
//    if (options.displayStyle == EMPushDisplayStyleMessageSummary) {
        EMMessageBody *messageBody = message.body;
        NSString *messageStr = nil;
        switch (messageBody.type) {
            case EMMessageBodyTypeText:
            {
                messageStr = ((EMTextMessageBody *)messageBody).text;
            }
                break;
            case EMMessageBodyTypeImage:
            {
                messageStr = NSLocalizedString(@"message.image1", @"Image");
            }
                break;
            case EMMessageBodyTypeLocation:
            {
                messageStr = NSLocalizedString(@"message.location1", @"Location");
            }
                break;
            case EMMessageBodyTypeVoice:
            {
                messageStr = NSLocalizedString(@"message.voice1", @"Voice");
            }
                break;
            case EMMessageBodyTypeVideo:{
                messageStr = NSLocalizedString(@"message.video1", @"Video");
            }
                break;
            default:
                break;
        }
        
        do {
//            NSString *title = [[UserProfileManager sharedInstance] getNickNameWithUsername:message.from];
            NSString *title =@"";
            if (message.chatType == EMChatTypeGroupChat) {
                NSDictionary *ext = message.ext;
                if (ext && ext[kGroupMessageAtList]) {
                    id target = ext[kGroupMessageAtList];
                    if ([target isKindOfClass:[NSString class]]) {
                        if ([kGroupMessageAtAll compare:target options:NSCaseInsensitiveSearch] == NSOrderedSame) {
                            alertBody = [NSString stringWithFormat:@"%@%@", title, NSLocalizedString(@"group.atPushTitle", @" @ me in the group")];
                            break;
                        }
                    }
                    else if ([target isKindOfClass:[NSArray class]]) {
                        NSArray *atTargets = (NSArray*)target;
                        if ([atTargets containsObject:[EMClient sharedClient].currentUsername]) {
                            alertBody = [NSString stringWithFormat:@"%@%@", title, NSLocalizedString(@"group.atPushTitle", @" @ me in the group")];
                            break;
                        }
                    }
                }
                NSArray *groupArray = [[EMClient sharedClient].groupManager getJoinedGroups];
                for (EMGroup *group in groupArray) {
                    if ([group.groupId isEqualToString:message.conversationId]) {
                        title = [NSString stringWithFormat:@"%@",group.subject];
                        break;
                    }
                }

            }
            else if (message.chatType == EMChatTypeChatRoom)
            {
                NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                NSString *key = [NSString stringWithFormat:@"OnceJoinedChatrooms_%@", [[EMClient sharedClient] currentUsername]];
                NSMutableDictionary *chatrooms = [NSMutableDictionary dictionaryWithDictionary:[ud objectForKey:key]];
                NSString *chatroomName = [chatrooms objectForKey:message.conversationId];
                if (chatroomName)
                {
//                    UIAlertView *ale = [[UIAlertView alloc]initWithTitle:title message:nil delegate:self cancelButtonTitle:@"EMChatTypeChatRoom" otherButtonTitles:@"sd", nil];
//                    [ale show];
                    
                    title = [NSString stringWithFormat:@"%@",chatroomName];
//                    title = [NSString stringWithFormat:@"%@(%@)", message.from, chatroomName];
                }
                alertBody = [NSString stringWithFormat:@"%@:%@", title, messageStr];
            }else if (message.chatType == EMChatTypeChat)
            {
                NSString *pathUserTmp = [NSString stringWithFormat:@"%@single.data",message.conversationId];
                
                NSString *pathUser = [PATH_OF_DOCUMENT stringByAppendingPathComponent:pathUserTmp];
                if ([message.conversationId isEqualToString:kefu_head_emoid]) {
                    title = kefu_name_emoid;
                } else {
                    UserS *decodedBag = [NSKeyedUnarchiver unarchiveObjectWithFile:pathUser];
                    if (decodedBag) {
                        title = decodedBag.nickName;
                    }
                }
            }
            if (title && title.length) {
                alertBody = [NSString stringWithFormat:@"%@:%@", title, messageStr];
            } else {
                alertBody = NSLocalizedString(@"receiveMessage", @"you have a new message");
            }
            
        } while (0);
//    }
//    else{
//        alertBody = NSLocalizedString(@"receiveMessage", @"you have a new message");
//    }
    
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.lastPlaySoundDate];
    BOOL playSound = NO;
    if (!self.lastPlaySoundDate || timeInterval >= kDefaultPlaySoundInterval) {
        self.lastPlaySoundDate = [NSDate date];
        playSound = YES;
    }
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setObject:[NSNumber numberWithInt:message.chatType] forKey:kMessageType];
    [userInfo setObject:message.conversationId forKey:kConversationChatter];
    
    //发送本地推送
    if (NSClassFromString(@"UNUserNotificationCenter")) {
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0.01 repeats:NO];
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        if (playSound) {
            content.sound = [UNNotificationSound defaultSound];
        }
        content.body =alertBody;
        content.userInfo = userInfo;
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:message.messageId content:content trigger:trigger];
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:nil];
    }
    else {
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.fireDate = [NSDate date]; //触发通知的时间
        notification.alertBody = alertBody;
        notification.alertAction = NSLocalizedString(@"open", @"Open");
        notification.timeZone = [NSTimeZone defaultTimeZone];
        if (playSound) {
            notification.soundName = UILocalNotificationDefaultSoundName;
        }
        notification.userInfo = userInfo;
        
        //发送通知
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

#pragma mark - 自动登录回调

- (void)willAutoReconnect{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSNumber *showreconnect = [ud objectForKey:@"identifier_showreconnect_enable"];
    if (showreconnect && [showreconnect boolValue]) {
        [self hideHud];
        [self showHint:NSLocalizedString(@"reconnection.ongoing", @"reconnecting...")];
    }
}

- (void)didAutoReconnectFinishedWithError:(NSError *)error{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSNumber *showreconnect = [ud objectForKey:@"identifier_showreconnect_enable"];
    if (showreconnect && [showreconnect boolValue]) {
        [self hideHud];
        if (error) {
            [self showHint:NSLocalizedString(@"reconnection.fail", @"reconnection failure, later will continue to reconnection")];
        }else{
            [self showHint:NSLocalizedString(@"reconnection.success", @"reconnection successful！")];
        }
    }
}

#pragma mark - public

- (void)jumpToChatList
{
    UINavigationController *naVc = (UINavigationController *)self.selectedViewController;
    UIViewController *firsr = [naVc.childViewControllers firstObject];
    [naVc popToRootViewControllerAnimated:NO];
    if ([firsr isKindOfClass:[sameGroupVc class]]) {
        
    }else{
        [naVc popToRootViewControllerAnimated:NO];
        self.selectedViewController = [self.viewControllers objectAtIndex:2];
    }
    
//    self.tabBarItem
//    if ([self.navsameGroupvc.topViewController isKindOfClass:[ChatViewController class]]) {
//                ChatViewController *chatController = (ChatViewController *)self.navigationController.topViewController;
//                [chatController hideImagePicker];
//    }
//    else if(_chatListVC)
//    {
//        [self.navigationController popToViewController:self animated:NO];
//        [self setSelectedViewController:_chatListVC];
//    }
}

- (EMConversationType)conversationTypeFromMessageType:(EMChatType)type
{
    EMConversationType conversatinType = EMConversationTypeChat;
    switch (type) {
        case EMChatTypeChat:
            conversatinType = EMConversationTypeChat;
            break;
        case EMChatTypeGroupChat:
            conversatinType = EMConversationTypeGroupChat;
            break;
        case EMChatTypeChatRoom:
            conversatinType = EMConversationTypeChatRoom;
            break;
        default:
            break;
    }
    return conversatinType;
}

- (void)didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    if (userInfo)
    {

        [self jumpToChatList];
        
//        if ([self.navigationController.topViewController isKindOfClass:[ChatViewController class]]) {
//                        ChatViewController *chatController = (ChatViewController *)self.navigationController.topViewController;
//                        [chatController hideImagePicker];
//        }
        
        NSArray *viewControllers = self.navsameGroupvc.childViewControllers;
        [viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop){
                if (![obj isKindOfClass:[ChatViewController class]] && ![obj isKindOfClass:[sameGroupVc class]])
                {
                    [self.navsameGroupvc popViewControllerAnimated:NO];
                }else if ([obj isKindOfClass:[sameGroupVc class]]){
                    ChatViewController *chatViewController = nil;
                    NSString *conversationChatter = userInfo[kConversationChatter];
                    EMChatType messageType = [userInfo[kMessageType] intValue];
#ifdef REDPACKET_AVALABLE
                    chatViewController = [[RedPacketChatViewController alloc] initWithConversationChatter:conversationChatter conversationType:[self conversationTypeFromMessageType:messageType]];
#else
                    chatViewController = [[ChatViewController alloc] initWithConversationChatter:conversationChatter conversationType:[self conversationTypeFromMessageType:messageType]];
#endif
                    chatViewController.hidesBottomBarWhenPushed = YES;
                    [self.navsameGroupvc pushViewController:chatViewController animated:NO];
                }
                else if([obj isKindOfClass:[ChatViewController class]])
                {
                    NSString *conversationChatter = userInfo[kConversationChatter];
                    ChatViewController *chatViewController = (ChatViewController *)obj;
                    if (![chatViewController.conversation.conversationId isEqualToString:conversationChatter])
                    {
                        [self.navigationController popViewControllerAnimated:NO];
                        EMChatType messageType = [userInfo[kMessageType] intValue];
#ifdef REDPACKET_AVALABLE
                        chatViewController = [[RedPacketChatViewController alloc] initWithConversationChatter:conversationChatter conversationType:[self conversationTypeFromMessageType:messageType]];
#else
                        chatViewController = [[ChatViewController alloc] initWithConversationChatter:conversationChatter conversationType:[self conversationTypeFromMessageType:messageType]];
#endif
                        chatViewController.hidesBottomBarWhenPushed = YES;
                        [self.navsameGroupvc pushViewController:chatViewController animated:NO];
                    }
                    *stop= YES;
                }
        }];
    }else{
        UINavigationController *naVc = (UINavigationController *)self.selectedViewController;
        [naVc popToRootViewControllerAnimated:NO];
        self.selectedViewController = [self.viewControllers objectAtIndex:2];
    }
    
//    else if (_chatListVC)
//    {
//        [self.navigationController popToViewController:self animated:NO];
//        [self setSelectedViewController:_chatListVC];
//    }
}

- (void)didReceiveUserNotification:(UNNotification *)notification
{
    NSDictionary *userInfo = notification.request.content.userInfo;
    if (userInfo)
    {
//        if ([self.navigationController.topViewController isKindOfClass:[ChatViewController class]]) {
            //            ChatViewController *chatController = (ChatViewController *)self.navigationController.topViewController;
            //            [chatController hideImagePicker];
//        }
        
        
        [self jumpToChatList];
        NSString *conversationChatter = userInfo[kConversationChatter];
        if (!conversationChatter) {
            conversationChatter = userInfo[@"g"];
        }
        if (!conversationChatter) {
            conversationChatter = userInfo[@"f"];
        }
//        UIAlertView *ale =[[UIAlertView alloc]initWithTitle:@"空" message:[NSString dictionaryToJson:userInfo] delegate:nil cancelButtonTitle:conversationChatter otherButtonTitles:nil, nil];
//        [ale show];
        
        NSArray *viewControllers = self.navsameGroupvc.childViewControllers;
        [viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop){
                if (![obj isKindOfClass:[ChatViewController class]] && ![obj isKindOfClass:[sameGroupVc class]])
                {
                    [self.navsameGroupvc popViewControllerAnimated:NO];
                }
                else if ([obj isKindOfClass:[ChatViewController class]])
                {
                    
                    ChatViewController *chatViewController = (ChatViewController *)obj;
                    if (![chatViewController.conversation.conversationId isEqualToString:conversationChatter])
                    {
                        [self.navsameGroupvc popViewControllerAnimated:NO];
                        EMChatType messageType = [userInfo[kMessageType] intValue];
#ifdef REDPACKET_AVALABLE
                        chatViewController = [[RedPacketChatViewController alloc] initWithConversationChatter:conversationChatter conversationType:[self conversationTypeFromMessageType:messageType]];
#else
                        chatViewController = [[ChatViewController alloc] initWithConversationChatter:conversationChatter conversationType:[self conversationTypeFromMessageType:messageType]];
#endif
                        chatViewController.hidesBottomBarWhenPushed = YES;
                        [self.navsameGroupvc pushViewController:chatViewController animated:NO];
                    }
                    *stop= YES;
                } else if([obj isKindOfClass:[sameGroupVc class]])
                {
                    ChatViewController *chatViewController = nil;
//                    NSString *conversationChatter = userInfo[kConversationChatter];
                    EMChatType messageType = [userInfo[kMessageType] intValue];
#ifdef REDPACKET_AVALABLE
                    chatViewController = [[RedPacketChatViewController alloc] initWithConversationChatter:conversationChatter conversationType:[self conversationTypeFromMessageType:messageType]];
#else
                    chatViewController = [[ChatViewController alloc] initWithConversationChatter:conversationChatter conversationType:[self conversationTypeFromMessageType:messageType]];
#endif

                    //TODO   缺少字段啊
//                    UIAlertView *ale =[[UIAlertView alloc]initWithTitle:@"空" message:[NSString dictionaryToJson:userInfo] delegate:nil cancelButtonTitle:@"" otherButtonTitles:nil, nil];
//                    [ale show];
                    chatViewController.hidesBottomBarWhenPushed = YES;
                    [self.navsameGroupvc pushViewController:chatViewController animated:NO];
                }
            

        }];
    }else{
        UINavigationController *naVc = (UINavigationController *)self.selectedViewController;
        [naVc popToRootViewControllerAnimated:NO];
        self.selectedViewController = [self.viewControllers objectAtIndex:2];
    }
//    else if (_chatListVC)
//    {
//        [self.navigationController popToViewController:self animated:NO];
//        [self setSelectedViewController:_chatListVC];
//    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)jumpToHomePageVc{
    UINavigationController *naVc = (UINavigationController *)self.selectedViewController;
    [naVc popToRootViewControllerAnimated:NO];
    
    UIViewController *rootVc = naVc.topViewController;
    if (![rootVc isKindOfClass:[homeTwo class]]) {
        self.selectedViewController = [self.viewControllers objectAtIndex:0];
    }
}

- (void)jumpToPublishShare{
    UINavigationController *naVc = (UINavigationController *)self.selectedViewController;
    [naVc popToRootViewControllerAnimated:NO];
    
    UIViewController *rootVc = naVc.topViewController;
    if (![rootVc isKindOfClass:[myDeVc class]]) {
        self.selectedViewController = [self.viewControllers objectAtIndex:3];
        naVc = (UINavigationController *)self.selectedViewController;
    }
    if ([tourInfo sharedInstance].UserInfo) {
        sysPhto *sysphto = [[sysPhto alloc]init];
        [naVc pushViewController:sysphto animated:YES];
    } else {
        [MBProgressHUD showPrompt:@"请先登录"];
        login *losgin = [[login alloc]init];
        UINavigationController *nnvc = [[UINavigationController alloc]initWithRootViewController:losgin];
        [self presentViewController:nnvc animated:YES completion:nil];
    }
}
@end
