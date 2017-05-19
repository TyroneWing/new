//
//  AddressListViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/18.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "AddressListViewController.h"
#import "AddressCell.h"
#import "Networks.h"
#import "UIColor+HEXString.h"

@interface AddressListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *addressTableView;
@property (nonatomic,strong) NSMutableArray *addressArray;
@property (nonatomic,strong) UIButton *addNewAddressBtn;
@end

@implementation AddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createButtonView];
    for (int i = 0; i<3; i++) {
        [self.addressArray addObject:@1];
    }
    
    
    self.navigationItem.title = @"收货地址";
    [self.view addSubview:self.addressTableView];
    
    
    
}


- (void)createButtonView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, kWIN_HEIGHT-64-65, kWIN_WIDTH, 65)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [view addSubview:self.addNewAddressBtn];
}


#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.addressArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressCell *cell = [AddressCell cellWithTableView:tableView];
    return cell;
}


- (UITableView *)addressTableView
{
    if (_addressTableView == nil) {
        _addressTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWIN_WIDTH, kWIN_HEIGHT-64-65) style:UITableViewStylePlain];
        _addressTableView.backgroundColor = [UIColor whiteColor];
        _addressTableView.delegate = self;
        _addressTableView.dataSource = self;
        _addressTableView.estimatedRowHeight = 100.0;
        _addressTableView.rowHeight = UITableViewAutomaticDimension;
        _addressTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

        //    _myMessageTableView.showsVerticalScrollIndicator = NO;
        _addressTableView.separatorStyle = NO;
        //    _myMessageTableView.bounces = NO;
    }
    return _addressTableView;
}

- (NSMutableArray *)addressArray
{
    if (_addressArray == nil) {
        _addressArray = [NSMutableArray array];
    }
    return _addressArray;
}


- (UIButton *)addNewAddressBtn
{
    if (_addNewAddressBtn == nil) {
        _addNewAddressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addNewAddressBtn.frame = CGRectMake(15, 15, kWIN_WIDTH-30, 35);
        [_addNewAddressBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
        _addNewAddressBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_addNewAddressBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _addNewAddressBtn.backgroundColor = backgroudColor;
        [_addNewAddressBtn addTarget:self action:@selector(addNewAddressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addNewAddressBtn;
}


- (void)addNewAddressBtnClick:(UIButton *)btn
{
    NSLog(@"添加新地址");
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
