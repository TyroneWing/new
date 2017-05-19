//
//  MineViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/17.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "MineViewController.h"
#import "Networks.h"
#import "MineHeadCell.h"
#import "MineListCell.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

//test
#import "MyMessageViewController.h"
#import "AddressListViewController.h"


@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *mineTableView;
@property (nonatomic,strong) NSArray *mineArray;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.mineArray = @[@"绑定银行卡",@"优惠券",@"我的钱包",@"我的预约",@"我的收藏",@"家居知识",@"申请加入",@"设置"];
    [self.view addSubview:self.mineTableView];
    [self settingNavigationbar];
}


#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mineArray.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MineHeadCell *cell = [MineHeadCell cellWithTableView:tableView];
        [cell setLoginBtnClick:^(UIButton *btn) {
            LoginViewController *loginVC = [[LoginViewController alloc] init];
            loginVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:loginVC animated:YES];
        }];
        [cell setRegisterBtnClick:^(UIButton *btn) {
            RegisterViewController *registerVC = [[RegisterViewController alloc] init];
            registerVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:registerVC animated:YES];
        }];
        return cell;
    } else {
        MineListCell *cell = [MineListCell cellWithTableView:tableView];
        cell.mineListLabel.text = self.mineArray[indexPath.row-1];
        return cell;
    }
}



- (UITableView *)mineTableView
{
    if (_mineTableView == nil) {
        _mineTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mineTableView.backgroundColor = [UIColor whiteColor];
        _mineTableView.delegate = self;
        _mineTableView.dataSource = self;
        _mineTableView.estimatedRowHeight = 50.0;
        _mineTableView.rowHeight = UITableViewAutomaticDimension;
        _mineTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mineTableView.separatorStyle = NO;
    }
    return _mineTableView;
}

//test
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    //MyMessageViewController *vc = [[MyMessageViewController alloc] init];
//    AddressListViewController *vc = [[AddressListViewController alloc] init];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
//}


/**
 *  配置导航栏
 */
- (void)settingNavigationbar
{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:RGB(219, 0, 17)];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"会员中心";
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
