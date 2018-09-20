//
//  noticeBasicCell.h
//  TourismT
//
//  Created by Store on 2017/6/22.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define spaceing_width  90.f


@interface noticeBasicCell : UITableViewCell
@property (nonatomic,weak) UILabel *content;
@property (nonatomic,weak) UIImageView *more;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIView *line;

@property (nonatomic,strong) banyouNoticationForOneS *oneDate;
+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
