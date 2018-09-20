//
//  SqCoCell.h
//  TourismT
//
//  Created by Store on 2017/6/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SqCoCell : UICollectionViewCell
@property (nonatomic,strong) myhome *date;
@property (nonatomic,assign) bool Top;
@property (nonatomic,assign) bool Bottom;
@property (nonatomic,assign) bool Left;
@property (nonatomic,assign) bool Right;
@end
