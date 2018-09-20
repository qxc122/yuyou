//
//  GNtouerCell.h
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, card_ENMU)
{
    ID_card_ENMU,//省份证
    OTHER_card_ENMU,//其他
};

@interface GNtouerCell : UITableViewCell
@property (nonatomic,strong) travellerS *peopleOne;
@property (nonatomic,assign) card_ENMU type;
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
