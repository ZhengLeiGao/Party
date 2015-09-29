//
//  UserInfoHeaderCenterView.m
//  Party
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "UserInfoHeaderCenterView.h"

@implementation UserInfoHeaderCenterView


- (instancetype)init {

    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoHeaderCenterView" owner:nil options:nil] lastObject];
    }
    
    return self;
}




@end
