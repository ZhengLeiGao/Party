//
//  LaunchActivityViewController.m
//  Party
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "LaunchActivityViewController.h"

@interface LaunchActivityViewController ()


@property (nonatomic, strong) UIViewController *centerViewController;


@end

@implementation LaunchActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发起活动";
    self.view.backgroundColor = [UIColor blackColor];
    
   
    
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
