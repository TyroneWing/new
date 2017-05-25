//
//  HomeHeaderView.m
//  EasyCommision
//
//  Created by yi on 17/5/25.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "HomeHeaderView.h"

@implementation HomeHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
//    self.contentView.backgroundColor = [UIColor whiteColor];
//    self.headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, 40)];
//    self.headLabel.textAlignment = NSTextAlignmentCenter;
//    self.headLabel.font =[UIFont boldSystemFontOfSize:17];
//    self.headLabel.textColor = RGB_Blue;
//    [self addSubview:self.headLabel];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
