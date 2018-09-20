//
//  bannerImageCell.h
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, bannerImageCell_btn_type)
{
    Top_bannerImageCell,//收藏
    Bottom_bannerImageCell,//分享
};


@interface bannerImageCell : UITableViewCell
@property (nonatomic,strong) NSArray *arryA;


+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic, assign) BOOL isSelecetForBtn; //按钮是否选中
/**
 *  点击了 上拉 和下拉  按钮
 */
@property (copy,nonatomic) void (^btnClick)(bannerImageCell_btn_type type);
@end
