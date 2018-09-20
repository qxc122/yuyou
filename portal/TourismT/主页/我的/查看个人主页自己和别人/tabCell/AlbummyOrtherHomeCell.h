//
//  AlbummyOrtherHomeCell.h
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbummyOrtherHomeCell : UITableViewCell
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,strong) travelSharingsS *oneData;
@property (nonatomic,strong) NSString *data;
@property (nonatomic,strong) NSIndexPath *indexPath; //第一个
@property (nonatomic,assign) BOOL TheLastOne; //最后一个
+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
