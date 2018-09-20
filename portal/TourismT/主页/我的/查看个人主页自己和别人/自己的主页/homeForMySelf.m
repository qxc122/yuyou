//
//  homeForMySelf.m
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeForMySelf.h"
#import "AlreadyReleased.h"
#import "draft.h"
#import "YX.h"
#import "WJItemsControlView.h"


@interface homeForMySelf()<UIScrollViewDelegate>
{
    WJItemsControlView *_itemControlView;
}
@property (nonatomic, weak) AlreadyReleased *tabTitleView1;
@property (nonatomic, weak) draft *tabTitleView2;
@property (nonatomic, strong) UIScrollView *tabContentView;
@property (nonatomic,strong) NSMutableArray *arry;
@end

@implementation homeForMySelf

-(instancetype)initWithTabConfigArray:(NSArray *)tabConfigArray{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        if (ScreenHeight==812){
                    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-HEIGHT_NavbarX);
        }else{
            
            self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-HEIGHT_Navbar);
        }
        
        NSMutableArray *titleArray = [NSMutableArray array];
        for (int i=0; i<tabConfigArray.count; i++) {
            NSDictionary *itemDic = tabConfigArray[i];
            [titleArray addObject:itemDic[@"title"]];
        }
        
        //头部控制的segMent
        WJItemsConfig *config = [[WJItemsConfig alloc]init];
        config.itemWidth = ScreenWidth/2.0;
        config.itemFont = PingFangSC_Regular(14);
        config.selectedColor = ColorWithHex(0x779CF4, 1.0);
        config.textColor = ColorWithHex(0x000000, 0.86);
        config.linePercent = 50/ScreenWidth/0.5;
        
        _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
        _itemControlView.tapAnimation = NO;
        _itemControlView.config = config;
//        _itemControlView.titleArray = @[@"已发布游记",@"草稿箱"]; //要取消

        
        kWeakSelf(self);
        [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){
            NSLog(@"index=%ld",index);
            weakself.tabContentView.contentOffset = CGPointMake(SCREEN_WIDTH*index,animation);
        }];
        [self addSubview:_itemControlView];

        _tabContentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_itemControlView.frame), SCREEN_WIDTH, CGRectGetHeight(self.frame) - CGRectGetHeight(_itemControlView.frame))];
        _tabContentView.contentSize = CGSizeMake(CGRectGetWidth(_tabContentView.frame)*titleArray.count, CGRectGetHeight(_tabContentView.frame));
        _tabContentView.pagingEnabled = YES;
        _tabContentView.bounces = NO;
        _tabContentView.showsHorizontalScrollIndicator = NO;
        _tabContentView.showsVerticalScrollIndicator = NO;
        _tabContentView.delegate = self;
        [self addSubview:_tabContentView];
        
        for (int i=0; i<tabConfigArray.count; i++) {
            if (i == 0) {
                AlreadyReleased *itemBaseView = [[AlreadyReleased alloc] init];
                [itemBaseView renderUIWithInfo:tabConfigArray[i]];
                [_tabContentView addSubview:itemBaseView];
                self.tabTitleView1 = itemBaseView;
                itemBaseView.shareORkeep = ^(travelSharingsS *one){
                    if (weakself.shareORkeep) {
                        weakself.shareORkeep(one);
                    }
                };
            } else if (i == 1) {
                draft *itemBaseView = [[draft alloc] init];
                [itemBaseView renderUIWithInfo:tabConfigArray[i]];
                [_tabContentView addSubview:itemBaseView];
                self.tabTitleView2 = itemBaseView;
                itemBaseView.EditDraft = ^(NSString *one){
                    if (weakself.EditDraft) {
                        weakself.EditDraft(one);
                    }
                };
            }
        }
        
        UIView *line =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_itemControlView.frame), ScreenWidth, 0.5)];
        [self addSubview:line];
        line.backgroundColor = ColorWithHex(0x979797, 0.4);
        

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(The_draft_box_has_been_updatedFuc)
                                                     name:The_draft_box_has_been_updated
                                                   object:nil];
        
//        [self The_draft_box_has_been_updatedFuc];
    }
    return self;
}
#pragma --mark<草稿箱有更新了>
- (void)The_draft_box_has_been_updatedFuc{
    self.arry = [NSMutableArray array];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *files = [fileManager subpathsAtPath:PATH_OF_DOCUMENT];
        for (NSString *path in files) {
            if ([path rangeOfString:DraftCover].location != NSNotFound) {
                [self.arry addObject:path];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tabTitleView2.arry = self.arry; //@[@"已发布游记",@"草稿箱"];
             _itemControlView.titleArray = @[[NSString stringWithFormat:@"已发布游记 %ld",self.oneData.publishTravels],[NSString stringWithFormat:@"%@ %ld",@"草稿箱",self.arry.count]];
        });
    });
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger pageNum = offsetX/SCREEN_WIDTH;
    //NSLog(@"pageNum == %zi",pageNum);
    //    [_tabTitleView setItemSelected:pageNum];
    [_itemControlView moveToIndex:pageNum];
}
- (void)setOneData:(peoHome_page *)oneData{
    if (oneData) {
        _oneData = oneData;
        self.tabTitleView1.oneData = oneData;
        [self The_draft_box_has_been_updatedFuc];
    }
}
@end
