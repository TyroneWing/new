//
//  RegisterViewController.m
//  EasyCommision
//
//  Created by yi on 17/5/18.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIButton+Rect.h"
#import "RegisterSuccessView.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *sendMsgBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *msgTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordAgainTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"注册";
    self.agreeBtn.imageRect = CGRectMake(0, 6, 16, 16);
    self.agreeBtn.titleRect = CGRectMake(24, 0, 220, 28);

}


- (IBAction)registerBtnClick:(UIButton *)sender {
    
    
    if (self.agreeBtn.selected) {
        RegisterSuccessView *registerView =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([RegisterSuccessView class]) owner:nil options:nil] firstObject];
        registerView.frame = self.view.bounds;
        [self.view addSubview:registerView];
    }
    
}

- (IBAction)sendMsgBtnClick:(UIButton *)sender {
    NSLog(@"发送验证码");
}

- (IBAction)agreeBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
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
