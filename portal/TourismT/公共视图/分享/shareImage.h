//
//  shareImage.h
//  TourismT
//
//  Created by Store on 2017/8/16.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"

@interface shareImage : windosView
@property (nonatomic,strong) UIImage * capturedImage;


@property (nonatomic, copy) void (^shareImageClick)();
@end
