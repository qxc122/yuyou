//
//  teachingPage.m
//  TourismT
//
//  Created by Store on 2017/8/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "teachingPage.h"

@interface teachingPage ()
@property (nonatomic,weak) UIImageView *Box;
@property (nonatomic,weak) UIImageView *Tip;
@property (nonatomic,weak) UIImageView *title;
@property (nonatomic,weak) UIImageView *Next;
@property (nonatomic,weak) UIButton *NextBtn;

@end

@implementation teachingPage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.back removeFromSuperview];
        [self.close removeFromSuperview];
        [self.blcak removeGestureRecognizer:self.tap];
        
        UIImageView *Box = [UIImageView new];
        [self addSubview:Box];
        
        UIImageView *Tip = [UIImageView new];
        [self addSubview:Tip];
        
        UIImageView *title = [UIImageView new];
        [self addSubview:title];
        
        UIImageView *Next = [UIImageView new];
        [self addSubview:Next];
        
        UIButton *NextBtn = [UIButton new];
        [self addSubview:NextBtn];
        
        self.Box = Box;
        self.Tip = Tip;
        self.title = title;
        self.Next = Next;
        self.NextBtn = NextBtn;
        
//        self.Box.contentMode = UIViewContentModeScaleAspectFill;
//        self.Tip.contentMode = UIViewContentModeScaleAspectFill;
//        self.title.contentMode = UIViewContentModeScaleAspectFill;
//        self.Next.contentMode = UIViewContentModeScaleAspectFill;
//        
//        self.Box.clipsToBounds = YES;
//        self.Tip.clipsToBounds = YES;
//        self.title.clipsToBounds = YES;
//        self.Next.clipsToBounds = YES;
        
        [self oneStep];
        [NextBtn addTarget:self action:@selector(NextBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        99+6-45+45*HEIGHTICON

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(TheTeachingPageIsDisplayedFunc:)
                                                     name:TheTeachingPageIsDisplayed
                                                   object:nil];

    }
    return self;
}

- (void)TheTeachingPageIsDisplayedFunc:(NSNotification *)user{
    self.hidden = NO;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)oneStep{

    [self.Box mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(18.7*WIDTHICON);
        make.right.equalTo(self).offset(-18.7*WIDTHICON);
        if (ScreenHeight==812){
            make.top.equalTo(self).offset(HeightCarousel+HEIGHT_NavbarX+7.5);
        }else{
            make.top.equalTo(self).offset((193-HEIGHT_Navbar)*HEIGHTICON+HEIGHT_Navbar);
        }
        make.height.equalTo(@(99.4*HEIGHTICON));
    }];
    
    [self.Tip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(77.3*WIDTHICON);
        make.top.equalTo(self.Box.mas_bottom).offset(11.5*HEIGHTICON);
        make.width.equalTo(@(14*WIDTHICON));
        make.height.equalTo(@(35.6*HEIGHTICON));
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.Tip.mas_right).offset(12.7*WIDTHICON);
        make.top.equalTo(self.Tip.mas_bottom).offset(4.5*HEIGHTICON);
        make.width.equalTo(@(178));
        make.height.equalTo(@(18));
    }];
    
    [self.Next mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.title);
        make.top.equalTo(self.title.mas_bottom).offset(30*HEIGHTICON);
        make.width.equalTo(@(80));
        make.height.equalTo(@(36));
    }];
    [self.NextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.Next);
        make.top.equalTo(self.Next);
        make.width.equalTo(self.Next);
        make.height.equalTo(self.Next);
    }];
    
    self.Box.image = [UIImage imageNamed:@"one_box"];
    self.Tip.image = [UIImage imageNamed:@"one_tip"];
    self.title.image = [UIImage imageNamed:@"one_title"];
    self.Next.image = [UIImage imageNamed:@"one_next"];
}

- (void)TwoStep{
    CGFloat tmp = ScreenWidth/4.0;
    [self.Box mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(-tmp*0.5);
//        make.left.equalTo(self).offset(98.5*WIDTHICON);
        if (ScreenHeight==812){
            make.bottom.equalTo(self).offset(-1.6-34+2);
        }else{
            make.bottom.equalTo(self).offset(-1.6);
            
        }
        
        make.height.equalTo(@46.4);
        make.width.equalTo(@(75*WIDTHICON));
    }];
    
    [self.Tip mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.Box.mas_right).offset(5.2*WIDTHICON);
        make.bottom.equalTo(self.Box.mas_top).offset(-11.1*HEIGHTICON);
        make.width.equalTo(@(14*WIDTHICON));
        make.height.equalTo(@(35.6*HEIGHTICON));
    }];
    
    [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-19*WIDTHICON);
        make.bottom.equalTo(self.Tip.mas_top).offset(-18.3*HEIGHTICON);
        make.width.equalTo(@(178));
        make.height.equalTo(@(18));
    }];
    
    [self.Next mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.title.mas_right).offset(-12);
        make.bottom.equalTo(self.title.mas_top).offset(-22*HEIGHTICON);
        make.width.equalTo(@(80));
        make.height.equalTo(@(36));
    }];

    
    
    self.Box.image = [UIImage imageNamed:@"two_box"];
    self.Tip.image = [UIImage imageNamed:@"two_tip"];
    self.title.image = [UIImage imageNamed:@"two_title"];
    self.Next.image = [UIImage imageNamed:@"one_next"];
}

- (void)ThreeStep{
    CGFloat tmp = ScreenWidth/4.0;
    [self.Box mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(tmp*0.5);
//        make.right.equalTo(self).offset(-101.5*WIDTHICON);
        if (ScreenHeight==812){
            make.bottom.equalTo(self).offset(-1.6-34+2);
        }else{
            make.bottom.equalTo(self).offset(-1.6);
            
        }
        make.height.equalTo(@46.4);
        make.width.equalTo(@(75*WIDTHICON));
    }];
    
    [self.Tip mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.Box);
        make.bottom.equalTo(self.Box.mas_top).offset(-7.1*HEIGHTICON);
        make.width.equalTo(@(14*WIDTHICON));
        make.height.equalTo(@(35.6*HEIGHTICON));
    }];
    
    [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14*WIDTHICON);
        make.bottom.equalTo(self.Tip.mas_top).offset(-5.3*HEIGHTICON);
        make.width.equalTo(@(241));
        make.height.equalTo(@(43));
    }];
    
    [self.Next mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.title.mas_right).offset(-12);
        make.bottom.equalTo(self.title.mas_top).offset(-14*HEIGHTICON);
        make.width.equalTo(@(80));
        make.height.equalTo(@(36));
    }];

    
    
    self.Box.image = [UIImage imageNamed:@"two_box"];
    self.Tip.image = [UIImage imageNamed:@"three_tip"];
    self.title.image = [UIImage imageNamed:@"three_title"];
    self.Next.image = [UIImage imageNamed:@"three_next"];
}
- (void)windosViewshow{
    [super windosViewshow];
    self.hidden = YES;
}
- (void)NextBtnClick{
    self.NextBtn.tag ++;
    if (self.NextBtn.tag == 1) {
        [self TwoStep];
    } else if (self.NextBtn.tag == 2) {
        [self ThreeStep];
    } else if (self.NextBtn.tag == 3) {
        NSNotification *notification =[NSNotification notificationWithName:TheTeachingPageDisappeared object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        [self closeClisck];
    }
}
@end
