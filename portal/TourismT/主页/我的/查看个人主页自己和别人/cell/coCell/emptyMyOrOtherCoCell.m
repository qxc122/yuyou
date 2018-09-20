//
//  emptyMyOrOtherCoCell.m
//  TourismT
//
//  Created by Store on 2017/2/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "emptyMyOrOtherCoCell.h"
#import "emptyMyOrOther.h"


@interface emptyMyOrOtherCoCell ()
@property (nonatomic,weak) emptyMyOrOther *emptyMyOrother;
@end


@implementation emptyMyOrOtherCoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        emptyMyOrOther *emptyMyOrother =[[emptyMyOrOther alloc]init];
        [self.contentView addSubview:emptyMyOrother];
        self.emptyMyOrother = emptyMyOrother;
        [emptyMyOrother mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
    }
    return self;
}
- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    self.emptyMyOrother.imageStr = imageStr;
}
- (void)setDesStr:(NSString *)desStr{
    _desStr = desStr;
    self.emptyMyOrother.desStr = desStr;
}
@end
