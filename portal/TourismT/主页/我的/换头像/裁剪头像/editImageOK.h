//
//  editImageOK.h
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"

@interface editImageOK : basicVc
/**
 *  确定图片
 */
@property (copy,nonatomic) void (^btnClick)(UIImage *icon);
@property (nonatomic,weak) UIImage *avtor;

@property (nonatomic,weak) PHAsset *PHAssetDate;
@end
