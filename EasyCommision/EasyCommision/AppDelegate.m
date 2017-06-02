//
//  AppDelegate.m
//  EasyCommision
//
//  Created by yi on 17/5/17.
//  Copyright © 2017年 yi. All rights reserved.
//

#import "AppDelegate.h"
#import "Networks.h"
#import <IQKeyboardManager.h>
#import "BaseTabBarViewController.h"
#import "HomeViewController.h"
#import "ShopViewController.h"
#import "OrderViewController.h"
#import "MineViewController.h"

//测试
#import "LoginViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [self test];
    [self setupKeyboardManager];
    [self createTabBarVC];
    return YES;
}

- (void)setupKeyboardManager
{
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    keyboardManager.enable = YES; // 控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    keyboardManager.enableAutoToolbar = YES; // 控制是否显示键盘上的工具条
    keyboardManager.shouldShowTextFieldPlaceholder = YES; // 是否显示占位文字
    keyboardManager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
    keyboardManager.shouldToolbarUsesTextFieldTintColor = NO; // 控制键盘上的工具条文字颜色是否用户自定义
    keyboardManager.toolbarTintColor = [UIColor blackColor];
}

- (void)test
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *loginNaviVC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = loginNaviVC;
}

- (void)createTabBarVC
{

    NSArray *titleArray = @[@"首页",@"商城",@"订单",@"我的"];
    NSArray *imageArray = @[@"home_g1.png",@"main_g2.png",@"main_g3.png",@"main_g4.png"];
    NSArray *imageSelectArray = @[@"home_rd.png",@"main_r2.png",@"main_r3.png",@"main_r4.png"];
    BaseTabBarViewController *baseTarbarVC  = [[BaseTabBarViewController alloc] init];
    baseTarbarVC.tabBar.tintColor = RGB(220, 0, 22);
    //首页
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.tabBarItem.title = titleArray[0];
    homeVC.tabBarItem.image = [[UIImage imageNamed:imageArray[0]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:imageSelectArray[0]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *homeNaviVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    //商城
    ShopViewController *shopVC = [[ShopViewController alloc] init];
    shopVC.tabBarItem.title = titleArray[1];
    shopVC.tabBarItem.image = [UIImage imageNamed:imageArray[1]];
    shopVC.tabBarItem.selectedImage = [UIImage imageNamed:imageSelectArray[1]];
    UINavigationController *shopNaviVC = [[UINavigationController alloc] initWithRootViewController:shopVC];
    
    //订单
    OrderViewController *orderVC = [[OrderViewController alloc] init];
    orderVC.tabBarItem.title = titleArray[2];
    orderVC.tabBarItem.image = [UIImage imageNamed:imageArray[2]];
    orderVC.tabBarItem.selectedImage = [UIImage imageNamed:imageSelectArray[2]];
    UINavigationController *orderNaviVC = [[UINavigationController alloc] initWithRootViewController:orderVC];
    
    //我的
    MineViewController *mineVC = [[MineViewController alloc] init];
    mineVC.tabBarItem.title = titleArray[3];
    mineVC.tabBarItem.image = [UIImage imageNamed:imageArray[3]];
    mineVC.tabBarItem.selectedImage = [UIImage imageNamed:imageSelectArray[3]];
    UINavigationController *mineNaviVC = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    baseTarbarVC.viewControllers = @[homeNaviVC,shopNaviVC,orderNaviVC,mineNaviVC];

    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];

    self.window.rootViewController = baseTarbarVC;
    [self.window makeKeyAndVisible];


}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
