//
//  EditMyCell.h
//  TourismT
//
//  Created by Store on 2017/3/1.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, eidtMyInfo_btnENUM)
{
    icon_eidtMyInfo_btnENUM,//头像
    sex_eidtMyInfo_btnENUM,//性别
};

@interface EditMyCell : UITableViewCell
@property (nonatomic,assign) BOOL isFirest; //是否是第一相应着
/**
 *  点击查看旅程提醒
 */
@property (copy,nonatomic) void (^ctnClick)(eidtMyInfo_btnENUM tagg);
@property (copy,nonatomic) void (^reloadHeight)();
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) UserS *decodedBag;
@end
