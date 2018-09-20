//
//  SelectDateTwoDateChildCoCell.h
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectDateTwoDateChildCoCell : UICollectionViewCell
@property (nonatomic, strong) pricesS *data;
@property (nonatomic, strong) NSString *dataStr;
@property (nonatomic, assign) BOOL isShowPic;
@property (nonatomic, assign) BOOL isShowbackImage;
@property (nonatomic, copy) void (^ChoiceData)(pricesS *data);
@end
