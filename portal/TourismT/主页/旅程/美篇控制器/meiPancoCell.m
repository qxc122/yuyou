//
//  meiPancoCell.m
//  TourismT
//
//  Created by Store on 16/12/29.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "meiPancoCell.h"
#import "SZTextView.h"



@interface meiPancoCell ()<UITextViewDelegate>
//@property (nonatomic,weak) UITextField *input;
@property (nonatomic,weak) SZTextView *input;
@property (nonatomic,weak) UIButton *inputBtn;
@property (nonatomic,weak) UIButton *edit;
@property (nonatomic,weak) UIImageView *editImage;

@end

@implementation meiPancoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *back = [[UIView alloc]init];
        [self.contentView addSubview:back];
        
        UIImageView *image = [[UIImageView alloc]init];
        self.image = image;
        [self.contentView addSubview:image];
        
        SZTextView *input = [[SZTextView alloc]init];
//        UITextField *input = [[UITextField alloc]init];
        input.delegate  =self;
        self.input =input;
        [self.contentView addSubview:input];

        UIImageView *editImage = [[UIImageView alloc]init];
        self.editImage = editImage;
        [self.contentView addSubview:editImage];
        
        UIButton *edit = [[UIButton alloc]init];
        self.edit = edit;
        [self.contentView addSubview:edit];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(3);
            make.bottom.equalTo(self.contentView).offset(0);
        }];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(12);
            make.top.equalTo(back).offset(12);
//            make.width.equalTo(@(90));
//            make.height.equalTo(@(90));
            make.bottom.equalTo(back).offset(-12);
            make.width.mas_equalTo(image.mas_height).multipliedBy(1.0);
        }];
        [input mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image.mas_right).offset(15);
            make.right.equalTo(back).offset(-15);
            make.top.equalTo(image).offset(0);
            make.bottom.equalTo(back).offset(-12);
        }];
        [editImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(back.mas_top).offset(-3);
            make.right.equalTo(back.mas_right).offset(3);
            make.width.equalTo(@(20));
            make.height.equalTo(@(20));
        }];
        [edit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(editImage).offset(0);
            make.centerY.equalTo(editImage).offset(0);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        
        //set
        editImage.image = ImageNamed(@"删除phon");
        editImage.contentMode = UIViewContentModeScaleAspectFill;
//        [edit setImage:ImageNamed(@"删除phon") forState:UIControlStateNormal];
        [edit addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchUpInside];
//        edit.hidden = YES;
        IMAGEsetCONTENTMODE(edit);
        
        back.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        LRViewRadius(back, cornerRadius_width);
        IMAGEsetCONTENTMODE(image);
        input.font = PingFangSC_Medium(14);
        input.textColor = ColorWithHex(0x000000, 0.54);
        input.placeholder = @"点击添加文字";
    }
    return self;
}
- (void)setImageDes:(NSString *)imageDes{
    _imageDes = imageDes;
    self.input.text = imageDes;
}
- (void)setImageDate:(UIImage *)imageDate{
    _imageDate = imageDate;
    self.image.image = imageDate;
}
- (void)setPHAssetDate:(PHAsset *)PHAssetDate{
    _PHAssetDate = PHAssetDate;
    kWeakSelf(self);
    if (PHAssetDate) {
//        [[SuPhotoManager manager] fetchImageInAsset:PHAssetDate size:CGSizeMake(1000, 1000) isResize:YES completeBlock:^(UIImage *image, NSDictionary *info) {
//            weakself.image.image = image;
//        }];
        [[SuPhotoManager manager] accessToImageAccordingToTheAsset:PHAssetDate size:CGSizeMake(100-24, 100-24) resizeMode:PHImageRequestOptionsResizeModeFast completion:^(UIImage *image, NSDictionary *info) {
            if (image) {
                weakself.image.image = image;
            }
        }];
    }
}


//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
// replacementText:(NSString *)text
//{
//    NSLog(@"text=%@",text);
//    if (self.gotoInputtezt) {
//        self.gotoInputtezt(text,self.index);
//    }
//    return YES;
//}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (self.gotoInputtezt) {
        self.gotoInputtezt(textView.text,self.itemsOne,self.PHAssetDate,self.draftForone); //crash
    }
}

- (void)setIsMOve:(BOOL)isMOve{
    _isMOve = isMOve;
    self.input.userInteractionEnabled = !isMOve;
}
- (void)setItemsOne:(itemsS *)itemsOne{
    _itemsOne = itemsOne;
    if (itemsOne) {
        kWeakSelf(self);
        if ([itemsOne isKindOfClass:[UIImage class]]) {
            self.image.image = (UIImage *)itemsOne;
        } else {
            self.input.text = itemsOne.content;
            self.input.userInteractionEnabled = NO;
            if (itemsOne.image && itemsOne.image.length) {
                [self.image sd_setImageWithURL:[NSURL URLWithString:itemsOne.image] placeholderImage:ImageNamed(IMAGE_bigBack)];
            }else if(itemsOne.imagePhaset){
                [[tourHelper sharedInstance]loadImageWithPhset:itemsOne.imagePhaset Success:^(UIImage *tmpIMage) {
                    if (tmpIMage) {
                        weakself.image.image = tmpIMage;
                    }else{
                        NSLog(@"读取图片失败");
                    }
                }];
            }
        }
    }
}
- (void)setDraftForone:(draftForOne *)draftForone{
    if (draftForone) {
        _draftForone= draftForone;
        self.input.text = draftForone.content;
        self.image.image = [UIImage imageWithData:draftForone.image];
    }
}

//删除按钮
- (void)editClick:(UIButton *)btn{
    if (self.btnEditClick) {
        self.btnEditClick(self.PHAssetDate,self.itemsOne);
    }
}
@end
