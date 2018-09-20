//
//  tourInfo.h
//  TourismT
//
//  Created by Store on 16/11/25.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToolModeldata.h"

@interface tourInfo : NSObject
+ (tourInfo *)sharedInstance;

@property (nonatomic,strong) toutInfoMode *toutInfoModed;
@property (nonatomic,strong) tokenInfoMode *tokenInfoModed;
@property (nonatomic,strong) appS *UserInfo;
@end
