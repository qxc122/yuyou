//
//  mainVc.h
//  Tourism
//
//  Created by Store on 16/11/9.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@interface mainVc : UITabBarController
{
    EMConnectionState _connectionState;
}

- (void)jumpToChatList;

- (void)setupUntreatedApplyCount;

- (void)setupUnreadMessageCount;

- (void)networkChanged:(EMConnectionState)connectionState;

- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

- (void)didReceiveUserNotification:(UNNotification *)notification;

- (void)playSoundAndVibration;

- (void)showNotificationWithMessage:(EMMessage *)message;

- (void)jumpToPublishShare; //去分享

- (void)jumpToHomePageVc; //去首页

@property (strong, nonatomic) UINavigationController *navsameGroupvc;
@end
