//
//  MonthlyServentListViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/20.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "MonthlyServentListViewController.h"
#import "Networks.h"
#import "monthlyServentCell.h"

@interface MonthlyServentListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *monthlyServentTableView;

@property (nonatomic,strong) NSMutableArray *monthlyServentArray;

@end

@implementation MonthlyServentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self dataTest];
    [self.view addSubview:self.monthlyServentTableView];
}

/**
 模拟数据
 */
- (void)dataTest
{
    for (int i = 0; i<20; i++) {
        [self.monthlyServentArray addObject:@1];
    }
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.monthlyServentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    monthlyServentCell *cell = [monthlyServentCell cellWithTableView:tableView];
    return cell;
}


- (UITableView *)monthlyServentTableView
{
    if (_monthlyServentTableView == nil) {
        _monthlyServentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, kWIN_WIDTH, kWIN_HEIGHT-64-41) style:UITableViewStylePlain];
        _monthlyServentTableView.backgroundColor = [UIColor whiteColor];
        _monthlyServentTableView.delegate = self;
        _monthlyServentTableView.dataSource = self;
        _monthlyServentTableView.estimatedRowHeight = 120.0;
        _monthlyServentTableView.rowHeight = UITableViewAutomaticDimension;
        _monthlyServentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _monthlyServentTableView.separatorStyle = NO;
    }
    return _monthlyServentTableView;
}

- (NSMutableArray *)monthlyServentArray
{
    if (_monthlyServentArray == nil) {
        _monthlyServentArray = [NSMutableArray array];
    }
    return _monthlyServentArray;
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
