//
//  myOreserFiveGOyouCell.h
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myOreserFiveGOyouCell : UITableViewCell
@property (nonatomic,weak)UIView *view1;
@property (nonatomic,weak)UIView *view2;
+ (instancetype)returnCellWith:(UITableView *)tableView;

@property (nonatomic,strong) orderlistForOneS *datess;
@end
