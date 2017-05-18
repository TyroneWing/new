//
//  ResetPWViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/18.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "ResetPWViewController.h"
#import "ResetPWSuccessView.h"

@interface ResetPWViewController ()

@end

@implementation ResetPWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"重置密码";

}
- (IBAction)resetPWBtnClick:(UIButton *)sender {
    
    ResetPWSuccessView *resetView =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ResetPWSuccessView class]) owner:nil options:nil] firstObject];
    resetView.frame = self.view.bounds;
    [self.view addSubview:resetView];

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
