//
//  myOreserFiveToPay.h
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOreserFiveGOyouCell.h"

@interface myOreserFiveToPay : myOreserFiveGOyouCell
/**
 *  支付或者点评
 */
@property (copy,nonatomic) void (^btnClick)(orderlistForOneS *datessTwo);
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) orderlistForOneS *datessTwo;
@end
