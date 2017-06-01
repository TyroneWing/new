//
//  TrolleyButtom.h
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/1.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrolleyButtom : UIView
@property (strong, nonatomic) IBOutlet UIButton *allSelectBtn;
@property (strong, nonatomic) IBOutlet UIButton *accountBtn;
@property (nonatomic,copy) void (^accountBtnClick)(UIButton *btn);//结算

@end
