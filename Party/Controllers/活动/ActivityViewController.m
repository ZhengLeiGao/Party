//
//  ActivityViewController.m
//  Party
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "ActivityViewController.h"
#import "WMPageController.h"
#import "NewestActivityViewController.h"
#import "HottestActivityViewController.h"
#import "FreeActivityViewController.h"
#import "RecommendActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (id)init {

    self = [super init];
    if (self) {
        self = (ActivityViewController *)[self addAllViewControllers];
        self.title = @"活动";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
    [self createNavigationItem];

}

- (void)createNavigationItem {

    
}

- (WMPageController *)addAllViewControllers {
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 4; i ++) {
        Class vcClass;
        NSString *title;
        switch (i) {
            case 0:
                vcClass = [NewestActivityViewController class];
                title = @"最新";
                break;
            case 1:
                vcClass = [HottestActivityViewController class];
                title = @"最热";
                break;
            case 2:
                vcClass = [RecommendActivityViewController class];
                title = @"推荐";
                break;
            case 3:
                vcClass = [FreeActivityViewController class];
                title = @"免费";
                break;
            default:
                break;
        }
        
        [viewControllers addObject:vcClass];
        [titles addObject:title];
    }
    
    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    
    pageVC.menuViewStyle = WMMenuViewStyleFoold;
    pageVC.titleColorSelected = [UIColor purpleColor];
    
    pageVC.progressColor = [UIColor darkGrayColor];
    
    
    pageVC.pageAnimatable = YES;
    pageVC.menuItemWidth = 85;
    pageVC.postNotification = YES;
    return pageVC;
}




#pragma mark - didReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
