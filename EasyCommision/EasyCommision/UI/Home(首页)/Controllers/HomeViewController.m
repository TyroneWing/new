//
//  HomeViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/17.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "HomeViewController.h"
#import "Networks.h"
#import "HomeKnowledgeCell.h"
#import "monthlyServentCell.h"

#import "HourlyServantListViewController.h"
#import "MonthlyServentListViewController.h"



@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *homeTableView;
@property (nonatomic,strong) NSMutableArray *knowledgeArray;
@property (nonatomic,strong) NSMutableArray *serventArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];

//    [self settingNavigationbar];
    [self.view addSubview:self.homeTableView];

}


//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self test];
//}
//
//- (void)test
//{
//    //HourlyServantListViewController *vc = [[HourlyServantListViewController alloc] init];//钟点工列表页面
//    MonthlyServentListViewController *vc = [[MonthlyServentListViewController alloc] init];//住家工列表页面
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
//}



#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 0;
    } else if (section == 3) {
        return 10;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        HomeKnowledgeCell *cell = [HomeKnowledgeCell cellWithTableView:tableView];
        return cell;
    } else if (indexPath.section == 1) {
        monthlyServentCell *cell = [monthlyServentCell cellWithTableView:tableView];
        return cell;
    } else if (indexPath.section == 2) {
        HomeKnowledgeCell *cell = [HomeKnowledgeCell cellWithTableView:tableView];
        return cell;
    } else {
        HomeKnowledgeCell *cell = [HomeKnowledgeCell cellWithTableView:tableView];
        return cell;
    }
}

- (UITableView *)homeTableView
{
    if (_homeTableView == nil) {
        _homeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _homeTableView.backgroundColor = [UIColor whiteColor];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.estimatedRowHeight = 120.0;
        _homeTableView.rowHeight = UITableViewAutomaticDimension;
        _homeTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _homeTableView.separatorStyle = NO;
    }
    return _homeTableView;
}

- (NSMutableArray *)knowledgeArray
{
    if (_knowledgeArray == nil) {
        _knowledgeArray = [NSMutableArray array];
    }
    return _knowledgeArray;
}

- (NSMutableArray *)serventArray
{
    if (_serventArray == nil) {
        _serventArray = [NSMutableArray array];
    }
    return _serventArray;
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
    self.navigationItem.title = @"首页";
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
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
