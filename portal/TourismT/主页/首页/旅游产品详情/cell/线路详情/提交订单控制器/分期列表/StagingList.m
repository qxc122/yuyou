//
//  StagingList.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "StagingList.h"
#import "StagingListTitleCell.h"
#import "StagingListCell.h"


#define cellHeight_one  57.5f
#define cellHeight_Other  54.5f

@interface StagingList ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;

@end

@implementation StagingList

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *blcak = [[UIView alloc]init];
        blcak.backgroundColor = ColorWithHex(0x000000, 0.5);
        [self addSubview:blcak];

        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [tableView registerClass:[StagingListTitleCell class] forCellReuseIdentifier:NSStringFromClass([StagingListTitleCell class])];
        [tableView registerClass:[StagingListCell class] forCellReuseIdentifier:NSStringFromClass([StagingListCell class])];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self addSubview:tableView];
        self.tableView = tableView;

        [blcak mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self).offset(187*HEIGHTICON);
            make.bottom.equalTo(self);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeClisck)];
        [blcak addGestureRecognizer:tap];
    }
    return self;
}
- (void)closeClisck{
    [self removeFromSuperview];
}
- (void)windosViewshow{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(window);
        make.right.equalTo(window);
        make.top.equalTo(window);
        make.bottom.equalTo(window).offset(-HEIGHT_NEXTBTN);;
    }];
}


#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return cellHeight_one;
        
//        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([StagingListTitleCell class]) configuration:^(StagingListTitleCell *cell) {
//            [self configureStagingListTitleCell:cell atIndexPath:indexPath];
//        }];
    } else  if (indexPath.section == 1){
        return cellHeight_Other;
//        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([StagingListCell class]) configuration:^(StagingListCell *cell) {
//            [self configureStagingListCell:cell atIndexPath:indexPath];
//        }];
    }
    return 0.01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {

    } else  if (section == 1){
        return self.jisuanInfodate.periodDetails.count;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        StagingListTitleCell *cell = [StagingListTitleCell returnCellWith:tableView];
        [self configureStagingListTitleCell:cell atIndexPath:indexPath];
        return cell;
    } else  if (indexPath.section == 1){
        StagingListCell *cell = [StagingListCell returnCellWith:tableView];
        [self configureStagingListCell:cell atIndexPath:indexPath];
        return cell;
    }
    return nil;
}

//标题
- (void)configureStagingListTitleCell:(StagingListTitleCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.closeStagingList = ^(){
        [weakself closeClisck];
    };
}
//cell
- (void)configureStagingListCell:(StagingListCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.jisuanInfodate.periodDetails[indexPath.row];
}

- (void)setJisuanInfodate:(jisuanInfo *)jisuanInfodate{
    _jisuanInfodate = jisuanInfodate;
    CGFloat height = self.jisuanInfodate.periodDetails.count*cellHeight_Other + cellHeight_one;
    if ((ScreenHeight - height) < 187*HEIGHTICON) {
        height = ScreenHeight - 187*HEIGHTICON;
    }
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@(height));
        make.bottom.equalTo(self);
    }];
    
}
@end
