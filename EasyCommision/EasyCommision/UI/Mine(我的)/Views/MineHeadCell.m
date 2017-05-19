//
//  MineHeadCell.m
//  EasyCommision
//
//  Created by yi on 17/5/19.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "MineHeadCell.h"

@implementation MineHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    MineHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (IBAction)loginBtnClick:(UIButton *)sender {
    if (self.loginBtnClick) {
        self.loginBtnClick(sender);
    }
}
- (IBAction)registerBtnClick:(UIButton *)sender {
    if (self.registerBtnClick) {
        self.registerBtnClick(sender);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
