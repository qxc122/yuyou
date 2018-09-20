//
//  GJtouerCell.h
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, inPut_ENMU)
{
    Xin_inPut_ENMU,//姓
    Ming_inPut_ENMU,//名
    HUzhao_inPut_ENMU,//护照
    GUOqi_inPut_ENMU,//过期时间
    Birday_inPut_ENMU,//出生日期
    SFZ_inPut_ENMU,//出生日期
};
typedef NS_ENUM(NSInteger, SEX_ENMU)
{
    MAN_SEX_ENMU,//男
    WOMEN_SEX_ENMU,//女
};

@interface GJtouerCell : UITableViewCell
@property (nonatomic,strong) travellerS *peopleOne;
+ (instancetype)returnCellWith:(UITableView *)tableView;
/**
 *  填写了信息的时候用到
 */
@property (copy,nonatomic) void (^FillIn)(travellerS *peopleOne);


/**
 *  重新加载cell
 */
@property (copy,nonatomic) void (^reload)();

@property (nonatomic,strong) NSString *idType;//出游的类型  国际还是国内
@end
