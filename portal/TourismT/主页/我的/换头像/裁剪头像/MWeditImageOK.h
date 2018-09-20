//
//  MWeditImageOK.h
//  TourismT
//
//  Created by Store on 2017/7/5.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "CusMWPhotoBrowser.h"

@interface MWeditImageOK : CusMWPhotoBrowser
/**
 *  确定图片
 */
@property (copy,nonatomic) void (^returnAvtor)(UIImage *icon);
@end
