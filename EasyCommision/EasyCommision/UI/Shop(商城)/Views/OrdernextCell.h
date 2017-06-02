//
//  OrdernextCell.h
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/2.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrdernextCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *orderNextLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
