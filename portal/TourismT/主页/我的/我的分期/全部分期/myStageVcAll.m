//
//  myStageVcAll.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myStageVcAll.h"
#import "myStageVcAllCell.h"
#import "StagingDetailsList.h"
#import "emptyTable.h"
#import "lookWkweb.h"
@interface myStageVcAll ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) emptyTable *emptyTableteww;
@end

@implementation myStageVcAll

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ColorWithHex(0xF3F3F3, 1.0);
    [self setUI];
}
- (void)setDate:(myStageHome *)date{
//    if (date) {
        _date = date;
    if (date.periodInfoAllA.count) {
        [self.basicTableView reloadData];
    } else {
        self.emptyTableteww.hidden = NO;
    }
//    }
}
- (void)setUI{
    
    [self setUitableViewstyle:UITableViewStylePlain];
    self.basicTableView.backgroundColor = [UIColor clearColor];
    self.basicTableView.delegate = self;
    self.basicTableView.dataSource = self;
    [self.basicTableView registerClass:[myStageVcAllCell class] forCellReuseIdentifier:NSStringFromClass([myStageVcAllCell class])];
    self.basicTableView.contentInset = UIEdgeInsetsMake(0, 0, 15, 0);
    // Do any additional setup after loading the view.
    //    [self MJRefreshHead];
}

//#pragma -mark<MJ_head加载数据  头部>
//- (void)MJRefreshHead{
//    __weak typeof(self) weakSelf = self;
//    //下拉刷新
//    self.basicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        //加载数据／／TODO
//    }];
//    [self.basicTableView.mj_header beginRefreshing];
//}



#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myStageVcAllCell class]) configuration:^(myStageVcAllCell *cell) {
        [weakself configuremyStageVcAllCell:cell atIndexPath:indexPath];
    }];
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configuremyStageVcAllCell:(myStageVcAllCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date.periodInfoAllA[indexPath.row];
    kWeakSelf(self);
    cell.btnClick = ^(myStageVcAllCell_btnEnum type,NSURL *url){
        if (type == list_myStageVcAllCell_btnEnum) {
            StagingDetailsList *vc = [StagingDetailsList new];
            vc.date = weakself.date.periodInfoAllA[indexPath.row];
            [weakself.navigationController pushViewController:vc animated:YES];
        } else if (type == pay_myStageVcAllCell_btnEnum) {
            NSLog(@"还款了");
        } else if (type == viewUrl_myStageVcAllCell_btnEnum) {
            lookWkweb *vc = [[lookWkweb alloc]init];
            vc.url = [url absoluteString];
            vc.IsHaveshareBtn = NO;
            [weakself.navigationController pushViewController:vc animated:YES];
        }
    };
    cell.btnClickAgrrment = ^{
        [weakself openAgrrmentatIndexPath:indexPath];
    };
}
- (void)lookWebView:(NSString *)url{
    lookWkweb *vc = [[lookWkweb alloc]init];
    vc.url = url;
    vc.IsHaveshareBtn = NO;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)openAgrrmentatIndexPath:(NSIndexPath *)indexPath{
    myStageHomeListForOne *date = self.date.periodInfoAllA[indexPath.row];
    if (date.agreement.count) {
        kWeakSelf(self);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        for (agreementS *one in date.agreement) {
            [alert addAction:[UIAlertAction actionWithTitle:one.name style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [weakself lookWebView:one.url];
            }]];
        }
        [self.navigationController presentViewController:alert animated:YES completion:nil];
    }
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.date.periodInfoAllA.count;
}

//#pragma --mark< 点击了  cell >
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    StagingDetailsList *vc = [StagingDetailsList new];
//    vc.date = self.date.periodInfoAllA[indexPath.row];
//    [self.navigationController pushViewController:vc animated:YES];
//}

#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myStageVcAllCell *cell = [myStageVcAllCell returnCellWith:tableView];
    [self configuremyStageVcAllCell:cell atIndexPath:indexPath];
    return  cell;
}
#pragma --<空白页处理>
- (emptyTable *)emptyTableteww{
    if (!_emptyTableteww) {
        emptyTable *emptyTableteww = [emptyTable new];
        _emptyTableteww = emptyTableteww;
        [self.view addSubview:emptyTableteww];
        [emptyTableteww mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
    }
    return _emptyTableteww;
}



@end
