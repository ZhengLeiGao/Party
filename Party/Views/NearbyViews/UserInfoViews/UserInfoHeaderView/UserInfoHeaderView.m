//
//  UserInfoHeaderView.m
//  Party
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "UserInfoHeaderView.h"

@interface UserInfoHeaderView()

@property UIImageView *backGroundImageView;
@property UIImageView *userImageView;
@property UIButton *addFriendButton;
@end


@implementation UserInfoHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        [self createViews];
    }
    return self;
}

- (void)createViews {

    self.backGroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.backGroundImageView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.backGroundImageView];
    
    self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    self.userImageView.center = self.backGroundImageView.center;
    self.userImageView.backgroundColor = [UIColor redColor];
    self.userImageView.layer.cornerRadius = 40;
    self.userImageView.layer.masksToBounds = YES;
    [self.backGroundImageView addSubview:self.userImageView];
    
    self.addFriendButton = [[UIButton alloc]init];
    [self.addFriendButton setFrame:CGRectMake(0, 0, 80, 25)];
    self.addFriendButton.center = CGPointMake(self.userImageView.center.x, self.userImageView.center.y + 80);
    [self.addFriendButton setTitle:@"+加好友" forState:UIControlStateNormal];
    self.addFriendButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    self.addFriendButton.backgroundColor = [UIColor blueColor];
    self.addFriendButton.layer.cornerRadius = 12.5;
    self.addFriendButton.layer.masksToBounds = YES;
    [self addSubview:self.addFriendButton];
    
    

}


@end
