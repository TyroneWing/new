//
//  HomeTypeCell.h
//  EasyCommision
//
//  Created by yi on 17/5/24.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTypeCell : UITableViewCell
@property (nonatomic,copy) void (^homeBtnClick)(UIButton *btn);//钟点工
@property (nonatomic,copy) void (^hourlyBtnClick)(UIButton *btn);//住家工
@property (nonatomic,copy) void (^reservationBtnClick)(UIButton *btn);//快速预约

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
