//
//  meiPan.m
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "meiPan.h"
#import "meiPancoCell.h"
#import "sysPhto.h"
#import "lookWkweb.h"
#import "SuPhotoManager.h"
#import "meiPanFootTool.h"
#import "DateTools.h"
#import "SelectOrderVc.h"

#define whenTime 0.3

@interface meiPan ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (atomic, assign) BOOL isReleasePhoto;//是否是正在发布

//@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,weak) UITextField *input;
@property (nonatomic, strong) UIPanGestureRecognizer *MoveGesture;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;
@property (nonatomic, strong) NSMutableArray *seleImagesDES;//对应照片的描述
@property (nonatomic, assign) BOOL isMove;//是否是移动

@property (nonatomic, strong) travelSharingsS *returnData;//发布结果



@property (nonatomic, weak) MBProgressHUD *HUD;//是否是移动


@property (nonatomic, strong) NSMutableArray *UrlArryEnd;//图片地址数组
@property (nonatomic, strong) NSMutableArray *PhsetArryEnd;//图片资源数组

//@property (nonatomic, assign) BOOL isFabuzhong;//在发布中，

@property (nonatomic, assign) BOOL isFabu;//是否在发布

@property (nonatomic, strong) mydraft *one;//草稿的详细数据

@end


@implementation meiPan

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUi];
    self.title = @"编辑游记";
    if (self.dateOne) {
        [self customRightButtonOK];//完成
        [self MJRefreshHead];
    }else{
        [self customRightButton];//添加照片
        if (self.path) {
            [self MJRefreshHeadPath];
        }
    }
    self.view.backgroundColor = ColorWithHex(0xF8F8F8, 1.0);
}
#pragma --mark<下拉刷新 草稿过来的>
- (void)MJRefreshHeadPath{
    //下拉刷新
    kWeakSelf(self);
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        NSString *tmp = [PATH_OF_DOCUMENT stringByAppendingPathComponent:[weakself.path stringByReplacingOccurrencesOfString:DraftCover withString:DraftDetails]];
        weakself.one = [NSKeyedUnarchiver unarchiveObjectWithFile:[PATH_OF_DOCUMENT stringByAppendingPathComponent:[weakself.path stringByReplacingOccurrencesOfString:DraftCover withString:DraftDetails]]];
        weakself.date = [orderlistForOneS new];
        weakself.date.idd = weakself.one.travelId;
        if (weakself.one) {
            weakself.seleImages = weakself.one.arry;
            weakself.input.text = weakself.one.name;
            [weakself.collectionView.mj_header endRefreshing];
            weakself.collectionView.mj_header.hidden = YES;
            [weakself.collectionView reloadData];
            NSInteger index=0;
            for (draftForOne *one in weakself.seleImages) {
                [weakself.seleImagesDES replaceObjectAtIndex:index withObject:one.content];
                index++;
            }
        } else {
            [weakself popSelf];
        }
    }];
    [self.collectionView.mj_header beginRefreshing];
}

#pragma --mark<下拉刷新 编辑过来的>
- (void)MJRefreshHead{
    //下拉刷新
    kWeakSelf(self);
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [[ToolRequest sharedInstance]apptravelsharingeditlId:weakself.dateOne.idd success:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.dateOne = [travelSharingsS mj_objectWithKeyValues:dataDict[@"travelSharing"]];
            [weakself.collectionView reloadData];
            [weakself.collectionView.mj_header endRefreshing];
            weakself.input.text = weakself.dateOne.title;
            weakself.collectionView.mj_header.hidden = YES;
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD showPrompt:msg toView:weakself.view];
            [weakself.collectionView.mj_header endRefreshing];
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
}

- (void)customRightButtonOK
{
//    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(fabuOK:)];
//    self.navigationItem.rightBarButtonItem = right;
}
- (void)customRightButton
{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"添加照片" style:UIBarButtonItemStylePlain target:self action:@selector(btnJIAClick:)];
    self.navigationItem.rightBarButtonItem = right;
    
//    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(fabuOK)];
//    self.navigationItem.rightBarButtonItem = right;
}
#pragma --mark<发布照片 或者 存为草稿>
- (void)fabuOK:(BOOL)IsItADraft{
    
    if (IsItADraft) {
        [MBProgressHUD showLoadingMessage:@"保存中..." toView:self.view];
    }else{
        if (!self.input.text || !self.input.text.length) {
            [MBProgressHUD hideHUDForView:self.view];
            [MBProgressHUD showPrompt:@"请先设置标题～" toView:self.view];
            return;
        }
        [MBProgressHUD showLoadingMessage:@"图片上传中..." toView:self.view];
    }
    self.navigationItem.rightBarButtonItem.enabled = NO;
    kWeakSelf(self);
    if (self.dateOne) { //编辑
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
        NSMutableArray *StrArry = [NSMutableArray array];  //文字数组
        NSMutableArray *ImageArry = [NSMutableArray array];  //图片数组
            
            NSInteger indexx = 0;
            for (itemsS *itemsOne in self.dateOne.itemsA) {
                NSDictionary *mudic = @{
                                        @"content":itemsOne.content?itemsOne.content:@"",
                                        };
                [StrArry addObject:mudic];
                
                [ImageArry addObject:@"-"];
                if (itemsOne.imagePhaset) {
                    kWeakSelf(self);
                    [[SuPhotoManager manager] accessToImageAccordingToTheAsset:itemsOne.imagePhaset size:PHImageManagerMaximumSize resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image, NSDictionary *info) {
                        if (image) {
//                            NSInteger indexx = 0;
                            for (itemsS *itemsTmp in self.dateOne.itemsA) {
                                if ([itemsTmp.imagePhaset isEqual:itemsOne.imagePhaset]) {
                                    break;
                                }
//                                indexx ++;
                            }

                            [ImageArry replaceObjectAtIndex:indexx withObject:image];
                            
                            
                            NSInteger indexTwo = 0;
                            for (itemsS *itemsTwo in self.dateOne.itemsA) {
                                if ([itemsTwo.imagePhaset.localIdentifier isEqualToString:itemsTwo.imagePhaset.localIdentifier]) {
                                    [ImageArry replaceObjectAtIndex:indexTwo withObject:image];
                                }
                                indexTwo++;
                            }
                            
                            
                            if (ImageArry.count == self.dateOne.itemsA.count) {
                                BOOL isfabu = YES;
                                for (id tmp in ImageArry) {
                                    if ([tmp isKindOfClass:[NSString class]]) {
                                        isfabu = NO;
                                        break;
                                    }
                                }
                                if (isfabu) {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [weakself diaoyongjiekouimages:ImageArry des:StrArry :IsItADraft];
                                    });
                                }
                            }
                        }else{
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [MBProgressHUD hideHUDForView:weakself.view];
                                weakself.isFabu = NO;
                                weakself.navigationItem.rightBarButtonItem.enabled = YES;
                                [MBProgressHUD showPrompt:@"系统相册读取失败" toView:weakself.view];
                            });
                        }
                    }];
                } else {
                    [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:itemsOne.image] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                        
                    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                        if (image) {
                            [ImageArry replaceObjectAtIndex:indexx withObject:image];
                            if (ImageArry.count == self.dateOne.itemsA.count) {
                                BOOL isfabu = YES;
                                for (id tmp in ImageArry) {
                                    if ([tmp isKindOfClass:[NSString class]]) {
                                        isfabu = NO;
                                        break;
                                    }
                                }
                                if (isfabu) {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [weakself diaoyongjiekouimages:ImageArry des:StrArry :IsItADraft];
                                    });
                                }
                            }
                        } else {
                            [MBProgressHUD hideHUDForView:weakself.view];
                            [MBProgressHUD showPrompt:@"图片下载失败" toView:weakself.view];
                            weakself.isFabu = NO;
                            weakself.navigationItem.rightBarButtonItem.enabled = YES;
                            return ;
                        }
                    }];
                }
                indexx++;
            }
        });

    } else {
        NSMutableArray *StrArry = [NSMutableArray array];  //文字数组
        
        for (NSString *str in self.seleImagesDES) {
            NSDictionary *mudic = @{
                                    @"content":str,
                                    //                                       @"imageUrl":@"http://avatar.csdn.net/7/2/2/1_xinzhangyanxiang.jpg",
                                    };
            [StrArry addObject:mudic];
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSMutableArray *ImageArry = [NSMutableArray array];  //图片数组
            
            for (id assetTmp in weakself.seleImages) {
                [ImageArry addObject:@"-"];
                if ([assetTmp isKindOfClass:[PHAsset class]]) {
                    PHAsset *asset = (PHAsset *)assetTmp;
                    [[SuPhotoManager manager] accessToImageAccordingToTheAsset:asset size:PHImageManagerMaximumSize resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image, NSDictionary *info) {
                        if (image) {
                            NSInteger indexx = [weakself.seleImages indexOfObject:asset];
                            [ImageArry replaceObjectAtIndex:indexx withObject:image];
                            
                            NSInteger indexTwo = 0;
                            for (PHAsset *assetTwo in weakself.seleImages) {
                                if ([assetTwo isKindOfClass:[PHAsset class]] && [assetTwo.localIdentifier isEqualToString:asset.localIdentifier]) {
                                    [ImageArry replaceObjectAtIndex:indexTwo withObject:image];
                                }
                                indexTwo++;
                            }
                            
                            if (ImageArry.count == weakself.seleImages.count) {
                                BOOL isfabu = YES;
                                for (id tmp in ImageArry) {
                                    if ([tmp isKindOfClass:[NSString class]]) {
                                        isfabu = NO;
                                        break;
                                    }
                                }
                                if (isfabu) {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        [weakself diaoyongjiekouimages:ImageArry des:StrArry  :IsItADraft];
                                    });
                                }
                            }
                        }else{
                            dispatch_async(dispatch_get_main_queue(), ^{
                                weakself.isFabu = NO;
                                weakself.navigationItem.rightBarButtonItem.enabled = YES;
                                [MBProgressHUD hideHUDForView:weakself.view];
                                [MBProgressHUD showPrompt:@"系统相册读取失败" toView:weakself.view];
                            });
                        }
                    }];
                    
                } else {
                    NSInteger indexx = [weakself.seleImages indexOfObject:assetTmp];
                    draftForOne *one = (draftForOne *)assetTmp;
                    [ImageArry replaceObjectAtIndex:indexx withObject:[UIImage imageWithData:one.image]];
                    
//                    NSInteger indexTwo = 0;
//                    for (PHAsset *assetTwo in weakself.seleImages) {
//                        if ([assetTwo.localIdentifier isEqualToString:asset.localIdentifier]) {
//                            [ImageArry replaceObjectAtIndex:indexTwo withObject:image];
//                        }
//                        indexTwo++;
//                    }
                    
                    if (ImageArry.count == weakself.seleImages.count) {
                        BOOL isfabu = YES;
                        for (id tmp in ImageArry) {
                            if ([tmp isKindOfClass:[NSString class]]) {
                                isfabu = NO;
                                break;
                            }
                        }
                        if (isfabu) {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [weakself diaoyongjiekouimages:ImageArry des:StrArry  :IsItADraft];
                            });
                        }
                    }
                }
            }
        });
    }
    NSLog(@"1233");
}

#ifdef DEBUG
-(void)showimagesssssstest:(NSArray *)images :(NSArray *)dess{
    NSInteger tmp=0;
    //读取的照片有问题  TODO
    for (UIImage *image in images) {
        UIImageView *img = [UIImageView new];
        [self.view addSubview:img];
        
        UILabel *des = [UILabel new];
        [self.view addSubview:des];
        CGFloat tmp1 = tmp/4;
        CGFloat tmp2 = tmp%4;
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@80);
            make.width.equalTo(@80);
            make.top.equalTo(self.view).offset(80*tmp1);
            make.left.equalTo(self.view).offset(80*tmp2);
        }];

        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@80);
            make.height.equalTo(@80);
            make.top.equalTo(self.view).offset(80*tmp1);
            make.left.equalTo(self.view).offset(80*tmp2);
        }];
//        des.text = dess[tmp];
        img.image = image;
        tmp++;
    }
}
#endif
/*
- (void)upLoad:(NSMutableArray *)muArry{
    kWeakSelf(self);
    if (self.dateOne.itemsA.count == (muArry.count + self.UrlArryEnd.count) && !self.isFabu) {
        self.isFabu = YES;
        if (muArry.count) {
            for (PHAsset *asset in muArry) {
                [[SuPhotoManager manager] accessToImageAccordingToTheAsset:asset size:PHImageManagerMaximumSize resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image, NSDictionary *info) {
                    if (image) {
//                        NSInteger indexx = [muArry indexOfObject:asset];
//                        [ImageArry replaceObjectAtIndex:indexx withObject:image];
//                        if (ImageArry.count == weakself.seleImages.count) {
//                            BOOL isfabu = YES;
//                            for (id tmp in ImageArry) {
//                                if ([tmp isKindOfClass:[NSString class]]) {
//                                    isfabu = NO;
//                                    break;
//                                }
//                            }
//                            if (isfabu) {
//                                dispatch_async(dispatch_get_main_queue(), ^{
//                                    [weakself diaoyongjiekouimages:ImageArry des:StrArry];
//                                });
//                            }
//                        }
                    }else{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [MBProgressHUD hideHUDForView:weakself.view];
                            [MBProgressHUD showPrompt:@"系统相册读取失败" toView:weakself.view];
                        });
                    }
                }];
            }
            
            
//            [[SuPhotoManager manager]fetchImagesWithAssetsArray:muArry isOriginal:YES completeBlock:^(NSArray *images) {
//                // 回到主线程显示图片
//                weakself.PhsetArryEnd = [images mutableCopy];
//                
//                NSMutableArray *StrArry = [NSMutableArray array];  //文字数组
//                NSMutableArray *ImageArry = [NSMutableArray array];  //图片数组
//                
//                for (itemsS *itemsOne in weakself.dateOne.itemsA) {
//                    NSDictionary *mudic = @{
//                                            @"content":itemsOne.content?itemsOne.content:@"",
//                                            };
//                    [StrArry addObject:mudic];
//                    if (itemsOne.imagePhaset) {
//                        [ImageArry addObject:weakself.PhsetArryEnd[0]];
//                        [weakself.PhsetArryEnd removeObjectAtIndex:0];
//                    } else {
//                        [ImageArry addObject:weakself.UrlArryEnd[0]];
//                        [weakself.UrlArryEnd removeObjectAtIndex:0];
//                    }
//                }
//                [weakself diaoyongjiekouimages:ImageArry des:StrArry];
//                
//            }];
        } else {
            NSMutableArray *StrArry = [NSMutableArray array];  //文字数组
            
            for (itemsS *itemsOne in self.dateOne.itemsA) {
                NSDictionary *mudic = @{
                                        @"content":itemsOne.content?itemsOne.content:@"",
                                        };
                [StrArry addObject:mudic];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself diaoyongjiekouimages:weakself.UrlArryEnd des:StrArry];
            });
        }
    }
}
*/
- (void)diaoyongjiekouimages:(NSArray *)images des:(NSArray *)desIes :(BOOL)IsItADraft{
    if (!self.isReleasePhoto) {
        self.isReleasePhoto = YES;
        if (IsItADraft) {//草稿
            mydraft *draftData = [mydraft new];
            if (self.date) {
                draftData.travelId = self.date.idd;
            }
            draftData.arry = [NSMutableArray array];
            draftData.name = self.input.text;
            NSInteger index=0;
            for (UIImage *one in images) {
                draftForOne *tmp = [draftForOne new];
                tmp.image = UIImageJPEGRepresentation(one, 1.0);
                NSDictionary *tmpStr = desIes[index];
                tmp.content = tmpStr[@"content"];
                if (tmp.image) {
                    [draftData.arry addObject:tmp];
                }else{
                    self.isReleasePhoto = NO;
                    [MBProgressHUD hideHUDForView:self.view];
                    [MBProgressHUD showError:@"保存失败" toView:self.view];
                    break;
                }
                index++;
            }
//            NSLog(@"沙盒路径：%@",NSHomeDirectory());
            BOOL one = YES; //封面
            BOOL Two = YES; //详情
            NSString *timeNow = [[NSDate date] formattedDateWithFormat:@"YYYY-MM-dd HH:MM:ss"];
//            NSLog(@"%@",[PATH_DraftCover stringByAppendingString:timeNow]);
//            NSFileManager *fileManager = [NSFileManager defaultManager];
//            NSArray *files = [fileManager subpathsAtPath:PATH_OF_DOCUMENT];

            draftForOne *tmp = [draftForOne new];
            tmp.image = UIImageJPEGRepresentation([images firstObject], 1.0);
            tmp.content = self.input.text;
            tmp.creatTime = timeNow;
            if (tmp.image) {
                one =[NSKeyedArchiver archiveRootObject:tmp toFile:[PATH_DraftCover stringByAppendingString:timeNow]];
            }else{
                one =NO;
            }
            if (one) {
                Two =[NSKeyedArchiver archiveRootObject:draftData toFile:[PATH_DraftDetails stringByAppendingString:timeNow]];
//                mydraft *tmp = [NSKeyedUnarchiver unarchiveObjectWithFile:[PATH_DraftDetails stringByAppendingString:timeNow]];
//                NSLog(@"sdf");
            }

            [MBProgressHUD hideHUDForView:self.view];
            BOOL three = YES; //封面
            BOOL four = YES; //详情
            if (self.path) {
                NSFileManager *defauleManager = [NSFileManager defaultManager];
                three= [defauleManager removeItemAtPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:[self.path stringByReplacingOccurrencesOfString:DraftCover withString:DraftDetails]] error:nil];
                four= [defauleManager removeItemAtPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:self.path] error:nil];
                NSLog(@"sdf");
            }
            if (one && Two) {
//            if (one && Two && three && four) {
                NSNotification *notification =[NSNotification notificationWithName:The_draft_box_has_been_updated object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
                [MBProgressHUD showSuccess:@"保存成功"];
                [self popSelf];
            } else {
                self.isReleasePhoto = NO;
               [MBProgressHUD showError:@"保存失败" toView:self.view];
            }
            
        } else {
            kWeakSelf(self);
            //    [self showimagesssssstest:images :weakself.seleImagesDES]; //test
            
            [MBProgressHUD hideHUDForView:weakself.view];
            MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
            self.HUD = HUD;
            [self.view addSubview:HUD];
            HUD.labelText = @"上传中,请耐心等候...";
            HUD.mode = MBProgressHUDModeDeterminate;
            [HUD show:YES];
            [[ToolRequest sharedInstance]travelsharingaddsWithfiles:images title:weakself.input.text travelId:self.date?weakself.date.idd:0  idd:self.dateOne?self.dateOne.idd:0 travelSharingItems:desIes progress:^(NSProgress *uploadProgress) {
                weakself.HUD.progress = uploadProgress.fractionCompleted;
                if (uploadProgress.fractionCompleted >= 1.0) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakself.HUD hide:YES];
                        [MBProgressHUD showLoadingMessage:@"上传中..." toView:weakself.view];
                    });
                }
            } success:^(id dataDict, NSString *msg, NSInteger code) {
                if (self.path) {
                    NSFileManager *defauleManager = [NSFileManager defaultManager];
                    [defauleManager removeItemAtPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:[self.path stringByReplacingOccurrencesOfString:DraftCover withString:DraftDetails]] error:nil];
                    [defauleManager removeItemAtPath:[PATH_OF_DOCUMENT stringByAppendingPathComponent:self.path] error:nil];
                    NSNotification *notification =[NSNotification notificationWithName:The_draft_box_has_been_updated object:nil userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
                }
                
                weakself.isReleasePhoto = NO;
                weakself.returnData = [travelSharingsS mj_objectWithKeyValues:dataDict[@"travelSharing"]];
                
                [MBProgressHUD hideHUDForView:weakself.view];
                if (weakself.orderId) {  //旅程 进来的
                    //增加了分享
                    NSNotification *notification =[NSNotification notificationWithName:addTrashele object:nil userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
                } else {
                    //增加了分享
                    NSNotification *notification =[NSNotification notificationWithName:editOrDeleShare object:nil userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
                }
                
                if (weakself.isFromPingJia) {
                    NSNotification *notification =[NSNotification notificationWithName:needRefremydingdang object:nil userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
                }
                
                XAlertView *alert = [[XAlertView alloc]initWithTitle:msg message:@"是否前去查看" clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
                    if (canceled) {
                        if (weakself.isFromPingJia) {
                            [weakself popSelf];
                        }else{
                            [weakself.navigationController popToRootViewControllerAnimated:YES];
                        }
                    }else{
                        lookWkweb *vc = [[lookWkweb alloc]init];
                        vc.isHaveShareImage = YES;
                        vc.CTrollersToR = @[[self class],[sysPhto class],[SelectOrderVc class]];
                        vc.IsHaveshareBtn = YES;
                        vc.dateOne = weakself.returnData;
                        vc.IsdemeiPan = YES;
                        vc.orderId  =weakself.orderId;
                        [weakself.navigationController pushViewController:vc animated:YES];
                    }
                } cancelButtonTitle:@"取消" otherButtonTitles:@"去查看", nil];
                [alert show];
                weakself.isFabu = NO;
                weakself.navigationItem.rightBarButtonItem.enabled = YES;
            } failure:^(NSInteger errorCode, NSString *msg) {
                weakself.isReleasePhoto = NO;
                [MBProgressHUD hideHUDForView:weakself.view];
                [weakself.HUD hide:YES];
                [MBProgressHUD showPrompt:msg toView:weakself.view];
                weakself.navigationItem.rightBarButtonItem.enabled = YES;
                weakself.isFabu = NO;
            }];
        }
    }
}
- (void)setUi{
    UITextField *input = [[UITextField alloc]init];
    self.input = input;
    [self.input setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.view addSubview:input];
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.bounces = YES;
    collectionView.pagingEnabled = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor clearColor];
    [collectionView registerClass:[meiPancoCell class] forCellWithReuseIdentifier:NSStringFromClass([meiPancoCell class])];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressMoving:)];
    [self.collectionView addGestureRecognizer:_longPress];
    
    
    meiPanFootTool *tool = [meiPanFootTool new];
    [self.view addSubview:tool];
    kWeakSelf(self);
    tool.meiPanFootToolClick = ^(collection_ENMU ClickType){
        if (ClickType == caogao_meiPanFootTool) {
            [weakself fabuOK:YES];
        } else  if (ClickType == fabu_meiPanFootTool){
            [weakself fabuOK:NO];
        }
    };
//    UIButton *btnJIA = [[UIButton alloc]init];
//    [btnJIA setImage:ImageNamed(@"悬浮按钮添加") forState:UIControlStateNormal];
//    [btnJIA addTarget:self action:@selector(btnJIAClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnJIA];
    
    [input mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.top.equalTo(self.view).offset(30);
       
    }];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(input.mas_bottom).offset(30);
//         make.bottom.equalTo(tableView.mas_top).offset(-30);
//        make.bottom.equalTo(self.view);
    }];
    [tool mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(collectionView.mas_bottom);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@50);
    }];
    input.font = PingFangSC_Medium(20);
    input.textColor = ColorWithHex(0x000000, 0.87);
    input.placeholder = @"点击设置标题";
}

//手势方法的实现
- (void)lonePressMoving:(UILongPressGestureRecognizer *)longPress
{
    switch (_longPress.state) {
        case UIGestureRecognizerStateBegan: {
            {
                NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[_longPress locationInView:self.collectionView]];
                // 找到当前的cell
//                meiPancoCell *cell = (meiPancoCell *)[self.collectionView cellForItemAtIndexPath:selectIndexPath];
                // 定义cell的时候btn是隐藏的, 在这里设置为NO
//                [cell.btnDelete setHidden:NO];
                [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:_longPress.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [self.collectionView endInteractiveMovement];
            break;
        }
        default: [self.collectionView cancelInteractiveMovement];
            break;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dateOne) {
        return  self.dateOne.itemsA.count;
    }
//    else if(self.path){
//        return  self.one.arry.count;
//    }
    else{
        return  self.seleImages.count;
    }
    return  0;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{
//    NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[_longPress locationInView:self.collectionView]];
    if (self.dateOne) {
        itemsS *one = self.dateOne.itemsA[sourceIndexPath.row];
        [self.dateOne.itemsA removeObjectAtIndex:sourceIndexPath.row];
        [self.dateOne.itemsA insertObject:one atIndex:destinationIndexPath.row];
    }
//    else if(self.path){
    
//        [self.one.arry removeObjectAtIndex:destinationIndexPath.row];
//    }
    else{
        id dateTmp = self.seleImages[sourceIndexPath.row];
        
        [self.seleImages removeObject:dateTmp];
        [self.seleImages insertObject:dateTmp atIndex:destinationIndexPath.row];
        
        NSLog(@"%ld  %ld",sourceIndexPath.row,destinationIndexPath.row);
        //TODO
        NSString *imagedes = self.seleImagesDES[sourceIndexPath.row];
        [self.seleImagesDES removeObjectAtIndex:sourceIndexPath.row];
        [self.seleImagesDES insertObject:imagedes atIndex:destinationIndexPath.row];
    }
//    [self.collectionView reloadData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSMutableArray *muArry =[self.navigationController.viewControllers mutableCopy];
    for (UIViewController *vc in muArry) {
        if ([vc isKindOfClass:[sysPhto class]] || (self.dateOne && [vc isKindOfClass:[lookWkweb class]])) {
            [muArry removeObject:vc];
            self.navigationController.viewControllers = muArry;
            break;
        }
    }
}
#pragma  --mark<选中每个cell>
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    textIn *vc = [[textIn alloc]init];
//    vc.imageDes = self.seleImagesDES[indexPath.row];
//    vc.index = indexPath.row;
//    kWeakSelf(self);
//    vc.returnClick = ^(NSString *imageDes,NSInteger index){
//        [weakself.seleImagesDES replaceObjectAtIndex:indexPath.row withObject:imageDes];
//        [weakself.collectionView reloadItemsAtIndexPaths:@[indexPath]];
//    };
//    vc.index = indexPath.row;
//    [self.navigationController pushViewController:vc animated:YES];
//}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ScreenWidth, 114+3);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return  UIEdgeInsetsMake(0, 0, 12, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"indexPath。row=%ld",indexPath.row);
}
#pragma  --mark<创建  cell>
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    meiPancoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([meiPancoCell class]) forIndexPath:indexPath];
    if (self.dateOne) {
        cell.itemsOne  =self.dateOne.itemsA[indexPath.row];
    }
//    else if(self.path){
//        cell.draftForone = self.one.arry[indexPath.row];
//    }
    else{
        id date = self.seleImages[indexPath.row];
        if ([date isKindOfClass:[PHAsset class]]) {
            cell.PHAssetDate  =self.seleImages[indexPath.row];
            cell.imageDes  =self.seleImagesDES[indexPath.row];
        } else {
            cell.draftForone = self.seleImages[indexPath.row];
        }
//        cell.imageDate  =self.seleImages[indexPath.row];
    }


    cell.isMOve = self.isMove;
    cell.gotoInputtezt = ^(NSString *str,itemsS *itemsOne,PHAsset *PHAssetDate,draftForOne *draftForone){
        NSInteger tmp = 0;
        if (weakself.dateOne) {
            itemsOne.content = str;
            tmp = [weakself.dateOne.itemsA indexOfObject:itemsOne];
            [weakself.dateOne.itemsA replaceObjectAtIndex:tmp withObject:itemsOne];
//            itemsS *one = weakself.dateOne.itemsA[index]; //crash
//            itemsS *one = weakself.dateOne.itemsA[indexPath.row]; //改了后的
//            one.content = str;
        }else{
            if (PHAssetDate) {
                tmp = [weakself.seleImages indexOfObject:PHAssetDate];
            } else {
                tmp = [weakself.seleImages indexOfObject:draftForone];
            }
            [weakself.seleImagesDES replaceObjectAtIndex:tmp withObject:str]; //改了后的
//            [weakself.seleImagesDES replaceObjectAtIndex:index withObject:str]; //crash
        }
    };

    cell.btnEditClick = ^(PHAsset *PHAssetDate,itemsS *itemsOne){
        NSInteger indexT=0;
        if (weakself.dateOne) {//是从编辑来的
            indexT = [weakself.dateOne.itemsA indexOfObject:itemsOne];
        }else{
            indexT = [weakself.seleImages indexOfObject:PHAssetDate];
        }
        NSLog(@"删除一个了index=%ld",indexT);
        BOOL tmp=NO;
        if (weakself.dateOne) {  //是修改  编辑
            if (weakself.dateOne.itemsA.count>1) {
                tmp = YES;
                [weakself.dateOne.itemsA removeObjectAtIndex:indexT];
            }
        } else {  //是直接发布的
            if (weakself.seleImages.count>1) {
                tmp = YES;
                [weakself.seleImages removeObjectAtIndex:indexT];
                [weakself.seleImagesDES removeObjectAtIndex:indexT];
            }
        }
        if (tmp) {
//            [weakself.collectionView reloadData];

            [weakself.collectionView performBatchUpdates:^{
                [weakself.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexT inSection:0]]];
            } completion:nil];
        } else {
            [MBProgressHUD showPrompt:@"至少保留一张图片" toView:self.view];
        }
    };
    return cell;
}

#pragma  --mark<大加号>
- (void)btnJIAClick:(UIButton *)btn{
    if (self.seleImages.count < max_num) {
        sysPhto *vc = [[sysPhto alloc]init];
        vc.MAXnum = 100;
        vc.orderId = self.orderId;
        if (self.dateOne) {
            vc.isSelected = self.dateOne.itemsA.count;
        }else{
            vc.isSelected = self.seleImages.count;
        }
        kWeakSelf(self);
        vc.returnClick = ^(NSArray *images){
            for (PHAsset *oneoen in images) {
                NSInteger tmp;
                if (weakself.dateOne) {//是从编辑来的
                    itemsS *one = [[itemsS alloc]init];
                    one.imagePhaset = oneoen;
                    [weakself.dateOne.itemsA addObject:one];
                    tmp = weakself.dateOne.itemsA.count-1;
                }else{
                    [weakself.seleImages addObject:oneoen];
                    [weakself.seleImagesDES addObject:@""];
                    tmp = weakself.seleImagesDES.count-1;
                }
            }
            [weakself.collectionView reloadData];
        };
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [MBProgressHUD showPrompt:[NSString stringWithFormat:@"最多只可以发布%d照片",max_num] toView:self.view];
    }
}



- (NSMutableArray *)seleImagesDES{
    if (!_seleImagesDES) {
//        _seleImagesDES = [NSMutableArray arrayWithCapacity:self.seleImages.count];
        _seleImagesDES = [NSMutableArray array];
        for (NSInteger tmp=0; tmp<self.seleImages.count; tmp++) {
            [_seleImagesDES addObject:@""];
        }
//        for (UIImage *image in self.seleImages) {
//            [_seleImagesDES addObject:@""];
//        }
    }
    return _seleImagesDES;
}

//#pragma <UITableViewDataSource>
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.seleImages.count;
//}
//#pragma --mark<UITableViewDelegate 创建cell>
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    meiPanCell *cell = [meiPanCell returnCellWith:tableView];
//    [self configuremeiPanCell:cell atIndexPath:indexPath];
//    return cell;
//}
//#pragma --mark<配置登录后 第一个cell>
//- (void)configuremeiPanCell:(meiPanCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    cell.imageDate  =self.seleImages[indexPath.row];
//    cell.imageDes  =self.seleImagesDES[indexPath.row];
//}
//
//#pragma --mark<UITableViewDelegate 高度>
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    kWeakSelf(self);
//    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([meiPanCell class]) configuration:^(meiPanCell *cell) {
//        [weakself configuremeiPanCell:cell atIndexPath:indexPath];
//    }];
//    return 0;
//}
//#pragma  --mark<选中了一个cell>
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0.001;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.001;
//}

@end
