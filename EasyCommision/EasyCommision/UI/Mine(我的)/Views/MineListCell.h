//
//  MineListCell.h
//  EasyCommision
//
//  Created by yi on 17/5/19.
//  Copyright © 2017年 yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *mineListLabel;


+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
