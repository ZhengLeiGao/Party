//
//  NewestActivityViewController.m
//  Party
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "NewestActivityViewController.h"
#import "ActivityListTableViewCell.h"
#import "ActivityModel.h"
#import "ActivityPhotosModel.h"
#import "JHRefresh.h"

@interface NewestActivityViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) BOOL isRefreshing;
@property (nonatomic) BOOL isLoadMore;



@end

@implementation NewestActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"活动";
    self.view.backgroundColor = [UIColor blueColor];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    [self createNavigationItem];
    [self createTableView];
    [self createRefreshView];
    
    [self createAFNetwork];
    [self loadData];
    
}

- (void)createNavigationItem {
    
    
}

- (void)rightItemClick {
    
    
}

#pragma mark - 第一次下载数据
- (void)loadData {
    //    if (self.currentPage == 1) {
    //        [self.dataArr removeAllObjects];
    //        [self.tableView reloadData];
    //    }
    
    NSDictionary *dict = @{@"act":@"allactivity",@"sort_id":@(2),@"uid":@"0",@"page":@(self.currentPage),@"city_id":@"110100",@"longitude":@(113.682316),@"latitude":@(34.778620),@"mod":@"Activity",@"count":@(20)};
    
    
    __weak typeof(self) weakSelf = self;
    [self.manager POST:ActivityNewURL parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *data = [jsonData objectForKey:@"data"];
        
        if (self.currentPage == 1) {
            [self.dataArr removeAllObjects];
        }
        
        for (NSDictionary *dict in data) {
            ActivityModel *model = [[ActivityModel alloc] init];
            NSArray *photosArr = [dict objectForKey:@"photos"];
            
            model.photosArr= [[NSMutableArray alloc] init];
            for (NSDictionary *photoDict in photosArr) {
                
                ActivityPhotosModel *photoModel = [[ActivityPhotosModel alloc] init];
                [photoModel setValuesForKeysWithDictionary:photoDict];
                
                [model.photosArr addObject:photoModel];
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
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64 - 49 - 30) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerNib:[UINib nibWithNibName:@"ActivityListTableViewCell" bundle:nil] forCellReuseIdentifier:@"ActivityListTableViewCell"];
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
    
    ActivityListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityListTableViewCell"];
    
    
    ActivityModel *model = self.dataArr[indexPath.row];
    
    [cell showDataWithModel:model];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 250.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"fcdf");
    
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
    // Dispose of any resources that can be recreated.
}





@end
