//
//  AppDelegate.h
//  TourismT
//
//  Created by Store on 16/11/14.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainVc.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, EMChatManagerDelegate> 
{
    EMConnectionState _connectionState;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) mainVc *mainController;
@end

