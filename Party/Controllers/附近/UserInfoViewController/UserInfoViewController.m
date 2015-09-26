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
#import "UINavigationBar+Awesome.h"

@interface UserInfoViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UIView *headerView;


@end

@implementation UserInfoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    MyTabBarViewController* vc=(MyTabBarViewController*)self.tabBarController;
    vc.tabbarView.hidden=YES;
    vc.centerView.hidden=YES;
    
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    MyTabBarViewController* vc=(MyTabBarViewController*)self.tabBarController;
    vc.tabbarView.hidden=NO;
    vc.centerView.hidden=NO;
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    [self createTableView];
    
    [self createFootterView];
}

- (void)createTableView {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self createTableViewHeaderView];
    [self.view addSubview:self.tableView];
}

- (void)createTableViewHeaderView {

    self.headerView = [[UserInfoHeaderView alloc] init];
    
    self.tableView.tableHeaderView = self.headerView;

    self.tableView.bounces = NO;
}


- (void)createFootterView {

    UIView *footterView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44)];
    footterView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    [self.view addSubview:footterView];
    
    
    UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [chatButton setImage:[UIImage imageNamed: @"chat"] forState:UIControlStateNormal];
    [chatButton setTitle:@"  聊天" forState:UIControlStateNormal];
    [chatButton setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2, 44)];
    
    chatButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    
    [footterView addSubview:chatButton];
    
    UIButton *reportButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [reportButton setImage:[UIImage imageNamed: @"report"] forState:UIControlStateNormal];
    [reportButton setTitle:@"  拉黑/举报" forState:UIControlStateNormal];
    [reportButton setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width/2, 44)];
    
    reportButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [footterView addSubview:reportButton];
    
    
    
}


#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 16;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 64) {
        CGFloat alpha = (offsetY - 64)/64;
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}



#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
