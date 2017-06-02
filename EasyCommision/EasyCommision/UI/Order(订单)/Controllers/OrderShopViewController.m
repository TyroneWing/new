//
//  OrderShopViewController.m
//  EasyCommision
//
//  Created by hunuo_ios on 2017/6/2.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "OrderShopViewController.h"
#import "Networks.h"
#import "OrderShopNumberCell.h"
#import "OrderShopDetailCell.h"
#import "OrderPriceCell.h"
#import "OrderShopButtom.h"
#import "Masonry.h"
#import "TrolleyCell.h"


@interface OrderShopViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *orderShopTableView;
@property (nonatomic,strong) OrderShopButtom *orderShopButtom;

//@property (nonatomic,strong) NSArray *orderShopArray;

@end

@implementation OrderShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"订单详情";

    [self.view addSubview:self.orderShopTableView];
    [self.view addSubview:self.orderShopButtom];

    [self.orderShopButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];

    NSLog(@"%@",NSStringFromCGRect(self.orderShopButtom.frame));

}


#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0 || indexPath.section == 1) {
        OrderShopNumberCell *cell = [OrderShopNumberCell cellWithTableView:tableView];
        if (indexPath.section == 1) {
            cell.firstLabel.text = @"收货人: 张三";
            cell.secondLabel.text = @"手机: 13012345678";
            cell.thirdLabel.text = @"收货地址: 广东省广州市越秀区沿江中路313号康富来国际大厦1205室";

        }
        return cell;
    } else if (indexPath.section == 2) {
        OrderShopDetailCell *cell = [OrderShopDetailCell cellWithTableView:tableView];
        return cell;
    } else {
        OrderPriceCell *cell = [OrderPriceCell cellWithTableView:tableView];
        if (indexPath.row == 0) {
            cell.lineView.alpha = 0;
            cell.orderPriceTitleLabel.text = @"商品金额";
            cell.orderPriceLabel.text = @"￥200.00";
        } else if (indexPath.row == 1){
            cell.lineView.alpha = 1;
            cell.orderPriceTitleLabel.text = @"运费";
            cell.orderPriceLabel.text = @"￥15.00";

        } else if (indexPath.row == 2){
            cell.lineView.alpha = 1;
            cell.orderPriceTitleLabel.text = @"使用优惠券";
            cell.orderPriceLabel.text = @"-￥5.00";

        } else if (indexPath.row == 3){
            cell.lineView.alpha = 1;
            cell.orderPriceTitleLabel.text = @"合计";
            cell.orderPriceLabel.text = @"￥210.00";

        }
        return cell;
    }


//    OrderPriceCell *cell = [OrderPriceCell cellWithTableView:tableView];
//    return cell;

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



- (UITableView *)orderShopTableView
{
    if (_orderShopTableView == nil) {
        _orderShopTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, kWIN_HEIGHT-64-60) style:UITableViewStyleGrouped];
        _orderShopTableView.backgroundColor = [UIColor whiteColor];
        _orderShopTableView.delegate = self;
        _orderShopTableView.dataSource = self;
        _orderShopTableView.estimatedRowHeight = 150.0;
        _orderShopTableView.rowHeight = UITableViewAutomaticDimension;
        _orderShopTableView.showsVerticalScrollIndicator = NO;
        _orderShopTableView.separatorStyle = NO;
        _orderShopTableView.tableFooterView = [[UIView alloc] init];
        _orderShopTableView.bounces = NO;
    }
    return _orderShopTableView;
}


- (OrderShopButtom *)orderShopButtom
{
    if (_orderShopButtom == nil) {
        _orderShopButtom =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([OrderShopButtom class]) owner:nil options:nil] firstObject];

//        _orderShopButtom.frame = CGRectMake(0, kWIN_HEIGHT - 60 - 64, kWIN_WIDTH, 100);
//        _orderShopButtom.userInteractionEnabled = YES;
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
