//
//  DetailManager.h
//  CarsHome
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 杜佳奇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMPageController.h"

@interface DetailManager : NSObject

+(instancetype)sharedInstance;

-(WMPageController *)addDetailWithControllersArray:(NSArray *)viewControllers titles:(NSArray *)titles;

@end
