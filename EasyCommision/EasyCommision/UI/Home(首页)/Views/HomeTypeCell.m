//
//  HomeTypeCell.m
//  EasyCommision
//
//  Created by yi on 17/5/24.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "HomeTypeCell.h"

@interface HomeTypeCell ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation HomeTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
//    UIImageView *imageView = [[UIImageView alloc] initw];
//    self.searchBar.backgroundImage = imageView.image;
    [self.searchBar setBackgroundImage:[UIImage new]];

}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    HomeTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

/**
   消息
 
 */
- (IBAction)msgBtnClick:(UIButton *)sender {
    if (self.msgBtnClick) {
        self.msgBtnClick(sender);
    }
}

/**
 住家工

 */
- (IBAction)homeBtnClick:(UIButton *)sender {
    if (self.homeBtnClick) {
        self.homeBtnClick(sender);
    }
}

/**
 钟点工

 */
- (IBAction)hourlyBtnClick:(UIButton *)sender {
    if (self.hourlyBtnClick) {
        self.hourlyBtnClick(sender);
    }
}

/**
 快速预约

 */
- (IBAction)reservationBtnClick:(UIButton *)sender {
    if (self.reservationBtnClick) {
        self.reservationBtnClick(sender);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
