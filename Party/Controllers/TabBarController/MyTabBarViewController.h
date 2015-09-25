//
//  MyTabBarViewController.h
//  Party
//
//  Created by qianfeng on 15/9/21.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarViewController : UITabBarController

@property(strong,nonatomic) UIView *tabbarView;//自定义个底部的tabbar视图
@property (nonatomic, strong) UIView *centerView;

@end
