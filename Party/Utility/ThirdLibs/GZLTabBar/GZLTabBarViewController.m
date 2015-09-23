//
//  GZLTabBarViewController.m
//  Party
//
//  Created by qianfeng on 15/9/19.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#define kContentFrame CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kTabbarHeight)
#define  kDockFrame CGRectMake(0, self.view.frame.size.height - kTabbarHeight, self.view.frame.size.width, kTabbarHeight)

#define kCenterViewWidth 49
#define kCenterViewHeight 61
#define kCenterBtnWidth kCenterViewWidth
#define kCenterBtnHeight 50

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "GZLTabBarViewController.h"
#import "GZLTabBarView.h"
@interface GZLTabBarViewController () <UINavigationControllerDelegate,GZLTabBarViewDelegate> {

    BOOL _isExpand;
}

@property (nonatomic, strong) UIViewController *centerViewController;


@end

@implementation GZLTabBarViewController


- (instancetype)init {

    self = [super init];
    if (self) {
        for (UINavigationController *navVC in self.viewControllers) {
            navVC.delegate = self;
        }
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
        for (UINavigationController *navVC in self.viewControllers) {
            navVC.delegate = self;
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.hidden = YES;
    
    GZLTabBarView *gzlTabBarView = [[GZLTabBarView alloc] initWithFrame:self.tabBar.bounds];
    
    gzlTabBarView.delegate = self;
    
    CGRect frame = gzlTabBarView.frame;
    
    gzlTabBarView.frame = CGRectMake(0, self.view.frame.size.height - kTabbarHeight, frame.size.width, kTabbarHeight);
    
    self.myTabBarView = gzlTabBarView;
    
    gzlTabBarView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    
    gzlTabBarView.tintColor = [UIColor redColor];
    
    [self.view addSubview:gzlTabBarView];
    
    _centerView = [[UIView alloc] init];
    
    _centerView.center = CGPointMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT-(kCenterViewHeight*0.5));
    
    _centerView.bounds = CGRectMake(0, 0, kCenterViewHeight, kCenterViewHeight);
//    _centerView.backgroundColor = [UIColor purpleColor];
    
    _centerBtn = [[UIButton alloc] init];
    [_centerBtn setBackgroundImage:[UIImage imageNamed: @"icon-top.png"] forState:UIControlStateNormal];
    
    [_centerBtn setBackgroundImage:[UIImage imageNamed: @"icon-topSel"] forState:UIControlStateHighlighted];
    
    _centerBtn.frame = CGRectMake(0, 0, kCenterBtnWidth, kCenterBtnHeight);
    
    _centerBtn.tag = 2;
    
    [_centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_centerView addSubview:_centerBtn];
    
    [self.view addSubview:_centerView];
    
}

- (void)centerBtnClick:(UIButton *)button {

    self.selectedIndex = button.tag;
//

/*
    
    
    
    _centerBtn.selected = YES;
 
    _centerViewController = [[UIViewController alloc] init];
//    _bigView = [[UIView alloc] initWithFrame:self.view.bounds];
    
    _centerViewController.view.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    
    for (int i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i*60+(i+1)*(30), SCREEN_HEIGHT, 60, 60)];
        view.layer.cornerRadius = 30;
        view.tag = 100 + i;
        view.backgroundColor = [UIColor redColor];
        [_centerViewController.view addSubview:view];
    }
    
    _centerView = [[UIView alloc] init];
    
    _centerView.center = CGPointMake(SCREEN_WIDTH*0.5 + 6, SCREEN_HEIGHT-(kCenterViewHeight*0.5));
    
    _centerView.bounds = CGRectMake(0, 0, kCenterViewHeight, kCenterViewHeight);
    //    _centerView.backgroundColor = [UIColor purpleColor];
    
    _centerBtn = [[UIButton alloc] init];
    [_centerBtn setBackgroundImage:[UIImage imageNamed: @"icon-topSel"] forState:UIControlStateNormal];
    
//    [_centerBtn setBackgroundImage:[UIImage imageNamed: @"icon-topSel"] forState:UIControlStateHighlighted];
//    
    _centerBtn.frame = CGRectMake(0, 0, kCenterBtnWidth, kCenterBtnHeight);
    
//    _centerBtn.tag = 2;
    
    [_centerBtn addTarget:self action:@selector(centerClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_centerView addSubview:_centerBtn];
    
    [_centerViewController.view addSubview:_centerView];

    [self presentViewController:_centerViewController animated:YES completion:nil];
    

    
    for (int i = 0; i < 4; i++) {
        UIView *view = [self.view viewWithTag:100+i];
        CGPoint center = view.center;
        //第一个参数 动画的持续时间
        //2   延迟多久执行动画
        //3  阻尼系数  0--1
        //4  每个view 的动画开始的初始的速度
        [UIView animateWithDuration:0.5 delay:i*0.05 usingSpringWithDamping:0.5 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
#define Open 0
#if Open
            CGPoint newCenter = CGPointMake(center.x, center.y-300);
            view.center = newCenter;
#else
            //放射变换 修改位置  水平或者竖直方向位置
            view.transform = CGAffineTransformMakeTranslation(0, -300);
#endif
            
        } completion:^(BOOL finished) {
            
        }];
    }
  
 
 
 */
 
}


- (void)centerClick:(UIButton *)button {

    _centerBtn.selected = NO;
    
    [_centerViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)changeNav:(NSInteger)from to:(NSInteger)to {

    self.selectedIndex = to;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {

    
    UIViewController *root = navigationController.viewControllers.firstObject;
    
    NSLog(@"%@",root);
    
    if (viewController != root) {
        
        navigationController.view.frame = self.view.bounds;
        
        [_myTabBarView removeFromSuperview];
        
        [_centerView removeFromSuperview];
        
        CGRect dockFrame = _myTabBarView.frame;
        
        CGRect centerViewFrame = _centerView.frame;
        
        if ([root.view isKindOfClass:[UIScrollView class]]) {
            
            UIScrollView *scrollView = (UIScrollView *)root.view;
            dockFrame.origin.y = scrollView.contentOffset.y + root.view.frame.size.height - kTabbarHeight;
            centerViewFrame.origin.y = scrollView.contentOffset.y + root.view.frame.size.height - kTabbarHeight - (kCenterViewHeight - kCenterViewWidth);
            
        } else {
            
            centerViewFrame.origin.y = root.view.frame.size.height - kCenterViewHeight;
            dockFrame.origin.y = root.view.frame.size.height - kTabbarHeight;
        }
        
        _myTabBarView.frame = dockFrame;
        
        _centerView.frame = centerViewFrame;
        
        [root.view addSubview:_myTabBarView];
        [root.view addSubview:_centerView];
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {

    UIViewController *root = navigationController.viewControllers[0];
    if (viewController == root) {
        
        navigationController.view.frame = kContentFrame;
        
        [_myTabBarView removeFromSuperview];
        [_centerView removeFromSuperview];
        
        _myTabBarView.frame = kDockFrame;
        [self.view addSubview:_myTabBarView];
        
        _centerView.center = CGPointMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT - (kCenterViewHeight*0.5));
        _centerView.bounds = CGRectMake(0, 0, kCenterViewWidth, kCenterViewHeight);
        [self.view addSubview:_centerView];
    }
}







#pragma mark - didReceiveMemoryWarning
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
