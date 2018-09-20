//
//  eidtMyInfo.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "eidtMyInfo.h"
#import "chageAvtor.h"
//#import "SuPhotoManager.h"
#import "editImageOK.h"
#import "login.h"
#import "sysPhto.h"
#import "EditMyCell.h"
#import "NSString+check.h"
#import "MWeditImageOK.h"

@interface eidtMyInfo ()<UIActionSheetDelegate,UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,MWPhotoBrowserDelegate>
@property (nonatomic,strong) NSMutableArray *ziyaunarry;
@property (nonatomic,assign) BOOL isFirest; //是否是第一相应着
@property (nonatomic,strong) MWeditImageOK* MWeditImageOKVc; //是否是第一相应着

@end

@implementation eidtMyInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑个人资料";
    UIBarButtonItem *rightBtn =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClic:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    // Do any additional setup after loading the view.
    [self setUitableViewstyle:UITableViewStylePlain];
    self.basicTableView.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
    self.basicTableView.delegate = self;
    self.basicTableView.dataSource = self;
    [self.basicTableView registerClass:[EditMyCell class] forCellReuseIdentifier:NSStringFromClass([EditMyCell class])];
    [self MJRefreshHead];
}
#pragma -mark<MJ_head加载数据  头部>
- (void)MJRefreshHead{
    kWeakSelf(self);
    self.basicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [[ToolRequest sharedInstance]appusereditWithNOnesuccess:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.decodedBag  =[UserS mj_objectWithKeyValues:dataDict];
            weakself.IsLoadSuccessfully = YES;
            [weakself setdelegate];
        } failure:^(NSInteger errorCode, NSString *msg) {
            weakself.IsLoadSuccessfully = NO;
            [weakself setdelegate];
        }];
    }];
    [self.basicTableView.mj_header beginRefreshing];
}

- (void)setdelegate{
    self.basicTableView.mj_header.hidden = YES;
    [self.basicTableView.mj_header endRefreshing];
    if (!self.basicTableView.emptyDataSetSource ) {
        self.basicTableView.emptyDataSetSource = self;
    }
    if (!self.basicTableView.emptyDataSetDelegate ) {
        self.basicTableView.emptyDataSetDelegate = self;
    }
    [self.basicTableView reloadData];
}


#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([EditMyCell class]) configuration:^(EditMyCell *cell) {
        [weakself configureEditMyCell:cell atIndexPath:indexPath];
    }];
}

#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.IsLoadSuccessfully) {
        return 1;
    }
    return 0;
}

#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{    EditMyCell *cell = [EditMyCell returnCellWith:tableView];
    [self configureEditMyCell:cell atIndexPath:indexPath];
    return  cell;
}

#pragma -mark<配置 cell>
- (void)configureEditMyCell:(EditMyCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.decodedBag = self.decodedBag;
    kWeakSelf(self);
    cell.ctnClick = ^(eidtMyInfo_btnENUM tagg){
        if (tagg == icon_eidtMyInfo_btnENUM) {
            [weakself chooseImage];
        } else if (tagg== sex_eidtMyInfo_btnENUM) {
            UIActionSheet*sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:weakself cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男",@"女",nil];
            [sheet showInView:weakself.view];
        }
    };
    cell.isFirest = self.isFirest;
    self.isFirest = NO;
    cell.reloadHeight = ^(){
        weakself.isFirest = YES;
        [weakself.basicTableView reloadData];
    };
}

#pragma --mark<UIActionSheetDelegate  sheet 协议>
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex=%ld",buttonIndex);
    if (buttonIndex == 0) {
        self.decodedBag.gender = SEX_male;
    } else if (buttonIndex == 1){
        self.decodedBag.gender = SEX_female;
    }
    [self.basicTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma --mark<点击完成按钮>
- (void)rightBtnClic:(UIBarButtonItem *)bar{

    NSLog(@"self.decodedBag.nickName=%@",self.decodedBag.nickName);
    if (!self.decodedBag.avatar) {
        [MBProgressHUD showPrompt:@"请选择头像" toView:self.view];
        return;
    }
    if (!self.decodedBag.nickName || !self.decodedBag.nickName.length) {
        [MBProgressHUD showPrompt:@"请输入昵称" toView:self.view];
        return;
    }
    if (!self.decodedBag.gender || !self.decodedBag.gender.length) {
        [MBProgressHUD showPrompt:@"请选择性别" toView:self.view];
        return;
    }
//    if (!self.detail.text || !self.detail.text.length) {
//        [MBProgressHUD showPrompt:@"请输入简介" toView:self.view];
//        return;
//    }
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"上传中..." toView:self.view];
    
    
    [[ToolRequest sharedInstance]appuserupdateWithnickName:self.decodedBag.nickName gender:self.decodedBag.gender signature:self.decodedBag.signature  avtor:self.decodedBag.image  progress:^(NSProgress *uploadProgress) {
        NSLog(@"uploadProgress=%@ %f",uploadProgress, uploadProgress.fractionCompleted);
        NSLog(@"uploadProgress=%@",uploadProgress);
//        HUD.progress = uploadProgress.fractionCompleted;
//        if (uploadProgress.fractionCompleted >= 1.0) {
//            [HUD removeFromSuperview];
//        }
    } success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg];
//        if (weakself.btnClick) {
            UserS *date = [UserS mj_objectWithKeyValues:dataDict];
            weakself.decodedBag.avatar = date.avatar;
            weakself.decodedBag.gender = date.gender;
            weakself.decodedBag.nickName = date.nickName;
            weakself.decodedBag.signature = date.signature;
        
            appS *decodedBag = [tourInfo sharedInstance].UserInfo;
            if (![decodedBag.avatar isEqualToString:date.avatar]) {
                decodedBag.avatar = date.avatar;
                [tourInfo sharedInstance].UserInfo = decodedBag;
                NSNotification *notificationHead =[NSNotification notificationWithName:MorepersonalinformationHeadNotice object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notificationHead];
            }
            if (![decodedBag.nickName isEqualToString:date.nickName]) {
                decodedBag.nickName = date.nickName;
                [tourInfo sharedInstance].UserInfo = decodedBag;
                NSNotification *notificationName =[NSNotification notificationWithName:MorepersonalinformationNikNameNotice object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notificationName];
            }

            NSDictionary *dictTmp = @{MorepersonalinformationNotice:weakself.decodedBag,};
            NSNotification *notification =[NSNotification notificationWithName:MorepersonalinformationNotice object:nil userInfo:dictTmp];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            
//            weakself.btnClick(weakself.decodedBag);
            [weakself popSelf];
//        }
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}

#pragma --mark<选择照片>
- (void)chooseImage{
    kWeakSelf(self);
    sysPhto *vc =[sysPhto new];
    vc.Is_there_a_preview_button = NO;
    vc.isEdit = YES;
    vc.returnImage = ^(UIImage *image){
        if ([image isKindOfClass:[UIImage class]]) {
            weakself.decodedBag.image = image;
        } else {
            weakself.decodedBag.Asset = (PHAsset *)image;
        }
        [weakself OpenMWeditImageOK];
    };
    [self.navigationController pushViewController:vc animated:YES];
    
//    chageAvtor *vc =[chageAvtor new];
//    [self.navigationController pushViewController:vc animated:YES];
}


#pragma --mark<打开裁剪头像>
- (void)OpenMWeditImageOK{
    MWeditImageOK *browser = [[MWeditImageOK alloc] initWithDelegate:self];
    browser.backColor = [UIColor whiteColor];
    self.MWeditImageOKVc = browser;
    
    // Set options
    //    browser.CusBackColor = [UIColor whiteColor];
    browser.displayActionButton = NO; // Show action button to allow sharing, copying, etc (defaults to YES)
    browser.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    browser.displaySelectionButtons = NO; // Whether selection buttons are shown on each image (defaults to NO)
    browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    browser.alwaysShowControls = YES; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    browser.enableGrid = NO; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    browser.startOnGrid = NO; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    kWeakSelf(self);
    browser.returnAvtor = ^(UIImage *icon) {
        [weakself DoWithAvtor:icon];
    };
    
    // Customise selection images to change colours if required
    // Optionally set the current visible photo before displaying
    [browser setCurrentPhotoIndex:0];
    UINavigationController *photoNavigationController = [[UINavigationController alloc] initWithRootViewController:browser];
    photoNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:photoNavigationController animated:YES completion:nil];
}
#pragma --mark<得到裁剪头像Do>
- (void)DoWithAvtor:(UIImage *)avrot{
    self.decodedBag.image = avrot;
    [self.basicTableView reloadData];
}
#pragma --mark<SDCycleScrollViewDelegate  照片浏览器的回调   有多少个>
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return 1;
}
#pragma --mark<SDCycleScrollViewDelegate  照片浏览器的回调  每个MWPhoto>
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *oen;
    if (self.decodedBag.Asset) {
        oen = [[MWPhoto alloc]initWithAsset:self.decodedBag.Asset targetSize:CGSizeMake(800, 800)];
    } else {
        oen = [[MWPhoto alloc]initWithImage:self.decodedBag.image];
    }
    return oen;
}

- (NSString *)photoBrowser:(MWPhotoBrowser *)photoBrowser titleForPhotoAtIndex:(NSUInteger)index{
    return  @"设定头像";
}

#pragma --<空白页处理>

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:load_fail_image];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    if (!self.IsLoadSuccessfully) {
        NSString *text = @"服务器开小差了，刷新一下吧";
        
        NSDictionary *attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                                     NSForegroundColorAttributeName: [UIColor darkGrayColor]};
        
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    return nil;
}


- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text;
    NSDictionary *attributes;
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;

        text = @"点击重新加载";
        attributes = @{NSFontAttributeName: PingFangSC_Regular(17),
                       NSForegroundColorAttributeName: ColorWithHex(0x779CF4, 1.0),
                       NSParagraphStyleAttributeName: paragraph};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

//按钮文本或者背景样式

//- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f]};
//
//    return [[NSAttributedString alloc] initWithString:@"Continue 点击继续" attributes:attributes];
//}
//
//- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
//    return [UIImage imageNamed:@"123"];
//}

//空白页的背景色

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor clearColor];
}

//是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    if (!self.IsLoadSuccessfully) {
        return YES;
    }
    return NO;
}

//空白页点击事件
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
    if (!self.IsLoadSuccessfully) {
        self.basicTableView.mj_header.hidden = NO;
        [self.basicTableView.mj_header beginRefreshing];
    }
}

//空白页按钮点击事件
//- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView {
//    self.tableView.mj_header.hidden = NO;
//    [self.tableView.mj_header beginRefreshing];
//}
@end
