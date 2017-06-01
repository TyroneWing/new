//
//  OrderMsgViewController.m
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/1.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "OrderMsgViewController.h"
#import "Networks.h"
#import "OrderSectionHeadCell.h"
#import "TrolleyCell.h"
#import "OrderDetailCell.h"
#import "OrderPriceCell.h"

@interface OrderMsgViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *orderTableView;
@property (nonatomic,strong) NSArray *orderTypeArray;

@end

@implementation OrderMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.orderTypeArray = @[@"商品信息",@"价格信息",@"优惠券",@"支付方式",@"收货信息"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"填写订单";
    [self.view addSubview:self.orderTableView];
}



#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.orderTypeArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 4;
    } else if (section == 2) {
        return 2;
    } else if (section == 3) {
        return 2;
    } else {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        OrderSectionHeadCell *cell = [OrderSectionHeadCell cellWithTableView:tableView];
        cell.orderSectionLabel.text = self.orderTypeArray[indexPath.section];
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        OrderDetailCell *cell = [OrderDetailCell cellWithTableView:tableView];
        return cell;

    }
    if (indexPath.section == 1) {
        OrderPriceCell *cell = [OrderPriceCell cellWithTableView:tableView];
        if (indexPath.row == 0) {
            cell.orderPriceTitleLabel.text = @"商品金额";
        } else if (indexPath.row == 1) {
            cell.orderPriceTitleLabel.text = @"运费";
        } else if (indexPath.row == 2) {
            cell.orderPriceTitleLabel.text = @"实付";
        }

        return cell;
    }

    TrolleyCell *cell = [TrolleyCell cellWithTableView:tableView];
    return cell;

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
    if (section == 4) {
        return 0.1f;
    }
    return 10;
}



- (UITableView *)orderTableView
{
    if (_orderTableView == nil) {
        _orderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, kWIN_HEIGHT-64-60) style:UITableViewStyleGrouped];
        _orderTableView.backgroundColor = [UIColor whiteColor];
        _orderTableView.delegate = self;
        _orderTableView.dataSource = self;
        _orderTableView.estimatedRowHeight = 120.0;
        _orderTableView.rowHeight = UITableViewAutomaticDimension;
        //        _trolleyTableView.showsVerticalScrollIndicator = NO;
        _orderTableView.separatorStyle = NO;
        _orderTableView.tableFooterView = [[UIView alloc] init];
        _orderTableView.bounces = NO;
        _orderTableView.separatorColor = [UIColor redColor];
        _orderTableView.backgroundColor = [UIColor clearColor];
    }
    return _orderTableView;
}


//- (TrolleyButtom *)trolleyButtom
//{
//    if (_trolleyButtom == nil) {
//        _trolleyButtom =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TrolleyButtom class]) owner:nil options:nil] firstObject];
//        _trolleyButtom.frame = CGRectMake(0, kWIN_HEIGHT - 60 - 64, kWIN_WIDTH, _trolleyButtom.frame.size.height);
//        _trolleyButtom.userInteractionEnabled = YES;
//        __weak __typeof__(self) weakSelf = self;
//
//        [_trolleyButtom setAccountBtnClick:^(UIButton *btn){
//            __strong __typeof(self) strongSelf = weakSelf;
//            OrderMsgViewController *vc = [[OrderMsgViewController alloc] init];
//            [strongSelf.navigationController pushViewController:vc animated:YES];
//        }];
//    }
//    return _trolleyButtom;
//}


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
