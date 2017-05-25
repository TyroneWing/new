//
//  HomeKnowledgeCell.m
//  EasyCommision
//
//  Created by yi on 17/5/24.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "HomeKnowledgeCell.h"
#import "UIButton+Rect.h"

@interface HomeKnowledgeCell ()

@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end

@implementation HomeKnowledgeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.zanBtn.imageRect = CGRectMake(0, 7, 16, 16);
//    self.defaultAdressBtn.titleRect = CGRectMake(24, 0, 100, 28);
    self.shareBtn.imageRect = CGRectMake(0, 7, 16, 16);

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    HomeKnowledgeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (IBAction)zanBtnClick:(UIButton *)sender {
}
- (IBAction)shareBtnClick:(UIButton *)sender {
}

@end
