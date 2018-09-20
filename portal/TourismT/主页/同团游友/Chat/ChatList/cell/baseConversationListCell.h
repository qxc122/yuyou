//
//  baseConversationListCell.h
//  TourismT
//
//  Created by Store on 2017/6/21.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface baseConversationListCell : UITableViewCell
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *content;
@property (nonatomic,weak) UILabel *num;

@property (nonatomic,strong) id<IConversationModel> model;
@end
