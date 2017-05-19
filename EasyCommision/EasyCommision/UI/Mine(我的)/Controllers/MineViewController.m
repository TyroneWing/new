//
//  MineViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/17.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "MineViewController.h"
#import "Networks.h"


//test
#import "MyMessageViewController.h"
#import "AddressListViewController.h"


@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self settingNavigationbar];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //MyMessageViewController *vc = [[MyMessageViewController alloc] init];
    AddressListViewController *vc = [[AddressListViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


/**
 *  配置导航栏
 */
- (void)settingNavigationbar
{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setBackgroundColor:RGB(219, 0, 17)];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:RGB(219, 0, 17)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"个人中心";
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
