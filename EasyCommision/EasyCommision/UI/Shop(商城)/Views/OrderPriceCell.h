//
//  OrderPriceCell.h
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/1.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderPriceCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *orderPriceTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *orderPriceLabel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
