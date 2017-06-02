//
//  OrderLabelCell.h
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/2.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderLabelCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *orderLabel;
@property (strong, nonatomic) IBOutlet UIView *lineView;
@property (strong, nonatomic) IBOutlet UILabel *orderTitleLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
