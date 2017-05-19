//
//  AddressCell.m
//  EasyCommision
//
//  Created by yi on 17/5/18.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "AddressCell.h"
#import "UIButton+Rect.h"

@interface AddressCell ()

@property (weak, nonatomic) IBOutlet UIButton *defaultAdressBtn;

@end


@implementation AddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.defaultAdressBtn.imageRect = CGRectMake(0, 6, 16, 16);
    self.defaultAdressBtn.titleRect = CGRectMake(24, 0, 100, 28);
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    AddressCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
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
- (IBAction)defaultAdressBtnClick:(UIButton *)sender {
}

@end
