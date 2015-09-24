//
//  DetailManager.m
//  CarsHome
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 杜佳奇. All rights reserved.
//

#import "DetailManager.h"

@implementation DetailManager
+(instancetype)sharedInstance{

    static DetailManager *titleManager=nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        
        titleManager = [[DetailManager alloc]init];
    });

    return titleManager;
}
-(WMPageController *)addDetailWithControllersArray:(NSArray *)viewControllers titles:(NSArray *)titles{

    NSMutableArray *array=[[NSMutableArray alloc]init];
    for (NSInteger i=0; i<viewControllers.count; i++) {
        Class vcClass=NSClassFromString(viewControllers[i]);
        [array addObject:vcClass];
    }
    WMPageController *pageVC=[[WMPageController alloc] initWithViewControllerClasses:array andTheirTitles:titles];
    
    pageVC.menuViewStyle=WMMenuViewStyleFooldHollow;
    pageVC.pageAnimatable = YES;
    pageVC.menuItemWidth = 75;
    pageVC.titleSizeSelected = 15;
    return pageVC;
}
@end
