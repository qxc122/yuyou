//
//  GroupMemberVc.m
//  TourismT
//
//  Created by Store on 2017/6/22.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "GroupMemberVc.h"
#import "noticeCoCell.h"
#import "groupMemberCoCell.h"
#import "myOrotherHome.h"
@interface GroupMemberVc ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (nonatomic,weak) UICollectionView *collectionView;
@end


@implementation GroupMemberVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}
- (void)setUiBasic{}
- (void)setUI{
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);;
    }];
    
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
    self.collectionView = collectionView;
    //    collectionView.scrollEnabled = NO;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    //    collectionView.bounces = NO;
    //        collectionView.pagingEnabled = YES;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[noticeCoCell class] forCellWithReuseIdentifier:NSStringFromClass([noticeCoCell class])];
    [collectionView registerClass:[groupMemberCoCell class] forCellWithReuseIdentifier:NSStringFromClass([groupMemberCoCell class])];

    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);;
    }];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 5, 0);
    [self setEmptyDelegate:self.collectionView];
    self.collectionView.mj_header = self.header;
    
    if (self.embersPeo) {
        self.empty_typeV2 = succes_empty_numV2;
        self.title = [NSString stringWithFormat:@"%@(%lu)",self.embersPeo.name,(unsigned long)self.embersPeo.membersA.count];
    }else{
        [self.header beginRefreshing];
    }
//    [self.header beginRefreshing];
//    EMGroup *group = [EMGroup groupWithId:self.conversationId];
//    NSString *ower = group.owner;
//    NSString *owe1r = group.owner;
}

#pragma -mark<MJ_head加载数据>
- (void)loadNewData{
    kWeakSelf(self);
    [[ToolRequest sharedInstance] appuseremchatmembersWithidd:weakself.conversationId NONEsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.empty_typeV2 = code;
        NSString *pathUserTmp = [NSString stringWithFormat:@"%@group.data",weakself.conversationId];
        NSString *pathUser = [PATH_OF_DOCUMENT stringByAppendingPathComponent:pathUserTmp];
        membersGroupS *embersPeo = [membersGroupS mj_objectWithKeyValues:dataDict];
        [NSKeyedArchiver archiveRootObject:embersPeo toFile:pathUser];
        weakself.embersPeo = embersPeo;
        [weakself.collectionView reloadData];
        weakself.collectionView.mj_header.hidden = YES;
        [weakself.collectionView.mj_header endRefreshing];
        weakself.title = [NSString stringWithFormat:@"%@(%lu)",weakself.embersPeo.name,(unsigned long)weakself.embersPeo.membersA.count];
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself.header endRefreshing];
        weakself.empty_typeV2 = errorCode;
        [weakself.collectionView reloadData];
    }];
}


#pragma mark----UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.empty_typeV2 == succes_empty_numV2) {
        return 2;
    }
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.embersPeo.Arry_notices.count;
    } else if (section == 1) {
        return self.embersPeo.membersA.count;
    }
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
    } else if (indexPath.section == 1) {
        myOrotherHome *vc = [myOrotherHome new];
        groupsForOneS *one = self.embersPeo.membersA[indexPath.row];  //群组 成员
        vc.idd = one.idd;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        noticeCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([noticeCoCell class]) forIndexPath:indexPath];
        [self configurenoticeCoCell:cell atIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 1) {
        groupMemberCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([groupMemberCoCell class]) forIndexPath:indexPath];
        [self configuregroupMemberCoCell:cell atIndexPath:indexPath];
        return cell;
    }
    return nil;
}
#pragma --mark<配置 公告cell>
- (void)configurenoticeCoCell:(noticeCoCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.date = self.embersPeo.Arry_notices[indexPath.row];
}
#pragma --mark<配置 群成员cell>
- (void)configuregroupMemberCoCell:(groupMemberCoCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.one =self.embersPeo.membersA[indexPath.row];
}

#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenWidth-15-15,100);
    }  else if (indexPath.section == 1) {
        return CGSizeMake(55,55+12+10);
    }
    return CGSizeZero;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets set = UIEdgeInsetsZero;
    if (section == 0) {
        set = UIEdgeInsetsMake(10, 15,20, 15);
    } else if (section == 1) {
        set = UIEdgeInsetsMake(0, (ScreenWidth-55*4)/5.0, 0, (ScreenWidth-55*4)/5.0);
    }
    return  set;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return 10;
    } else if (section == 1) {
        return 15;
    }
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        
    } else if (section == 1) {
        return (ScreenWidth-55*4)/5.0;
    }
    return 0;
}

//当cell高亮时返回是否高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return NO;
    }
    return YES;
}
@end
