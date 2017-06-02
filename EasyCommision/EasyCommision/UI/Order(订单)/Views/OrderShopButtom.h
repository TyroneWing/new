//
//  OrderShopButtom.h
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/2.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderShopButtom : UIView

@property (nonatomic,copy) void (^cancelBtnClick)(UIButton *btn);//取消订单
@property (nonatomic,copy) void (^payBtnClick)(UIButton *btn);//付款

@end
