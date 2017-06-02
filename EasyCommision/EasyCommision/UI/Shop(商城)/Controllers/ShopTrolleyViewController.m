//
//  ShopTrolleyViewController.m
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/1.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ShopTrolleyViewController.h"
#import "TrolleyCell.h"
#import "TrolleyButtom.h"
#import "Networks.h"
#import "OrderMsgViewController.h"
#import "Masonry.h"

@interface ShopTrolleyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *trolleyTableView;
@property (nonatomic,strong) NSMutableArray *trolleyArray;
@property (nonatomic,strong) TrolleyButtom *trolleyButtom;

@end

@implementation ShopTrolleyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.view.backgroundColor = [UIColor whiteColor];
    [self dataTest];
    self.navigationItem.title = @"购物车";
    [self.view addSubview:self.trolleyTableView];
    [self.view addSubview:self.trolleyButtom];
    [self.trolleyButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
}


- (void)dataTest
{
    for (int i = 0; i<3; i++) {
        [self.trolleyArray addObject:@1];
    }
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trolleyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TrolleyCell *cell = [TrolleyCell cellWithTableView:tableView];
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

//定义编辑样式
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView setEditing:YES animated:YES];
//    return UITableViewCellEditingStyleDelete;
//}

//进入编辑模式，按下出现的编辑按钮后
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.trolleyArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)moreBtnClick:(UIButton *)btn
{
    NSLog(@"moreBtnClick");
}




- (UITableView *)trolleyTableView
{
    if (_trolleyTableView == nil) {
        _trolleyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, kWIN_HEIGHT-64-60) style:UITableViewStylePlain];
        _trolleyTableView.backgroundColor = [UIColor whiteColor];
        _trolleyTableView.delegate = self;
        _trolleyTableView.dataSource = self;
        _trolleyTableView.estimatedRowHeight = 120.0;
        _trolleyTableView.rowHeight = UITableViewAutomaticDimension;
        //        _trolleyTableView.showsVerticalScrollIndicator = NO;
        _trolleyTableView.separatorStyle = NO;


        UIButton *fooerView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, 50)];
        [fooerView setTitle:@"继续添加商品 > " forState:UIControlStateNormal];
        [fooerView addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [fooerView setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _trolleyTableView.tableFooterView = fooerView;
        _trolleyTableView.bounces = NO;
    }
    return _trolleyTableView;
}

- (NSMutableArray *)trolleyArray
{
    if (_trolleyArray == nil) {
        _trolleyArray = [NSMutableArray array];
    }
    return _trolleyArray;
}

- (TrolleyButtom *)trolleyButtom
{
    if (_trolleyButtom == nil) {
        _trolleyButtom =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TrolleyButtom class]) owner:nil options:nil] firstObject];
//        _trolleyButtom.frame = CGRectMake(0, kWIN_HEIGHT - 60 - 64, kWIN_WIDTH, 100);
//        _trolleyButtom.userInteractionEnabled = YES;
        __weak __typeof__(self) weakSelf = self;
        [_trolleyButtom setAccountBtnClick:^(UIButton *btn){
            __strong __typeof(self) strongSelf = weakSelf;
            OrderMsgViewController *vc = [[OrderMsgViewController alloc] init];
            [strongSelf.navigationController pushViewController:vc animated:YES];
        }];
        [self.view layoutIfNeeded];
    }
    return _trolleyButtom;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"vc");
//    OrderMsgViewController *vc = [[OrderMsgViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
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
