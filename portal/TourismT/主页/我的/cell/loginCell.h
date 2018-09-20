//
//  loginCell.h
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, loginCell_btnEnum)
{
    icon_loginCell_btnEnum,//点击头像
    guanzhu_loginCell_btnEnum,//点击了关注
    beiguanzhu_loginCell_btnEnum,//点击了被关注
    fabu_loginCell_btnEnum,//点击了发布按钮
    card_wishcard_btnEnum,//点击了心愿卡
    index_loginCell_btnEnum,//点击了照片
};

@interface loginCell : UITableViewCell
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^btnClick)(loginCell_btnEnum type,NSInteger index);
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) myAppInfoS *date;
@end
