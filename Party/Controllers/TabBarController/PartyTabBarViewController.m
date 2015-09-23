//
//  PartyTabBarViewController.m
//  Party
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "PartyTabBarViewController.h"
#import "NearbyViewController.h"
#import "ActivityViewController.h"
#import "LaunchActivityViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"

@interface PartyTabBarViewController ()

@end

@implementation PartyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createViewControllers];
}

#pragma mark - 创建子视图控制器
- (void)createViewControllers {
    
    NSMutableArray *vcArr = [[NSMutableArray alloc] init];

    NearbyViewController *nearVC = [[NearbyViewController alloc] init];
    UINavigationController *nearNav = [[UINavigationController alloc] initWithRootViewController:nearVC];
    nearNav.tabBarItem.title = @"附近";
    nearNav.tabBarItem.image = [UIImage imageNamed: @"nearbyicon"];
    [vcArr addObject:nearNav];
    
    ActivityViewController *actVC = [[ActivityViewController alloc] init];
    UINavigationController *actNav = [[UINavigationController alloc] initWithRootViewController:actVC];
    actNav.tabBarItem.title = @"活动";
    actNav.tabBarItem.image = [UIImage imageNamed: @"dicoveryicon"];
    [vcArr addObject:actNav];
    
    
    LaunchActivityViewController *lauActVC = [[LaunchActivityViewController alloc] init];
    lauActVC.tabBarItem.image = [UIImage imageNamed: @"icon-top"];
    [vcArr addObject:lauActVC];
    
    MessageViewController *mesVC = [[MessageViewController alloc] init];
    UINavigationController *mesNav = [[UINavigationController alloc] initWithRootViewController:mesVC];
    mesNav.tabBarItem.title = @"消息";
    mesNav.tabBarItem.image = [UIImage imageNamed: @"message"];
    [vcArr addObject:mesNav];
    
    MineViewController *mineVc = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVc];
    mineNav.tabBarItem.title = @"我";
    mineNav.tabBarItem.image = [UIImage imageNamed: @"myicon"];
    [vcArr addObject:mineNav];
    
    
    self.viewControllers = vcArr;
   
    self.tabBar.backgroundImage = [UIImage imageNamed: @""];
    
    self.tabBar.backgroundColor = [UIColor blackColor];
    self.tabBar.tintColor = [UIColor redColor];
    
    UITabBarItem *item = self.tabBar.items[2];
    
//    [item.image imageWithAlignmentRectInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    
    [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item.imageInsets = UIEdgeInsetsMake(5, 5, 0, 0);
//    self.tabBar.items[2].imageEdgeInsets= UIEdgeInsetsMake(10, 0, 0, 0);
    
}







#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
