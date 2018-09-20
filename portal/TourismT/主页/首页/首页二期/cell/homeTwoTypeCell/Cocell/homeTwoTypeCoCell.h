//
//  homeTwoTypeCoCell.h
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeTwoTypeCoCell : UICollectionViewCell
@property (nonatomic,assign) BOOL isShake; //是否要摇晃
@property (nonatomic,assign) BOOL isSelecet; //是否选中


@property (nonatomic,strong) homeDataV2_Type *date;  
@end
