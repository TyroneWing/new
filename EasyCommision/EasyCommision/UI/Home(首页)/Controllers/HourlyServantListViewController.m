//
//  HourlyServantListViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/20.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "HourlyServantListViewController.h"
#import "hourlyServentCell.h"
#import "Networks.h"


@interface HourlyServantListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *hourlyServentTableView;

@property (nonatomic,strong) NSMutableArray *hourlyServentArray;

@end

@implementation HourlyServantListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self dataTest];
    [self.view addSubview:self.hourlyServentTableView];
}

/**
 模拟数据
 */
- (void)dataTest
{
    for (int i = 0; i<20; i++) {
        [self.hourlyServentArray addObject:@1];
    }
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hourlyServentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    hourlyServentCell *cell = [hourlyServentCell cellWithTableView:tableView];
    return cell;
}


- (UITableView *)hourlyServentTableView
{
    if (_hourlyServentTableView == nil) {
        _hourlyServentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, kWIN_WIDTH, kWIN_HEIGHT-64-41) style:UITableViewStylePlain];
        _hourlyServentTableView.backgroundColor = [UIColor whiteColor];
        _hourlyServentTableView.delegate = self;
        _hourlyServentTableView.dataSource = self;
        _hourlyServentTableView.estimatedRowHeight = 120.0;
        _hourlyServentTableView.rowHeight = UITableViewAutomaticDimension;
        _hourlyServentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _hourlyServentTableView.separatorStyle = NO;
    }
    return _hourlyServentTableView;
}

- (NSMutableArray *)hourlyServentArray
{
    if (_hourlyServentArray == nil) {
        _hourlyServentArray = [NSMutableArray array];
    }
    return _hourlyServentArray;
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
