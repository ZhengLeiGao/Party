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
#import "UserInfoModel.h"
#import "UserInfoSecOneTableViewCell.h"
#import "UserInfoSecTwoTableViewCell.h"

@interface UserInfoViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UserInfoHeaderView *headerView;


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

- (id)initWithUId:(NSString *)uid userName:(NSString *)userName {
    self = [super init];
    if (self) {
        self.uid = [uid copy];
        self.userName = [userName copy];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.userName;
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor grayColor];
    [self getNetData];
    
    
    [self createTableView];
    
    [self createFootterView];
    
}

- (void)getNetData {
    
    self.dataArr = [[NSMutableArray alloc] init];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSDictionary *dict = @{@"mod":@"User",@"login_uid":@"0",@"latitude":@(34.778620),@"longitude":@(113.682316),@"act":@"getinfro",@"uid":self.uid};
    
    [manager POST:nearPersonInfoURL parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        id jsonData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *data = [jsonData objectForKey:@"data"];
        
        UserInfoModel *model = [[UserInfoModel alloc] init];
        
        [model setValuesForKeysWithDictionary:data];
    
        [self.dataArr addObject:model];
    
        [self.headerView showInfoWithModel:model];
        
        [self.tableView reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}



- (void)createTableView {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;
    
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

    if (self.dataArr.count == 0) {
        return 0;
    }
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 3;
    } else {
        return 8;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        UserInfoSecOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoSecOneTableViewCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoSecOneTableViewCell" owner:nil options:nil] lastObject];
            if (indexPath.row == 0) {
                UserInfoModel *model = self.dataArr[0];
                cell.cellImageView.image = [UIImage imageNamed: @"herComment"];
                cell.cellTitleLabel.text = @"TA的说说";
                cell.countLabel.text = model.commentCount;
            }
            
            if (indexPath.row == 1) {
                UserInfoModel *model = self.dataArr[0];
                cell.cellImageView.image = [UIImage imageNamed: @"herActivity"];
                cell.cellTitleLabel.text = @"TA的活动";
                cell.countLabel.text = model.apply_count;
            }
            if (indexPath.row == 2) {
                UserInfoModel *model = self.dataArr[0];
                cell.cellImageView.image = [UIImage imageNamed: @"herGroup"];
                cell.cellTitleLabel.text = @"TA的群组";
                cell.countLabel.text = model.commentCount;
            }
        }
        
        return cell;
    } else {
    
        UserInfoSecTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoSecTwoTableViewCell"];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoSecTwoTableViewCell" owner:nil options:nil] lastObject];
            
            if (indexPath.row == 0) {
                UserInfoModel *model = self.dataArr[0];
                cell.titleLabel.text = @"个人签名";
                cell.contentLabel.text = model.sign;
            }
            if (indexPath.row == 1) {
                UserInfoModel *model = self.dataArr[0];
                cell.titleLabel.text = @"情感状态";
                cell.contentLabel.text = model.affective_state;
            }
            if (indexPath.row == 2) {
                UserInfoModel *model = self.dataArr[0];
                cell.titleLabel.text = @"公司";
                cell.contentLabel.text = model.company;
            }
            if (indexPath.row == 3) {
                UserInfoModel *model = self.dataArr[0];
                cell.titleLabel.text = @"学校";
                cell.contentLabel.text = model.school;
            }
            if (indexPath.row == 4) {
                UserInfoModel *model = self.dataArr[0];
                cell.titleLabel.text = @"家乡";
                cell.contentLabel.text = model.home;
            }
            if (indexPath.row == 5) {
                UserInfoModel *model = self.dataArr[0];
                cell.titleLabel.text = @"兴趣爱好";
                cell.contentLabel.text = model.hobbay;
            }
            if (indexPath.row == 6) {
                UserInfoModel *model = self.dataArr[0];
                cell.titleLabel.text = @"常出没地";
                cell.contentLabel.text = model.place;
            }
            if (indexPath.row == 7) {
                UserInfoModel *model = self.dataArr[0];
                cell.titleLabel.text = @"个人说明";
                cell.contentLabel.text = model.user_intro;
            }
            
        }
        
         return cell;
    }
    
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
