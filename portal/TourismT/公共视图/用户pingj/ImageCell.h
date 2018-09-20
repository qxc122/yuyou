//
//  ImageCell.h
//  TourismT
//
//  Created by Store on 16/12/17.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuPhotoManager.h"

@interface ImageCell : UICollectionViewCell
@property (nonatomic,assign) BOOL isYuan;


@property (nonatomic,strong) NSString *imgUrl;

@property (nonatomic,strong) UIImage *imageDate;
@property (nonatomic,strong) PHAsset *PHAssetDate;



@property (nonatomic,weak) UIImageView *image;

///评价用到的了
@property (nonatomic,assign) BOOL isHidenBtn;
@property (nonatomic,assign) NSInteger index;
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^btnClick)(NSInteger index);
@end
