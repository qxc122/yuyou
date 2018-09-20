//
//  basicUiTableView.h
//  TourismT
//
//  Created by Store on 2017/7/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"




@interface basicUiTableView : basicVc
@property (nonatomic,assign) BOOL isNeedRefreshWhenLoginOrOut;
@property (nonatomic,assign) UITableViewStyle  style; // 默认是分组
@property (nonatomic,assign) NSInteger Pagenumber;
@property (nonatomic,assign) NSInteger Pagesize;
- (void)loadNewDataEndHeadsuccessSet:(UITableView *)TableView code:(NSInteger)code footerIsShow:(BOOL)footerIsShow  totalPages:(NSInteger)totalPages;
- (void)loadNewDataEndHeadfailureSet:(UITableView *)TableView errorCode:(NSInteger)errorCode;

- (void)loadMoreDataEndFootsuccessSet:(UITableView *)TableView totalPages:(NSInteger)totalPages;
- (void)loadMoreDataEndFootfailureSet:(UITableView *)TableView errorCode:(NSInteger)errorCode msg:(NSString *)msg;



- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView;

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView;


- (void)setEmptyDelegate:(UICollectionView *)collectionView;
- (void)setEmptyDelegateUitableView:(UITableView *)tableView;
@end
