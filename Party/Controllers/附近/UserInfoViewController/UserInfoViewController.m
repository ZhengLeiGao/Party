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

@interface UserInfoViewController () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

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

    
    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"nav_top_search"] forBarMetrics:UIBarMetricsCompact];

//    self.extendedLayoutIncludesOpaqueBars = YES;
    
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self createTableView];
    
    [self createFootterView];
}

- (void)createTableView {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    self.tableView.backgroundColor = [UIColor redColor];
    

    [self createTableViewHeaderView];
    
    [self.view addSubview:self.tableView];
}

- (void)createTableViewHeaderView {

    self.headerView = [[UserInfoHeaderView alloc] init];
    
    self.tableView.tableHeaderView = self.headerView;
    
    self.tableView.bounces = NO;

    
    
//    self.tableView.separatorInset=UIEdgeInsetsZero;
//    self.tableView.layoutMargins=UIEdgeInsetsZero;
//    
    
    
}


- (void)createFootterView {

    UIView *footterView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44)];
    footterView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    [self.view addSubview:footterView];
    
    
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


// 滑动scrollView，并且手指离开时执行。一次有效滑动，只执行一次。
// 当pagingEnabled属性为YES时，不调用，该方法
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
//    NSLog(@%f,velocity.y);
//    if (velocity.y > 0.0)
//    {
//        //向上滑动隐藏导航栏
//        self.navigationController.navigationBar.hidden = NO;
//    }else
//    {
//        //向下滑动显示导航栏
//        self.navigationController.navigationBar.hidden = YES;
//    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
  
    [self.navigationController.navigationBar setTranslucent:NO];
}





#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
