//
//  GroupMemberVc.h
//  TourismT
//
//  Created by Store on 2017/6/22.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//


#import "basicUiTableView.h"

@interface GroupMemberVc : basicUiTableView
/*!
 *  \~chinese
 *  会话唯一标识
 *
 *  \~english
 *  Unique identifier of conversation
 */
@property (nonatomic, strong) NSString *conversationId;
@property (nonatomic,strong) membersGroupS *embersPeo;  //群组 成员 
@end
