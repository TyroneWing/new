//
//  MonthlyServentTypeController.m
//  EasyCommision
//
//  Created by yi on 17/5/26.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "MonthlyServentTypeController.h"
#import "MonthlyServentListViewController.h"


@interface MonthlyServentTypeController ()

@end

@implementation MonthlyServentTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"住家工服务";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)allServerBtnClick:(UIButton *)sender {
    MonthlyServentListViewController *vc = [[MonthlyServentListViewController alloc] init];//住家工分类页面
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
