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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
