//
//  YXTabItemBaseView.m
//  仿造淘宝商品详情页
//
//  Created by yixiang on 16/3/29.
//  Copyright © 2016年 yixiang. All rights reserved.
//

#import "YXTabItemBaseView.h"
#import "YX.h"

@implementation YXTabItemBaseView
-(void)renderUIWithInfo:(NSDictionary *)info{
    self.info = info;
    NSNumber *position = info[@"position"];
    int num = [position intValue];
    
    CGFloat tmp = kTabTitleViewHeight;
    NSNumber *tmpNUm = info[@"kTabTitleViewHeightf"];
    if (tmpNUm) {
        tmp = [tmpNUm floatValue];;
    }
    CGFloat tmp2 = kBottomBarHeight;
    NSNumber *tmpNUm2 = info[@"kBottomBarHeightf"];
    if (tmpNUm2) {
        tmp2 = [tmpNUm2 floatValue];;
    }
    if (ScreenHeight==812){
           self.frame = CGRectMake(num*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kTopBarHeight-tmp2-tmp-HEIGHT_NavbarX);
    }else{
        
        self.frame = CGRectMake(num*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-kTopBarHeight-tmp2-tmp-HEIGHT_Navbar);
    }
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //_tableView.scrollEnabled = NO;
//    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self addSubview:self.tableView];
    
    
    NSString *notice1 = info[@"kGoTopNotificationNamestr"];
    if (!notice1) {
        notice1 = kGoTopNotificationName;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:notice1 object:nil];
    NSString *notice2 = info[@"kLeaveTopNotificationNamestr"];
    if (!notice2) {
        notice2 = kLeaveTopNotificationName;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:notice2 object:nil];//其中一个TAB离开顶部的时候，如果其他几个偏移量不为0的时候，要把他们都置为0
}

-(void)acceptMsg : (NSNotification *)notification{
    //NSLog(@"%@",notification);
    NSString *notificationName = notification.name;
    NSString *notice1 = self.info[@"kGoTopNotificationNamestr"];
    if (!notice1) {
        notice1 = kGoTopNotificationName;
    }
    NSString *notice2 = self.info[@"kLeaveTopNotificationNamestr"];
    if (!notice2) {
        notice2 = kLeaveTopNotificationName;
    }
    
    if ([notificationName isEqualToString:notice1]) {
        NSLog(@"子 接收到 %@",notificationName);
        NSDictionary *userInfo = notification.userInfo;
        NSString *canScroll = userInfo[@"canScroll"];
        if ([canScroll isEqualToString:@"1"]) {
            self.canScroll = YES;
            self.tableView.showsVerticalScrollIndicator = YES;
        }
    }else if([notificationName isEqualToString:notice2]){
        NSLog(@"子 接收到 %@",notificationName);
        self.tableView.contentOffset = CGPointZero;
        self.canScroll = NO;
        self.tableView.showsVerticalScrollIndicator = NO;
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.canScroll) {
        [scrollView setContentOffset:CGPointZero];
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY<0) {
        NSString *notice2 = self.info[@"kLeaveTopNotificationNamestr"];
        if (!notice2) {
            notice2 = kLeaveTopNotificationName;
        }
        NSLog(@"子发出通知 %@",notice2);
        [[NSNotificationCenter defaultCenter] postNotificationName:notice2 object:nil userInfo:@{@"canScroll":@"1"}];
    }
}

@end
