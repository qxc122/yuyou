//
//  failLoad.h
//  TourismT
//
//  Created by Store on 2017/2/8.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface failLoad : UIView
@property (nonatomic,strong) NSString *imageStr;
@property (nonatomic,strong) NSString *desStr;
@property (nonatomic,strong) NSString *reloadStr;

@property (nonatomic, copy) void (^reLoadBtn)();
@end
