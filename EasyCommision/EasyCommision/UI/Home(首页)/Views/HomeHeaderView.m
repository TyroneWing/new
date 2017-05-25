//
//  HomeHeaderView.m
//  EasyCommision
//
//  Created by yi on 17/5/25.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "HomeHeaderView.h"
#import "Networks.h"

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
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, 8)];
    view.backgroundColor = backgroudColor;
    [self.contentView addSubview:view];
    
    self.headLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, kWIN_WIDTH, 22)];
    self.headLabel.textAlignment = NSTextAlignmentLeft;
    self.headLabel.font =[UIFont systemFontOfSize:17];
    [self.contentView addSubview:self.headLabel];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(kWIN_WIDTH-100, 25, 85, 25);
    [btn setTitle:@"查看更多" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    btn.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)btnClick:(UIButton *)btn
{
    if (self.moreBtnClick) {
        self.moreBtnClick(btn);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
