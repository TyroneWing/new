//
//  OrderHourlyViewController.m
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/2.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "OrderHourlyViewController.h"
#import "OrderShopButtom.h"
#import "Masonry.h"
#import "OrderShopNumberCell.h"
#import "OrderHourlyDetailCell.h"
#import "OrderPriceCell.h"
#import "OrderLabelCell.h"
#import "Networks.h"

@interface OrderHourlyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *orderHourlyTableView;
@property (nonatomic,strong) OrderShopButtom *orderShopButtom;

@end

@implementation OrderHourlyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"订单详情";

    [self.view addSubview:self.orderHourlyTableView];
    [self.view addSubview:self.orderShopButtom];

    [self.orderShopButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
}


#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 3;
    } else if (section == 3) {
        return 6;
    } else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        OrderShopNumberCell *cell = [OrderShopNumberCell cellWithTableView:tableView];
        return cell;
    } else if (indexPath.section == 1) {
        OrderHourlyDetailCell *cell = [OrderHourlyDetailCell cellWithTableView:tableView];
        return cell;
    } else if (indexPath.section == 2) {
        OrderPriceCell *cell = [OrderPriceCell cellWithTableView:tableView];
        if (indexPath.row == 0) {
            cell.lineView.alpha = 0;
            cell.orderPriceTitleLabel.text = @"服务金额";
            cell.orderPriceLabel.text = @"￥200.00";
        } else if (indexPath.row == 1){
            cell.lineView.alpha = 1;
            cell.orderPriceTitleLabel.text = @"使用优惠券";
            cell.orderPriceLabel.text = @"-￥5.00";
        } else if (indexPath.row == 2){
            cell.lineView.alpha = 1;
            cell.orderPriceTitleLabel.text = @"合计";
            cell.orderPriceLabel.text = @"￥195.00";
        }
        return cell;
    } else {
        OrderLabelCell *cell = [OrderLabelCell cellWithTableView:tableView];
        if (indexPath.row == 0) {
            cell.orderTitleLabel.text = @"姓名:";
            cell.orderLabel.text = @"周星星";
        } else if (indexPath.row == 1){
            cell.orderTitleLabel.text = @"电话:";
            cell.orderLabel.text = @"13812345678";
        }else if (indexPath.row == 2){
            cell.orderTitleLabel.text = @"服务时间:";
            cell.orderLabel.text = @"2017-03-03 9:00:00";
        }else if (indexPath.row == 3){
            cell.orderTitleLabel.text = @"服务地区:";
            cell.orderLabel.text = @"广东省广州市越秀区";
        }else if (indexPath.row == 4){
            cell.orderTitleLabel.text = @"详细地址:";
            cell.orderLabel.text = @"沿江中路313号康富来国际大厦沿江中路313号康富来国际大厦";
        }else if (indexPath.row == 5){
            cell.orderTitleLabel.text = @"留言:";
            cell.orderLabel.text = @"勤奋不怕吃苦";
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = RGB(244, 245, 246);
    return footer;
}


-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}



- (UITableView *)orderHourlyTableView
{
    if (_orderHourlyTableView == nil) {
        _orderHourlyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, kWIN_HEIGHT-64-60) style:UITableViewStyleGrouped];
        _orderHourlyTableView.backgroundColor = [UIColor whiteColor];
        _orderHourlyTableView.delegate = self;
        _orderHourlyTableView.dataSource = self;
        _orderHourlyTableView.estimatedRowHeight = 150.0;
        _orderHourlyTableView.rowHeight = UITableViewAutomaticDimension;
        _orderHourlyTableView.showsVerticalScrollIndicator = NO;
        _orderHourlyTableView.separatorStyle = NO;
        _orderHourlyTableView.tableFooterView = [[UIView alloc] init];
        _orderHourlyTableView.bounces = NO;
    }
    return _orderHourlyTableView;
}


- (OrderShopButtom *)orderShopButtom
{
    if (_orderShopButtom == nil) {
        _orderShopButtom =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([OrderShopButtom class]) owner:nil options:nil] firstObject];
        //        __weak __typeof__(self) weakSelf = self;
        
    }
    return _orderShopButtom;
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
