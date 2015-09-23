//
//  MyTabBarViewController.m
//  Party
//
//  Created by qianfeng on 15/9/21.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "NearbyViewController.h"
#import "ActivityViewController.h"
#import "LaunchActivityViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "GZLTabBarButton.h"


#define kContentFrame CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kTabbarHeight)
#define  kDockFrame CGRectMake(0, self.view.frame.size.height - kTabbarHeight, self.view.frame.size.width, kTabbarHeight)

#define kCenterViewWidth 49
#define kCenterViewHeight 60
#define kCenterBtnWidth 44
#define kCenterBtnHeight 44

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)



@interface MyTabBarViewController ()

@property(strong,nonatomic) UIView *tabbarView;//自定义个底部的tabbar视图
@property(strong,nonatomic)UIView * popView;//点击"+"号弹出的视图,高斯模糊效果

@property (nonatomic, strong) UIView *centerView;

@property (nonatomic, strong) UIButton *centerBtn;

@property (nonatomic, assign) NSInteger selBtnTag;

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configTabbarView];
    
    
    [self configPopView];
    
    [self createViewControllers];
    

    
    
    
}

#pragma mark - 创建子视图控制器
- (void)createViewControllers {
    
    NSMutableArray *vcArr = [[NSMutableArray alloc] init];
    
    NearbyViewController *nearVC = [[NearbyViewController alloc] init];
    UINavigationController *nearNav = [[UINavigationController alloc] initWithRootViewController:nearVC];
    [vcArr addObject:nearNav];
    
    ActivityViewController *actVC = [[ActivityViewController alloc] init];
    UINavigationController *actNav = [[UINavigationController alloc] initWithRootViewController:actVC];
    [vcArr addObject:actNav];
    
//    LaunchActivityViewController *lauActVC = [[LaunchActivityViewController alloc] init];
//    lauActVC.tabBarItem.image = [UIImage imageNamed: @"icon-top"];
//    [vcArr addObject:lauActVC];

    MessageViewController *mesVC = [[MessageViewController alloc] init];
    UINavigationController *mesNav = [[UINavigationController alloc] initWithRootViewController:mesVC];
    [vcArr addObject:mesNav];
    
    MineViewController *mineVc = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVc];
    [vcArr addObject:mineNav];
    self.viewControllers = vcArr;
}





#pragma mark - 点击弹出的视图上的关闭按钮
-(void)tapX
{
    //1.移除当前遮盖视图
    [self.popView removeFromSuperview];
    
}

#pragma mark - 点击自定义的那个tabbar视图上的按钮
-(void)tapButton:(UIButton *)button
{
    
    if (button.tag == 12)//点击加号按钮
    {
        
        [UIView animateWithDuration:5 animations:^{
            [self.view addSubview:self.popView];//可以自定义一些控件加上动画的效果
        }];
        
        
    }
    
    else if(button.tag >= 13) //因为有5个按钮,现在只有4个ViewController,selectedIndex会向前移动一个
    {
        UIButton *preButton = (UIButton *)[self.tabbarView viewWithTag:self.selBtnTag];
        preButton.selected = NO;
        button.selected = YES;
        self.selBtnTag = button.tag;
        
        [self setSelectedIndex:button.tag - 11];
    }
    
    else {
        
        UIButton *preButton = (UIButton *)[self.tabbarView viewWithTag:self.selBtnTag];
        button.selected = YES;
        preButton.selected = NO;
        self.selBtnTag = button.tag;
        
        [self setSelectedIndex:button.tag - 10]; //给tabbar设置选中的ViewController
    
    }
    
}

#pragma mark - 配置tabbarView
- (void)configTabbarView
{
    NSArray *titlesArr = @[@"附近",@"活动",@"",@"消息",@"我"];
    
    self.tabBar.hidden=YES;//隐藏掉系统的bar
    UIScreen *s=[UIScreen mainScreen];
    CGFloat wid=[s bounds].size.width;
    CGFloat height=[s bounds].size.height;
    
    self.tabbarView=[[UIView alloc]initWithFrame:CGRectMake(0, height-49, wid, 49)];
    self.tabbarView.backgroundColor=[UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    [self.view addSubview:self.tabbarView];//自定的tabbar
    for (int i=0; i<5; i++)  //自定义的贴上按钮5个
    {
        if (i == 2) {
            continue;
        }
        
        GZLTabBarButton *button=[GZLTabBarButton  buttonWithType:UIButtonTypeCustom];
        
//        UIButton *button = [[UIButton alloc] init];
        
        button.frame=CGRectMake(i*wid/5.0, 0, wid/5.0, 48);

        NSString *imageName = [NSString stringWithFormat:@"TabBar%d",i + 1];
        NSString *selImageName = [NSString stringWithFormat:@"TabBar%dSel",i + 1];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
//        [button setImage:[[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
        
        button.imageView.contentMode = UIViewContentModeCenter;
        [button setTitle:titlesArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:11.0];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
        
        button.tag= 10 + i;//这里是不是  tag  不能等于0    //自求多福…………………………………………………………
        [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchDown];
        [self.tabbarView addSubview:button];
        
        
    }
    
    self.selBtnTag = 10;
    
    UIButton *firstButton = (UIButton *)[self.tabbarView viewWithTag:10];
    firstButton.selected = YES;
    
    [self.view addSubview:self.tabbarView];
    
    
    _centerView = [[UIView alloc] init];
    
    _centerView.center = CGPointMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT-(kCenterViewHeight*0.5));
    
    _centerView.bounds = CGRectMake(0, 0, kCenterViewHeight, kCenterViewHeight);
//    _centerView.backgroundColor = [UIColor purpleColor];
    
    _centerBtn = [[UIButton alloc] init];
    [_centerBtn setBackgroundImage:[UIImage imageNamed: @"icon-top.png"] forState:UIControlStateNormal];
    
    [_centerBtn setBackgroundImage:[UIImage imageNamed: @"icon-topSel"] forState:UIControlStateHighlighted];
    
    _centerBtn.frame = CGRectMake(9, 0, kCenterBtnWidth, kCenterBtnHeight);
    
    _centerBtn.tag = 12;
    
    [_centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _centerBtn.contentMode = UIViewContentModeBottom;
    
    [_centerView addSubview:_centerBtn];
    
    [self.view addSubview:_centerView];

    //你这是 自定义的？
}

- (void)centerBtnClick:(UIButton *)button {

    [UIView animateWithDuration:5 animations:^{
        [self.view addSubview:self.popView];//可以自定义一些控件加上动画的效果
    }];
    
}


#pragma mark - 初始化弹出的视图
- (void)configPopView
{
    UIScreen *s=[UIScreen mainScreen];
    CGFloat wid=[s bounds].size.width;
    CGFloat height=[s bounds].size.height;
    //点击中间的按钮弹出一个视图,是自定义的
    self.popView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, wid, height)];
    
    self.popView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    
//    self.popView.backgroundColor = [UIColor grayColor];
//    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
//    [label setText:@"弹出视图!"];
//    [label setTextColor:[UIColor blackColor]];
//    [self.popView addSubview:label];
    //底部的关闭按钮
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(_centerView.frame.origin.x,_centerView.frame.origin.y, _centerView.frame.size.width, _centerView.frame.size.height)];
//
    
    UIView *view = [[UIView alloc] initWithFrame:_centerView.frame];
    
    [self.popView addSubview:view];
    
//    GZLTabBarButton *button = [[GZLTabBarButton alloc] init];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(6, 0, kCenterBtnWidth, kCenterBtnHeight);
    button.frame = _centerBtn.frame;
    
    [button setImage:[UIImage imageNamed: @"icon-topSel"] forState:UIControlStateNormal];
//    button.backgroundColor=[UIColor lightGrayColor];
    
    [view addSubview:button];
    [button addTarget:self action:@selector(tapX) forControlEvents:UIControlEventTouchUpInside];
//    [self.popView addSubview:button];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
