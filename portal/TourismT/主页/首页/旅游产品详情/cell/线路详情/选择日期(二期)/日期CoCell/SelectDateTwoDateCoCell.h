//
//  SelectDateTwoDateCoCell.h
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectDateTwoDateCoCell : UICollectionViewCell
@property (nonatomic,strong) pricesS *dataDate;
@property (nonatomic, strong) priceMonthsTwoS *data;
@property (nonatomic, copy) void (^ChoiceData)(pricesS *data);
@end
