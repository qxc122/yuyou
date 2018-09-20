//
//  sysPhto.m
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "sysPhto.h"
#import "SuPhotoManager.h"
#import "sysphoCell.h"
#import "meiPan.h"
#import "editImageOK.h"
#import "NSDate+DateTools.h"
#import "timeCoCell.h"
#import "loginCoCell.h"
#import <UICollectionViewLeftAlignedLayout.h>
#import "SelectOrderVc.h"
#import "MWZoomingScrollView.h"
#import "SelectOrderVc.h"
#define anTime  0.33


#define spaceingsysPhto  5
#define spaceingsysPhtoTwo  15
@interface sysPhto ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateLeftAlignedLayout,MWPhotoBrowserDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) NSMutableArray *images; //总的资源
@property (nonatomic, strong) NSMutableArray *imagesForTime; //总的资源,按时间分类的
@property (nonatomic, weak) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray *seleImages;//选中的照片

@property (nonatomic, weak) UIButton *btnOk; //开发发布按钮
@property (nonatomic, assign) BOOL IsNeedReadTheAlbumAgain; //是否需要重新读取相册
@property (nonatomic, assign) BOOL IsTakePictures; //拍照了

@property (nonatomic, assign) BOOL Is_it_a_preview_button; //是否是预览按钮
@property (nonatomic, weak) UIButton *btnView; //预览了
@end

@implementation sysPhto
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.MAXnum = 100;
        self.Is_there_a_preview_button = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.seleImages = [NSMutableArray array];
    self.imagesForTime = [NSMutableArray array];
    self.images = [NSMutableArray array];
    [self setUi];
    self.title = @"选择照片";
    self.IsNeedReadTheAlbumAgain = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.IsNeedReadTheAlbumAgain) {
        [self getXiangChen];
    }
}
- (void)getXiangChen{
    kWeakSelf(self);
    [weakself.images removeAllObjects];
    [weakself.imagesForTime removeAllObjects];
    [MBProgressHUD showLoadingMessage:@"读取相册中..." toView:self.view];
    [[tourHelper sharedInstance]photoSHouquanOKsuccess:^{
        weakself.images = [[[SuPhotoManager manager]fetchAllAssets]mutableCopy];
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        // 设置日期格式 为了转换成功
        format.dateFormat = @"yyyy-MM-dd";
        
        // NSString * -> NSDate *
        PHAsset *PHAssetDatePre;
        NSInteger pre = 0;
        NSInteger preOK = 0;
        for (PHAsset *PHAssetDate in weakself.images) {
            if (PHAssetDatePre) {
                bool isSameDay = [PHAssetDate.creationDate isSameDay:PHAssetDatePre.creationDate];
                if (!isSameDay) {
                    mytime *one = [mytime new];
                    one.timeStr = [PHAssetDatePre.creationDate formattedDateWithStyle:NSDateFormatterFullStyle];
                    one.arry = [[weakself.images subarrayWithRange:NSMakeRange(preOK, pre-preOK)] mutableCopy];
                    [weakself.imagesForTime addObject:one];
                    preOK = pre;
                }
            }
            NSString *newString = [PHAssetDate.creationDate formattedDateWithStyle:NSDateFormatterFullStyle];
            NSLog(@"creationDate=%@",newString);
            pre++;
            PHAssetDatePre = PHAssetDate;
        }
        if (!PHAssetDatePre) {
            PHAssetDatePre = [weakself.images firstObject];
        }
        mytime *one = [mytime new];
        one.timeStr = [PHAssetDatePre.creationDate formattedDateWithStyle:NSDateFormatterFullStyle];
        one.arry = [[weakself.images subarrayWithRange:NSMakeRange(preOK, weakself.images.count-preOK)] mutableCopy];
        [weakself.imagesForTime addObject:one];
        
        [MBProgressHUD hideHUDForView:weakself.view animated:YES];
        [weakself.collectionView reloadData];
        weakself.IsNeedReadTheAlbumAgain = NO;
        if (weakself.IsTakePictures) {
            [weakself.seleImages addObject:[weakself.images firstObject]];
            [weakself  setHidenOrshow:self.seleImages.count];
        }
    } failure:^{
        [MBProgressHUD hideHUDForView:weakself.view animated:YES];
        [weakself popSelf];
    }];
}

- (void)setUi{
    UICollectionViewLeftAlignedLayout *flowLayOut = [[UICollectionViewLeftAlignedLayout alloc]init];
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.bounces = YES;
    collectionView.pagingEnabled = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[sysphoCell class] forCellWithReuseIdentifier:NSStringFromClass([sysphoCell class])];
    [collectionView registerClass:[timeCoCell class] forCellWithReuseIdentifier:NSStringFromClass([timeCoCell class])];
    [collectionView registerClass:[loginCoCell class] forCellWithReuseIdentifier:NSStringFromClass([loginCoCell class])];

    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    collectionView.tag = one_collection_ENMU;
    
    if (self.Is_there_a_preview_button) {
        UIButton *btnView = [UIButton new];
        [btnView setTitle:@"预览" forState:UIControlStateNormal];
        [btnView setTitleColor:ColorWithHex(0x000000, 1.0) forState:UIControlStateNormal];
        btnView.titleLabel.font = PingFangSC_Regular(17);
        [self.view addSubview:btnView];
        [btnView addTarget:self action:@selector(btnViewClick) forControlEvents:UIControlEventTouchUpInside];
        self.btnView = btnView;
        [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(15);
            make.bottom.equalTo(self.view);
            make.width.equalTo(@42);
            make.height.equalTo(@50);
        }];
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view);
            make.left.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(btnView.mas_top);
        }];
    } else {
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view);
            make.left.equalTo(self.view);
            make.top.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
    }

    UIButton *btnOk = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 110,40)];
    btnOk.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    [btnOk setTitle:@"sdf" forState:UIControlStateNormal];
    [btnOk setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    btnOk.titleLabel.font = PingFangSC_Regular(15);
    [btnOk addTarget:self action:@selector(chooseYes) forControlEvents:UIControlEventTouchUpInside];
    self.btnOk = btnOk;
    UIBarButtonItem* leftBarutton = [[UIBarButtonItem alloc] initWithCustomView:btnOk];
    self.navigationItem.rightBarButtonItem = leftBarutton;
}


- (void)chooseYes{
    if (self.isPingjia && self.returnImageForPingjia) {
        self.returnImageForPingjia(self.seleImages);
        [self popSelf];
    }else{
        if (self.returnClick) {
            self.returnClick(self.seleImages);
            [self popSelf];
        } else {
            if (self.dateSelectOrder.Arry_orders.count) {
                if (self.isFromPingJia) {
                    [self OpenmeiPan];
                }else{
                    [self openVcFormeiPanVc];
                }
            } else {
                [self OpenmeiPan];
            }
        }
    }
}

#pragma -mark<打开 meiPan 控制器>
- (void)OpenmeiPan{
    meiPan *vc =[[meiPan alloc]init];
    if (self.isFromPingJia) {
        vc.date = self.dateSelectOrder.Arry_orders.firstObject;
    }
    vc.isFromPingJia = self.isFromPingJia;
    vc.orderId  =self.orderId;
    vc.seleImages = self.seleImages;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma --mark----开始发布按钮
- (void)btnOkClick:(UIButton *)btn{
    if (self.returnClick) {
        self.returnClick(self.seleImages);
        [self popSelf];
    } else {
        if ([self.seleImages count]) {
            [self openVcFormeiPanVc];
        } else {
            [MBProgressHUD showPrompt:@"最少选择一张照片" toView:self.view];
        }
    }
}
#pragma --mark<打开 meiPan 控制器>
- (void)openVcFormeiPanVc{
    SelectOrderVc *vc = [SelectOrderVc new];
    vc.CTrollersToR = @[[self class]];
    vc.orderId  =self.orderId;
    vc.seleImages = self.seleImages;
    vc.date = self.dateSelectOrder;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.imagesForTime.count?self.imagesForTime.count:1;
}

#pragma --mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.imagesForTime.count) {
        mytime *date = self.imagesForTime[section];
        if (section == 0) {
            return date.arry.count+2;
        } else {
            return date.arry.count+1;
        }
    } else {
        return 2;
    }
    return 0;
}


#pragma --mark<设置 显示还是 隐藏>
- (void)setHidenOrshow:(NSInteger )total{
    if (total) {
        self.btnOk.hidden = NO;
        NSString *titl;
        if (self.isPingjia) {
            titl = [NSString stringWithFormat:@"确认(%ld/5)",(long)total+self.isSelected];
        } else {
            titl = [NSString stringWithFormat:@"确认(%ld/%ld)",(long)total+self.isSelected,self.MAXnum];
        }
        [self.btnOk setTitle:titl forState:UIControlStateNormal];
    } else {
        self.btnOk.hidden = YES;
    }
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.imagesForTime.count) {
        mytime *one = self.imagesForTime[indexPath.section];
        if (indexPath.row == 0) {
            timeCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([timeCoCell class]) forIndexPath:indexPath];
            cell.timeStr = one.timeStr;
            return cell;
        } else {
            if (indexPath.section == 0 && indexPath.row == 1) {
                loginCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([loginCoCell class]) forIndexPath:indexPath];
                cell.imageStr = @"拍照";
                return cell;
            } else {
                sysphoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([sysphoCell class]) forIndexPath:indexPath];
                
                NSInteger row = indexPath.row;
                if (indexPath.section==0) {
                    row -= 2;
                } else {
                    row -= 1;
                }
                cell.PHAssetDate = one.arry[row];
                if ([self.seleImages containsObject:cell.PHAssetDate]) {
                    cell.isSelcet = YES;
                } else {
                    cell.isSelcet = NO;
                }
                cell.isEdit = self.isEdit;
                cell.collectionType = one_collection_ENMU;
                
                cell.indexPath = indexPath;
                kWeakSelf(self);
                cell.cellClick = ^(NSIndexPath *indexPath,PHAsset *imageDate,collection_ENMU collectionType,BOOL isSelcet){
                    if (collectionType == one_collection_ENMU) {
                        [weakself addOrdeImagesBtn:isSelcet :imageDate :indexPath];
                    }
                };
                return cell;
            }
        }
    } else {
        if (indexPath.row == 0) {
            timeCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([timeCoCell class]) forIndexPath:indexPath];
            cell.timeStr = [[NSDate dateWithDaysFromNow:0] formattedDateWithStyle:NSDateFormatterFullStyle];
            return cell;
        } else {
            loginCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([loginCoCell class]) forIndexPath:indexPath];
            cell.imageStr = @"1";
            return cell;
        }
    }
    return nil;
}

- (void)addOrdeImagesBtn:(BOOL)isSelcet :(PHAsset *)imageDate :(NSIndexPath *)index{
    if (isSelcet) {
        if ([self.seleImages count]+self.isSelected<self.MAXnum) {
            [self.seleImages addObject:imageDate];
        }else{
            [MBProgressHUD showPrompt:[NSString stringWithFormat:@"最多选择%ld张",(long)self.MAXnum] toView:self.view];
            sysphoCell *cellOld = (sysphoCell *)[self.collectionView cellForItemAtIndexPath:index];
            cellOld.isSelcet = NO;
        }
    } else {
        [self.seleImages removeObject:imageDate];
    }
    [self  setHidenOrshow:self.seleImages.count];
}

#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return CGSizeMake(ScreenWidth,45);
    } else {
        return CGSizeMake((ScreenWidth-3*spaceingsysPhto)/4.0, (ScreenWidth-3*spaceingsysPhto)/4.0);
    }
    return CGSizeZero;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
//    if (collectionView.tag == one_collection_ENMU) {
//        return  UIEdgeInsetsMake(spaceingsysPhto, 0, 0, 0);
//    } else if (collectionView.tag == two_collection_ENMU){
//        return  UIEdgeInsetsZero;
//    }
    return  UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return spaceingsysPhto;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return spaceingsysPhto;
}






#pragma --mark UICollectionView Delegate
#pragma --mark<点击了一个cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.Is_it_a_preview_button = NO;
    if (indexPath.section == 0 && indexPath.row == 1) {
        [self openCamera];
    } else if (indexPath.row != 0){
        NSInteger total=indexPath.row;
        if (indexPath.section == 0) {
            total -= 2;
        } else {
            total -= 1;
        }
        for (NSInteger tmp = 0; tmp<indexPath.section; tmp++) {
            mytime *one = self.imagesForTime[tmp];
            total += one.arry.count;
        }
        if (self.isEdit) {
            [self selectAvtorDone:self.images[total]];
        } else {
            [self Open_album_browsing:total];
        }
    }
}

#pragma --mark<btnViewClick 预览按钮>
- (void)btnViewClick{
    if (self.seleImages.count) {
        self.Is_it_a_preview_button = YES;
        [self Open_album_browsing:0];
    } else {
        [MBProgressHUD showPrompt:@"先选择照片才能预览哦～" toView:self.view];
    }
}

#pragma --mark<打开相册浏览>
- (void)Open_album_browsing:(NSInteger)index{
    CusMWPhotoBrowser *browser = [[CusMWPhotoBrowser alloc] initWithDelegate:self];
    browser.backColor = [UIColor whiteColor];
    //        self.browser = browser;
    // Set options
    browser.displayActionButton = NO; // Show action button to allow sharing, copying, etc (defaults to YES)
    browser.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    browser.displaySelectionButtons = YES; // Whether selection buttons are shown on each image (defaults to NO)
    browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    browser.alwaysShowControls = YES; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    browser.enableGrid = NO; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    browser.startOnGrid = NO; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    
    // Customise selection images to change colours if required
    // Optionally set the current visible photo before displaying
    
    [browser setCurrentPhotoIndex:index];
    browser.isChoosePhotos = YES;
    kWeakSelf(self);
    browser.btnClick = ^(){
        if (weakself.seleImages.count) {
            [weakself chooseYes];
        }
    };
    // Present
    UINavigationController *photoNavigationController = [[UINavigationController alloc] initWithRootViewController:browser];
    photoNavigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:photoNavigationController animated:YES completion:nil];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    if (self.Is_it_a_preview_button) {
        return  self.seleImages.count;
    } else {
        return  self.images.count;
    }
    return 0;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    PHAsset *oneone;
    if (self.Is_it_a_preview_button) {
        oneone = self.seleImages[index];
    } else {
        oneone = self.images[index];
    }
    MWPhoto *one = [[MWPhoto alloc]initWithAsset:oneone targetSize:CGSizeMake(800, 800)];
    return one;
}


-(void)findSubView:(UIView*)view
{
    for (UIButton* tmp in view.subviews)
    {
//        if ([tmp isKindOfClass:[MWZoomingScrollView class]]) {
//            for (UIView *tmpCh in tmp.subviews) {
//                tmpCh.backgroundColor = [UIColor whiteColor];
//            }
//            break;
//        }else{
//            [self findSubView:tmp];
//        }
        if (![tmp isKindOfClass:[UIButton class]] && ![tmp isKindOfClass:[UIImageView class]]) {
            tmp.backgroundColor = [UIColor whiteColor];
        }
        [self findSubView:tmp];
    }
}

- (NSString *)photoBrowser:(MWPhotoBrowser *)photoBrowser titleForPhotoAtIndex:(NSUInteger)index{
    NSString *title = [NSString stringWithFormat:@"%ld/",index+1];
    if (self.Is_it_a_preview_button) {
       title =  [title stringByAppendingString:[NSString stringWithFormat:@"%ld",self.seleImages.count]];
    } else {
       title = [title stringByAppendingString:[NSString stringWithFormat:@"%ld",self.images.count]];
    }
    return  title;
}
#pragma --mark<设置将要显示的视图，是否被选或者没有被选，把它放到一个数组中>
- (BOOL)photoBrowser:(MWPhotoBrowser *)photoBrowser isPhotoSelectedAtIndex:(NSUInteger)index {
//    [self findSubView:photoBrowser.view];
    PHAsset *oneone;
    if (self.Is_it_a_preview_button) {
        oneone = self.seleImages[index];
    } else {
        oneone = self.images[index];
    }
    if ([self.seleImages containsObject:oneone]) {
        return YES;
    }
    return NO;
}

#pragma --mark<当前显示图片，选择按钮是否被选，或者没有被选，会触发这个方法>

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index selectedChanged:(BOOL)selected {
    PHAsset *ima;
    if (self.Is_it_a_preview_button) {
        ima = self.seleImages[index];
    } else {
        ima = self.images[index];
    }

    if (selected) {
        if ((self.seleImages.count+self.isSelected)<self.MAXnum) {
            [self.seleImages addObject:ima];
        }else{
            [MBProgressHUD showPrompt:[NSString stringWithFormat:@"最多选择%ld张",(long)self.MAXnum]];
        }
    } else {
        [self.seleImages removeObject:ima];
        if (self.Is_it_a_preview_button) {
            if (self.seleImages.count) {
                [photoBrowser reloadData];
            } else {
                [photoBrowser dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
    NSInteger sec = 0;
    NSInteger row = 0;
    for (mytime *one in self.imagesForTime) {
        row= 0;
        for (PHAsset *tmp in one.arry) {
            if ([tmp isEqual:ima]) {
                if (sec == 0) {
                    row += 2;
                }else{
                    row += 1;
                }
                [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:sec]]];
                break;
            }
            row++;
        }
        sec++;
    }


//    sysphoCell *cellOld = (sysphoCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
//    cellOld.isSelcet = selected;
    [self setHidenOrshow:self.seleImages.count];
}

#pragma --mark<打开照相机>
/**
 
 *  调用照相机
 
 */
- (void)openCamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES; //可编辑
    //判断是否可以打开照相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        //摄像头
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }
    else
    {
        [MBProgressHUD showError:@"没有摄像头" toView:self.view];
        NSLog(@"没有摄像头");
    }
}

#pragma mark - UIImagePickerControllerDelegate
// 拍照完成回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0)

{
    NSLog(@"finish..");
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        //图片存入相册
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
//回调方法长这样：
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        // Show error message...
        [MBProgressHUD showError:error.description toView:self.view];
    }
    else  // No errors
    {
        if (self.isEdit) {
            [self selectAvtorDone:image];
        } else {
            self.IsTakePictures = YES;
            [self getXiangChen];
        }

        // Show message image successfully saved
    }
}


#pragma --mark<选择头像完成>
- (void)selectAvtorDone:(id)ImageData{
    if (self.returnImage) {
        self.returnImage(ImageData);
        [self popSelf];
    }
//    editImageOK *vc = [[editImageOK alloc]init];
//    vc.PHAssetDate = self.images[total];
//    vc.btnClick = ^(UIImage *icon){
//        if (weakself.returnImage) {
//            weakself.returnImage(icon);
//            [weakself popSelf];
//        }
//    };
//    [self.navigationController pushViewController:vc animated:YES];

}

//进入拍摄页面点击取消按钮

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker

{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
