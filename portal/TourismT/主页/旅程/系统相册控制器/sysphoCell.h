//
//  sysphoCell.h
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuPhotoManager.h"

typedef NS_ENUM(NSInteger, collection_ENMU)
{
    one_collection_ENMU,//上
    two_collection_ENMU,//下
};


@interface sysphoCell : UICollectionViewCell
/**
 *  点击每个cell的回调  选择或者取消
 */
@property (nonatomic, copy) void (^cellClick)(NSIndexPath *indexPath,PHAsset *imageDate,collection_ENMU collectionType,BOOL isSelcet);

/**
 *  点击图片的回调
 */
//@property (nonatomic, copy) void (^cellClickYesOrNo)(BOOL isChoice);
@property (nonatomic,assign) NSIndexPath *indexPath;
@property (nonatomic,assign) BOOL isSelcet;
@property (nonatomic,assign) collection_ENMU collectionType;
@property (nonatomic,strong) UIImage *imageDate;


@property (nonatomic,strong) PHAsset *PHAssetDate;


@property (nonatomic,assign) BOOL isEdit;  //是否是选择我的头像 控制器
@end
