//
//  UserInfoViewController.m
//  Party
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoHeaderView.h"
#import "MyTabBarViewController.h"

@interface UserInfoViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UIView *headerView;


@end

@implementation UserInfoViewController

-(void)viewWillAppear:(BOOL)animated{
    MyTabBarViewController* vc=(MyTabBarViewController*)self.tabBarController;
    vc.tabbarView.hidden=YES;
    vc.centerView.hidden=YES;
}


-(void)viewWillDisappear:(BOOL)animated{
    MyTabBarViewController* vc=(MyTabBarViewController*)self.tabBarController;
    vc.tabbarView.hidden=NO;
    vc.centerView.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self createTableView];
    
    [self createFootterView];
}

- (void)createTableView {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self createTableViewHeaderView];
}

- (void)createTableViewHeaderView {

    self.headerView = [[UserInfoHeaderView alloc] init];
    
    self.tableView.tableHeaderView = self.headerView;
    
    
    
    
    
}


- (void)createFootterView {

    UIView *footterView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44)];
    footterView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    [self.view addSubview:footterView];
    
    
}


#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return nil;
}






#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
