//
//  editImageOK.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "editImageOK.h"
#import "UIImageView+cir.h"
#import "MWPhotoBrowser.h"

#import "MWZoomingScrollView.h"
typedef NS_ENUM(NSInteger, editImageOK_btnEnum)
{
    ok_editImageOK_btnEnum = 1,//轮船
    change_editImageOK_btnEnum = 3,//巴士
};
@interface editImageOK ()<MWPhotoBrowserDelegate>
@property (nonatomic,weak) UIScrollView *avtorSro;
@property (nonatomic,weak) UIImageView *avtorImage;
@property (nonatomic,weak) UIImageView  *imageView;

@property (nonatomic,strong) MWPhotoBrowser *browser;
@property (nonatomic,weak) UIView *cir;
@property (nonatomic,assign) CGFloat totalScale;
@end

#define  maxScar 1.1

#define minScar  1
@implementation editImageOK

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.fd_prefersNavigationBarHidden = YES;
    UIBarButtonItem *letf = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    letf.tag = change_editImageOK_btnEnum;
    self.navigationItem.leftBarButtonItem = letf;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    right.tag = ok_editImageOK_btnEnum;
    self.navigationItem.rightBarButtonItem = right;
    self.totalScale = 1.0;
    self.title = @"设定头像";
//    [self setUI];
    

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.clipsToBounds = NO;
    kWeakSelf(self);
    [[tourHelper sharedInstance]loadImageWithPhset:self.PHAssetDate Success:^(UIImage *tmpIMage) {
        weakself.avtor = tmpIMage;
        [weakself openMWPhotoBrowser:0];
    }];
}
- (void)openMWPhotoBrowser:(NSInteger )index{
    
    CusMWPhotoBrowser *browser = [[CusMWPhotoBrowser alloc] initWithDelegate:self];
    self.browser = browser;

    // Set options
//    browser.CusBackColor = [UIColor whiteColor];
    browser.displayActionButton = NO; // Show action button to allow sharing, copying, etc (defaults to YES)
    browser.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    browser.displaySelectionButtons = NO; // Whether selection buttons are shown on each image (defaults to NO)
    browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    browser.alwaysShowControls = YES; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    browser.enableGrid = NO; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    browser.startOnGrid = NO; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    
    
    // Customise selection images to change colours if required
    // Optionally set the current visible photo before displaying
    [browser setCurrentPhotoIndex:index];
    
    
    [self.view addSubview:browser.view];
    [browser.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.height.equalTo(self.view.mas_width);
    }];
    [self addChildViewController:browser];
    
    UIImageView  *imageView = [[UIImageView alloc] init];
    self.imageView  =imageView;
    imageView.alpha = 0.5;
    [imageView setImage:ImageNamed(@"Combined Shape")];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.height.equalTo(self.view.mas_width);
    }];
}


#pragma --mark<SDCycleScrollViewDelegate  照片浏览器的回调   有多少个>
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return 1;
}
#pragma --mark<SDCycleScrollViewDelegate  照片浏览器的回调  每个MWPhoto>
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *oen = [[MWPhoto alloc]initWithImage:self.avtor];
    [self findSubView:photoBrowser.view];
    return oen;
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
/*
- (void)setUI{
    
    UIView *cir = [[UIView alloc]init];
    self.cir = cir;
    [self.view addSubview:cir];
    [cir mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(ScreenWidth));
        make.height.equalTo(@(ScreenWidth));
    }];
    
    UIScrollView *avtorSro = [[UIScrollView alloc]init];
    self.avtorSro = avtorSro;
    avtorSro.showsVerticalScrollIndicator  =NO;
    avtorSro.showsHorizontalScrollIndicator  =NO;
    [self.view addSubview:avtorSro];
    [avtorSro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(ScreenWidth));
    }];
    
    UIImageView *avtorImage = [[UIImageView alloc]init];
    self.avtorImage = avtorImage;
    [[tourHelper sharedInstance]loadImageWithPhset:self.PHAssetDate Success:^(UIImage *tmpIMage) {
        avtorImage.image = tmpIMage;
        CGSize sizeTmp = tmpIMage.size;
        CGFloat min = sizeTmp.height>sizeTmp.width?sizeTmp.width:sizeTmp.height;
        
        if (min<ScreenWidth) {
            if (min == sizeTmp.height) {
                sizeTmp.height = ScreenWidth;
                sizeTmp.width =  sizeTmp.width*(ScreenWidth/min);
            } else {
                sizeTmp.width = ScreenWidth;
                sizeTmp.height =  sizeTmp.height*(ScreenWidth/min);
            }
        }
        avtorImage.frame = CGRectMake(0, 0, sizeTmp.width, sizeTmp.height);
        avtorSro.contentSize = sizeTmp;
        [avtorSro setContentOffset:CGPointMake((sizeTmp.width-ScreenWidth)/2.0, (sizeTmp.height-ScreenWidth)/2.0)];
    }];

    [avtorSro addSubview:avtorImage];

//    avtorSro.backgroundColor  =[UIColor redColor];
//    avtorImage.backgroundColor  =[UIColor yellowColor];
//    IMAGEsetCONTENTMODE(avtor);
//    avtorImage.image = self.avtor;


    

    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinch];
    
    UIImageView  *imageView = [[UIImageView alloc] init];
    self.imageView  =imageView;
    imageView.alpha = 0.5;
    [imageView setImage:ImageNamed(@"Combined Shape")];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cir);
        make.right.equalTo(cir);
        make.top.equalTo(cir);
        make.bottom.equalTo(cir);
    }];
    
    
}

- (void)pinch:(UIPinchGestureRecognizer *)recognizer{
    CGFloat scale = recognizer.scale;
    if (recognizer.state == UIGestureRecognizerStateEnded) {
//        if (self.totalScale > maxScar) {
//            self.totalScale = maxScar;
//
//                [UIView animateWithDuration:0.1 animations:^{
//                    CGFloat wid = 0;
//                    CGFloat hei = 0;
//                    if (self.avtor.size.width < ScreenWidth) {
//                        wid = ScreenWidth*maxScar;
//                    }else{
//                        wid = self.avtor.size.width*maxScar;
//                    }
//                    if (self.avtor.size.height < ScreenWidth) {
//                        hei = ScreenWidth*maxScar;
//                    }else{
//                        hei = self.avtor.size.height*maxScar;
//                    }
//                    [self.avtorSro mas_makeConstraints:^(MASConstraintMaker *make) {
//                        make.centerX.equalTo(self.view);
//                        make.centerY.equalTo(self.view);
//                        make.width.equalTo(@(wid));
//                        make.width.equalTo(@(hei));
//                    }];
//                }];
//            
//            
//        }
        if (self.totalScale < minScar) {
            self.totalScale = minScar;
            if (self.avtorImage.frame.size.width < ScreenWidth) {
                [UIView animateWithDuration:0.1 animations:^{
//                    self.avtorSro.transform = CGAffineTransformScale(self.avtorSro.transform, minScar, minScar);
                    self.avtorImage.transform = CGAffineTransformIdentity;
                    self.avtorSro.contentSize = CGSizeMake(self.avtorImage.frame.size.width,self.avtorImage.frame.size.height);
                   // self.avtorSro.transform = CGAffineTransformIdentity;
                }];
            }
        }else{
            
        }
        CGRect oldImage = self.avtorImage.frame;
        NSLog(@"11  11 x=%f y=%f",oldImage.origin.x,oldImage.origin.y);
        self.avtorImage.frame = CGRectMake(0, 0, self.avtorImage.frame.size.width, self.avtorImage.frame.size.height);
        [self.avtorSro  addSubview:self.avtorImage];
        self.avtorSro.contentSize = CGSizeMake(oldImage.size.width,oldImage.size.height);
        if (oldImage.origin.x >= 0) {
            [self.avtorSro setContentOffset:CGPointMake(0,0)];
        }else{
            [self.avtorSro setContentOffset:CGPointMake(-oldImage.origin.x,-oldImage.origin.y)];
        }
        NSLog(@"222  2222x=%f y=%f",self.avtorSro.contentOffset.x,self.avtorSro.contentOffset.y);
    }
    
    self.avtorImage.transform = CGAffineTransformScale(self.avtorImage.transform, scale, scale);

    CGRect oldImage = self.avtorImage.frame;
    self.avtorImage.transform = CGAffineTransformScale(self.avtorImage.transform, scale, scale);
    CGRect NewImage = self.avtorImage.frame;
    CGFloat xxx=0;
    CGFloat yyy=0;
    xxx = NewImage.size.width - oldImage.size.width;
    yyy = NewImage.size.height - oldImage.size.height;
    self.avtorImage.transform = CGAffineTransformTranslate(self.avtorImage.transform, -NewImage.origin.x,-NewImage.origin.y);
 

    NSLog(@"11x=%f y=%f",self.avtorImage.frame.origin.x,self.avtorImage.frame.origin.y);
    NSLog(@"222x=%f y=%f",self.avtorSro.contentOffset.x,self.avtorSro.contentOffset.y);
    self.totalScale *=scale;
    recognizer.scale = 1.0;
    
}
*/

- (void)leftClick:(UIBarButtonItem *)btn{
    if (btn.tag == ok_editImageOK_btnEnum) {
        if (self.btnClick) {
            self.imageView.hidden = YES;
            UIImage *tmp = [UIImageView GetScreenShotWithScreen:self.view andFrame:self.imageView.frame];
//            UIImage *Nextmp = [UIImageView circleImage:tmp withParam:0];
            self.imageView.hidden = NO;
            self.btnClick(tmp);
            [self popSelf];
        }
    } else if (btn.tag == change_editImageOK_btnEnum){
        [self popSelf];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.view.clipsToBounds = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
