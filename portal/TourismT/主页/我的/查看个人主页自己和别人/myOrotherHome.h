//
//  myOrotherHome.h
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicUiTableView.h"

@interface myOrotherHome : basicUiTableView
///**
// *  上传资料成功
// */
//@property (copy,nonatomic) void (^btnClick)(UserS *decodedBag);
@property (nonatomic,assign) NSInteger idd; //人的id

@property (nonatomic,strong) NSString *emChatId; //人的环信id
@property (nonatomic, assign) EMConversationType type;

@end
