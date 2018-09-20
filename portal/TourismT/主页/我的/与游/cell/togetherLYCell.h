//
//  togetherLYCell.h
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface togetherLYCell : UITableViewCell
@property (nonatomic,assign) BOOL isSelected; //是否选中；
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) OtherpeoLcOneS *one; //是否选中；


@property (nonatomic,assign) BOOL isNumberOfJourneys; //是否 隐藏 勾按钮


@property (nonatomic,strong) contentS *dateHeart; ////心愿卡里用到的



@property (nonatomic,strong) orderlistForOneS *date;  
@end
