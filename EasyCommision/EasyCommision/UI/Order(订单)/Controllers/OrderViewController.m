//
//  OrderViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/19.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "OrderViewController.h"
#import "Networks.h"
#import "monthlyOrderCell.h"
#import "hourlyOrderCell.h"
#import "shopOrderCell.h"
#import "OrderShopViewController.h"

typedef enum : NSUInteger {
    orderMonthly,//住家工订单
    orderhourly,//钟点工订单
    orderShop,//商品订单
} Order;

@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *orderTableView;

@property (nonatomic,strong) NSMutableArray *monthlyOrderArray;
@property (nonatomic,strong) NSMutableArray *hourlyOrderArray;
@property (nonatomic,strong) NSMutableArray *shopOrderArray;

@property (weak, nonatomic) IBOutlet UIButton *monthlyOrderBtn;//住家工订单
@property (weak, nonatomic) IBOutlet UIButton *hourlyOrderBtn;//钟点工订单
@property (weak, nonatomic) IBOutlet UIButton *shopOrderBtn;//商品订单

@property (assign,nonatomic) Order orderType;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self settingNavigationbar];
    self.orderType = orderMonthly;
    [self dataTest];
    [self.view addSubview:self.orderTableView];
}


/**
 模拟数据
 */
- (void)dataTest
{
    for (int i = 0; i<6; i++) {
        [self.monthlyOrderArray addObject:@1];
    }
    for (int i = 0; i<1; i++) {
        [self.hourlyOrderArray addObject:@1];
    }
    for (int i = 0; i<10; i++) {
        [self.shopOrderArray addObject:@1];
    }
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.orderType == orderMonthly) {
        return self.monthlyOrderArray.count;
    } else if (self.orderType == orderhourly) {
        return self.hourlyOrderArray.count;
    } else {
        return self.shopOrderArray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.orderType == orderMonthly) {
        monthlyOrderCell *cell = [monthlyOrderCell cellWithTableView:tableView];
        return cell;
    } else if (self.orderType == orderhourly) {
        hourlyOrderCell *cell = [hourlyOrderCell cellWithTableView:tableView];
        return cell;
    } else {
//        shopOrderCell *cell = [shopOrderCell cellWithTableView:tableView];
        hourlyOrderCell *cell = [hourlyOrderCell cellWithTableView:tableView];

        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.orderType == orderMonthly) {

    } else if (self.orderType == orderhourly) {

    } else {
        OrderShopViewController *vc= [[OrderShopViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}



- (UITableView *)orderTableView
{
    if (_orderTableView == nil) {
        _orderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, kWIN_WIDTH, kWIN_HEIGHT-64-49-41) style:UITableViewStylePlain];
        _orderTableView.backgroundColor = [UIColor whiteColor];
        _orderTableView.delegate = self;
        _orderTableView.dataSource = self;
        _orderTableView.estimatedRowHeight = 120.0;
        _orderTableView.rowHeight = UITableViewAutomaticDimension;
        _orderTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _orderTableView.separatorStyle = NO;
    }
    return _orderTableView;
}

- (NSMutableArray *)monthlyOrderArray
{
    if (_monthlyOrderArray == nil) {
        _monthlyOrderArray = [NSMutableArray array];
    }
    return _monthlyOrderArray;
}


- (NSMutableArray *)hourlyOrderArray
{
    if (_hourlyOrderArray == nil) {
        _hourlyOrderArray = [NSMutableArray array];
    }
    return _hourlyOrderArray;
}

- (NSMutableArray *)shopOrderArray
{
    if (_shopOrderArray == nil) {
        _shopOrderArray = [NSMutableArray array];
    }
    return _shopOrderArray;
}


- (IBAction)monthlyOrderBtnClick:(UIButton *)sender {
    self.hourlyOrderBtn.selected = NO;
    self.shopOrderBtn.selected = NO;
    sender.selected = YES;
    self.orderType = orderMonthly;
    [self.orderTableView reloadData];
}
- (IBAction)HourlyOrderBtnClick:(UIButton *)sender {
    self.monthlyOrderBtn.selected = NO;
    self.shopOrderBtn.selected = NO;
    sender.selected = YES;
    self.orderType = orderhourly;
    [self.orderTableView reloadData];
}
- (IBAction)shopBtnClick:(UIButton *)sender {
    self.hourlyOrderBtn.selected = NO;
    self.monthlyOrderBtn.selected = NO;
    sender.selected = YES;
    self.orderType = orderShop;
    [self.orderTableView reloadData];
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
    self.navigationItem.title = @"我的订单";
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
