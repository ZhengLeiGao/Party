//
//  NearbyViewController.m
//  Party
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "NearbyViewController.h"
#import "UserListTableViewCell.h"
#import "UserModel.h"
#import "HobbyListModel.h"
#import "JHRefresh.h"
@interface NearbyViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) BOOL isRefreshing;
@property (nonatomic) BOOL isLoadMore;
@end

@implementation NearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"附近";
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    [self createNavigationItem];
    [self createTableView];
    [self createRefreshView];

    [self createAFNetwork];
    [self loadData];
    
    
}

#pragma mark - 创建导航上的按钮
- (void)createNavigationItem {
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed: @"nav_top_search"] style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClick)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)rightItemClick {

    
}


#pragma mark - 第一次下载数据
- (void)loadData {
//    if (self.currentPage == 1) {
//        [self.dataArr removeAllObjects];
//        [self.tableView reloadData];
//    }
    
    NSDictionary *dict = @{@"act":@"location_pact",@"uid":@"0",@"time_range":@"",@"page":@(self.currentPage),@"count":@(20),@"constellation":@"",@"longitude":@(113.682316),@"age_range":@"",@"sex":@"",@"latitude":@(34.778620),@"mod":@"User"};
    
    
    __weak typeof(self) weakSelf = self;
    [self.manager POST:NearURL parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *data = [jsonData objectForKey:@"data"];
        
        NSArray *userArr = [data objectForKey:@"user_list"];
        
            if (self.currentPage == 1) {
                [self.dataArr removeAllObjects];
            }
        
        for (NSDictionary *dict in userArr) {
            UserModel *model = [[UserModel alloc] init];
            NSArray *hobbyArr = [dict objectForKey:@"hobby_list"];
            
            model.hobbyListArr = [[NSMutableArray alloc] init];

            for (NSDictionary *hobbyDict in hobbyArr) {
                
                HobbyListModel *hobbyModel = [[HobbyListModel alloc] init];
            
                [hobbyModel setValuesForKeysWithDictionary:hobbyDict];
                [model.hobbyListArr addObject:hobbyModel];
            }
            
            [model setValuesForKeysWithDictionary:dict];
            [self.dataArr addObject:model];
        }
        [weakSelf.tableView reloadData];
        
        [weakSelf endRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
        NSLog(@"下载失败");
        
    }];
}

#pragma mark - 创建tableView
- (void)createTableView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    

    
    [self.tableView registerNib:[UINib nibWithNibName:@"UserListTableViewCell" bundle:nil] forCellReuseIdentifier:@"UserListTableViewCell"];
}

#pragma mark - 创建AFNetwork
- (void)createAFNetwork {
    self.dataArr = [[NSMutableArray alloc] init];
    self.currentPage = 1;
    self.isRefreshing = NO;
    self.isLoadMore = NO;
    self.manager = [AFHTTPRequestOperationManager manager];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UserListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserListTableViewCell"];
    
    UserModel *model = self.dataArr[indexPath.row];
    
    [cell showDataWithModel:model];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark - 刷新
- (void)createRefreshView {

    __weak typeof(self) weakSelf = self;
    
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.isRefreshing = YES;
        weakSelf.currentPage = 1;
        [weakSelf loadData];
    }];
    
    
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isLoadMore) {
            return ;
        }
        
        weakSelf.isLoadMore = YES;
        
        weakSelf.currentPage ++;
        
        [weakSelf loadData];
    }];
}

- (void)endRefreshing {

    if (self.isRefreshing) {
        
        self.currentPage = 1;
        self.isRefreshing = NO;
        
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultNone];
    }
    
    if (self.isLoadMore) {
        self.isLoadMore = NO;
        [self.tableView footerEndRefreshing];
    }
    
}


#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}


@end
