//
//  chageAvtor.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "chageAvtor.h"
#import "MWPhotoBrowser.h"

@interface chageAvtor ()<MWPhotoBrowserDelegate>
@property (nonatomic,strong) MWPhotoBrowser *browser;
@property (nonatomic,strong) NSMutableArray *ziyaunarry;
@end

@implementation chageAvtor

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.browser  = [[MWPhotoBrowser alloc] initWithDelegate:self];
    // Set options
    self.browser.displayActionButton = NO; // Show action button to allow sharing, copying, etc (defaults to YES)
    self.browser.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    self.browser.displaySelectionButtons = YES; // Whether selection buttons are shown on each image (defaults to NO)
    self.browser.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    self.browser.alwaysShowControls = YES; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    self.browser.enableGrid = YES; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    self.browser.startOnGrid = YES; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    // Present
    self.browser.enableSwipeToDismiss = YES;
    
//    [self presentViewController:self.browser animated:YES completion:nil];
    
//    [self.navigationController pushViewController:self.browser animated:NO];
    [self addChildViewController:self.browser];
    [self.view addSubview:self.browser.view];
    [self.browser.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}


- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return  10;
}
//- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index selectedChanged:(BOOL)selected{
//    [self.browser dismissViewControllerAnimated:YES completion:^{
//        [[SuPhotoManager manager] fetchImageInAsset:self.ziyaunarry[index] size:CGSizeMake(800, 800) isResize:YES completeBlock:^(UIImage *image, NSDictionary *info) {
//            NSLog(@"sdf");
//        }];
//    }];
//}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
//    MWPhoto *one = [[MWPhoto alloc]initWithImage:ImageNamed(@"123")];
    MWPhoto *one = [[MWPhoto alloc]initWithImage:ImageNamed(@"1")];
    return one;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index{
    MWPhoto *one = [[MWPhoto alloc]initWithImage:ImageNamed(@"1")];
    return one;
//    if (index<self.ziyaunarry.count) {
//        MWPhoto *one = [[MWPhoto alloc]initWithImage:ImageNamed(@"123")];
//        return one;
//    }
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
