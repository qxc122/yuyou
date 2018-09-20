//
//  meiPancoCell.h
//  TourismT
//
//  Created by Store on 16/12/29.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuPhotoManager.h"

@interface meiPancoCell : UICollectionViewCell
@property (nonatomic,strong) itemsS *itemsOne;
@property (nonatomic,strong) draftForOne *draftForone;
@property (nonatomic,strong) UIImage *imageDate;
@property (nonatomic,strong) NSString *imageDes;

@property (nonatomic,assign) BOOL isMOve;

@property (nonatomic,weak) UIImageView *image;   //图片视图 
/**
 *  去编辑文字了
 */
@property (nonatomic, copy) void (^gotoInputtezt)(NSString *str,itemsS *itemsOne,PHAsset *PHAssetDate,draftForOne *draftForone);

@property (nonatomic,strong) PHAsset *PHAssetDate;



/**
 *  删除
 */
@property (copy,nonatomic) void (^btnEditClick)(PHAsset *PHAssetDate,itemsS *itemsOne);




@end
