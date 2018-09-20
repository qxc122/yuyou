//
//  noticeCoCell.m
//  TourismT
//
//  Created by Store on 2017/6/22.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "noticeCoCell.h"
#import "noticeView.h"


@interface noticeCoCell ()
@property (nonatomic,weak) noticeView *myNoticeView;

@end

@implementation noticeCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = NO;
        
        noticeView *myNoticeView = [[noticeView alloc]init];
        [self.contentView addSubview:myNoticeView];
        self.myNoticeView  =myNoticeView;
        
        [myNoticeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];

    }
    return self;
}
- (void)setDate:(Arry_notices_one *)date{
    _date = date;
    self.myNoticeView.date = date;
}
@end
