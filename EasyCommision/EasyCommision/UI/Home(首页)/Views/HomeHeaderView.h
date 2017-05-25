//
//  HomeHeaderView.h
//  EasyCommision
//
//  Created by yi on 17/5/25.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) UILabel *headLabel;;
@property (nonatomic,copy) void (^moreBtnClick)(UIButton *btn);
@end
