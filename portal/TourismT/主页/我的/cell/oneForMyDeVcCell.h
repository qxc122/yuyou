//
//  oneForMyDeVcCell.h
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define imageStr @"oneForMyDeVcCellimageStr"
#define desStr @"oneForMyDeVcCelldes"

@interface oneForMyDeVcCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) NSDictionary *dic;
@property (nonatomic,assign) NSInteger couponCount;
@end
