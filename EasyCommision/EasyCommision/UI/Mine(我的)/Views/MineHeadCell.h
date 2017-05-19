//
//  MineHeadCell.h
//  EasyCommision
//
//  Created by yi on 17/5/19.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineHeadCell : UITableViewCell
@property (nonatomic,copy) void (^loginBtnClick)(UIButton *btn);
@property (nonatomic,copy) void (^registerBtnClick)(UIButton *btn);

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
