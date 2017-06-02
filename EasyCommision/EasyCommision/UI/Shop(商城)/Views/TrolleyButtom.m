//
//  TrolleyButtom.m
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/1.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "TrolleyButtom.h"
#import "UIButton+Rect.h"
#import <UIKit/UIKit.h>
#import "Networks.h"

@implementation TrolleyButtom


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.allSelectBtn.imageRect = CGRectMake(0, 12, 16, 16);
    self.allSelectBtn.titleRect = CGRectMake(24, 0, 60, 40);


    [self layoutSubviews];

    NSLog(@"self.frame = %@",NSStringFromCGRect(self.frame));
    NSLog(@"self.accountBtn.frame = %@",NSStringFromCGRect(self.accountBtn.frame));
    NSLog(@"kWIN_WIDTH %f",kWIN_WIDTH);
}

- (IBAction)btnClick:(UIButton *)sender {

    NSLog(@"accountBtnClick 结算");
    if (self.accountBtnClick) {
        self.accountBtnClick(sender);
    }

}

- (IBAction)accountBtnClick:(UIButton *)sender {
    NSLog(@"accountBtnClick 结算");
    if (self.accountBtnClick) {
        self.accountBtnClick(sender);
    }
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"-----");
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
