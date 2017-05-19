//
//  MyMessageViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/18.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "MyMessageViewController.h"
#import "MyMessageCell.h"

@interface MyMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myMessageTableView;
@property (nonatomic,strong) NSMutableArray *myMessageArray;
@end

@implementation MyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self dataTest];
    
    self.navigationItem.title = @"我的消息";
    [self.view addSubview:self.myMessageTableView];
}


/**
 模拟数据
 */
- (void)dataTest
{
    for (int i = 0; i<6; i++) {
        [self.myMessageArray addObject:@1];
    }
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myMessageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyMessageCell *cell = [MyMessageCell cellWithTableView:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
}

//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

////定义编辑样式
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView setEditing:YES animated:YES];
//    return UITableViewCellEditingStyleDelete;
//}

//进入编辑模式，按下出现的编辑按钮后
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [tableView setEditing:NO animated:YES];
    
    [self.myMessageArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



- (UITableView *)myMessageTableView
{
    if (_myMessageTableView == nil) {
        _myMessageTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myMessageTableView.backgroundColor = [UIColor whiteColor];
        _myMessageTableView.delegate = self;
        _myMessageTableView.dataSource = self;
        _myMessageTableView.estimatedRowHeight = 50.0;
        _myMessageTableView.rowHeight = UITableViewAutomaticDimension;
//        _myMessageTableView.showsVerticalScrollIndicator = NO;
//        _myMessageTableView.separatorStyle = NO;
        _myMessageTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//        _myMessageTableView.bounces = NO;
    }
    return _myMessageTableView;
}

- (NSMutableArray *)myMessageArray
{
    if (_myMessageArray == nil) {
        _myMessageArray = [NSMutableArray array];
    }
    return _myMessageArray;
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
