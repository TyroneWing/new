//
//  ShopDetailViewController.m
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/1.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "ShopTrolleyViewController.h"

@interface ShopDetailViewController ()

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    [self settingNavigationbar];
}

/**
 *  配置导航栏
 */
- (void)settingNavigationbar
{
    self.navigationItem.title = @"商品详情";

    UIButton *trolleyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [trolleyBtn setImage:[UIImage imageNamed:@"shop_icon.png"] forState:UIControlStateNormal];
    [trolleyBtn addTarget:self action:@selector(addShopTrolley:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *trolleyItem = [[UIBarButtonItem alloc] initWithCustomView:trolleyBtn];
    [self.navigationItem setRightBarButtonItem:trolleyItem];

}


- (void)addShopTrolley:(UIButton *)btn
{
    ShopTrolleyViewController *shopTrolleyVC = [[ShopTrolleyViewController alloc] init];
    shopTrolleyVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:shopTrolleyVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
