//
//  GZLTabBarView.h
//  Party
//
//  Created by qianfeng on 15/9/19.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//


#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#import <UIKit/UIKit.h>
#import "GZLTabBarButton.h"

#define kTabbarHeight 49
//#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue/255.0f alpha:a]
//#define RGB(r,g,b) RGBA(r,g,b,1.0f)


@protocol GZLTabBarViewDelegate <NSObject>
@required
- (void)changeNav:(NSInteger)from to:(NSInteger)to;
@end


@interface GZLTabBarView : UIView


@property (nonatomic, weak) id<GZLTabBarViewDelegate>delegate;


@end
