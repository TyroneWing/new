//
//  OrderMonthlyViewController.m
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/2.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "OrderMonthlyViewController.h"
#import "OrderLabelCell.h"
#import "OrderSectionHeadCell.h"
#import "Networks.h"
#import "OrderPriceCell.h"
#import "OrderMonthlyButtom.h"
#import "Masonry.h"

@interface OrderMonthlyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *orderMonthlyTableView;
@property (nonatomic,strong) OrderMonthlyButtom *orderMonthlyButtom;


@end

@implementation OrderMonthlyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"订单详情";

    [self.view addSubview:self.orderMonthlyTableView];

    [self.view addSubview:self.orderMonthlyButtom];
    [self.orderMonthlyButtom mas_makeConstraints:^(MASConstraintMaker *make) {
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
    if (section == 0 || section == 1) {
        return 3;
    } else if (section == 2) {
        return 7;
    } else
        return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        OrderLabelCell *cell = [OrderLabelCell cellWithTableView:tableView];
        if (indexPath.row == 0) {
            cell.orderTitleLabel.text = @"订单号:";
            cell.orderLabel.text = @"123456";
        } else if (indexPath.row == 1){
            cell.orderTitleLabel.text = @"状态:";
            cell.orderLabel.text = @"待付款";
        }else if (indexPath.row == 2){
            cell.orderTitleLabel.text = @"下单时间:";
            cell.orderLabel.text = @"2017-03-03 9:00:00";
        }
        return cell;
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            OrderSectionHeadCell *cell = [OrderSectionHeadCell cellWithTableView:tableView];
            cell.orderSectionLabel.text = @"佣工信息";
            return cell;
        } else {
            OrderLabelCell *cell = [OrderLabelCell cellWithTableView:tableView];
            if (indexPath.row == 1) {
                cell.orderTitleLabel.text = @"李阿姨";
                cell.orderLabel.alpha = 0;
            } else {
                cell.orderTitleLabel.text = @"ID:";
                cell.orderLabel.text = @"20170303";
            }
            return cell;
        }

    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            OrderSectionHeadCell *cell = [OrderSectionHeadCell cellWithTableView:tableView];
            cell.orderSectionLabel.text = @"支付方式";
            return cell;
        } else {
            OrderLabelCell *cell = [OrderLabelCell cellWithTableView:tableView];
            if (indexPath.row == 1) {
                cell.orderTitleLabel.text = @"姓名:";
                cell.orderLabel.text = @"周星星";
            } else if (indexPath.row == 2){
                cell.orderTitleLabel.text = @"电话:";
                cell.orderLabel.text = @"13812345678";
            }else if (indexPath.row == 3){
                cell.orderTitleLabel.text = @"服务时间:";
                cell.orderLabel.text = @"2017-03-03 9:00:00";
            }else if (indexPath.row == 4){
                cell.orderTitleLabel.text = @"服务地区:";
                cell.orderLabel.text = @"广东省广州市越秀区";
            }else if (indexPath.row == 5){
                cell.orderTitleLabel.text = @"详细地址:";
                cell.orderLabel.text = @"沿江中路313号康富来国际大厦沿江中路313号康富来国际大厦";
            }else if (indexPath.row == 6){
                cell.orderTitleLabel.text = @"备注信息:";
                cell.orderLabel.text = @"勤劳,勇敢";
            }
            return cell;
        }
    } else {
        if (indexPath.row == 0) {
            OrderSectionHeadCell *cell = [OrderSectionHeadCell cellWithTableView:tableView];
            cell.orderSectionLabel.text = @"服务信息";
            return cell;
        } else {
            OrderPriceCell *cell = [OrderPriceCell cellWithTableView:tableView];
            if (indexPath.row == 1) {
                cell.orderPriceTitleLabel.text = @"服务金额";
            } else if (indexPath.row == 2) {
                cell.orderPriceTitleLabel.text = @"服务时间";
                cell.orderPriceLabel.text = @"2017-01-01 至 2017-02-02";
            } else if (indexPath.row == 3) {
                cell.orderPriceTitleLabel.text = @"月结时间";
                cell.orderPriceLabel.text = @"2017-02-02";
            } else if (indexPath.row == 4) {
                cell.orderPriceTitleLabel.text = @"合计";
            }
            return cell;
        }
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





- (UITableView *)orderMonthlyTableView
{
    if (_orderMonthlyTableView == nil) {
        _orderMonthlyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, kWIN_HEIGHT-64-60) style:UITableViewStyleGrouped];
        _orderMonthlyTableView.backgroundColor = [UIColor whiteColor];
        _orderMonthlyTableView.delegate = self;
        _orderMonthlyTableView.dataSource = self;
        _orderMonthlyTableView.estimatedRowHeight = 150.0;
        _orderMonthlyTableView.rowHeight = UITableViewAutomaticDimension;
        _orderMonthlyTableView.showsVerticalScrollIndicator = NO;
        _orderMonthlyTableView.separatorStyle = NO;
        _orderMonthlyTableView.tableFooterView = [[UIView alloc] init];
        _orderMonthlyTableView.bounces = NO;
    }
    return _orderMonthlyTableView;
}

- (OrderMonthlyButtom *)orderMonthlyButtom
{
    if (_orderMonthlyButtom == nil) {
        _orderMonthlyButtom =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([OrderMonthlyButtom class]) owner:nil options:nil] firstObject];
    }
    return _orderMonthlyButtom;
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
