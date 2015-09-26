//
//  UserInfoHeaderView.m
//  Party
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "UserInfoHeaderView.h"

@implementation UserInfoHeaderView

- (instancetype)init {

    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoHeaderView" owner:nil options:nil] firstObject];
    }
    return self;
    
}




@end
