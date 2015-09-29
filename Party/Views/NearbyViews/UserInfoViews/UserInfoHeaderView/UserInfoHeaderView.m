//
//  UserInfoHeaderView.m
//  Party
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "UserInfoHeaderView.h"

#import "UserInfoHeaderCenterView.h"


@interface UserInfoHeaderView()

@property (nonatomic, strong) UIImageView *backGroundImageView;
@property (nonatomic, strong) UIImageView *userImageView;
@property (nonatomic, strong) UIButton *addFriendButton;

@property (nonatomic, strong) UIButton *ageAndSexButton;

@property (nonatomic, strong) UIButton *constellationButton;

@property (nonatomic, strong) UIButton *distanceButton;
@property (nonatomic, strong) UIButton *appearTimeButton;

@property (nonatomic, strong) UserInfoHeaderCenterView *centerView;


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
    self.addFriendButton.center = CGPointMake(self.userImageView.center.x, self.userImageView.center.y + 60);
    [self.addFriendButton setTitle:@"+加好友" forState:UIControlStateNormal];
    self.addFriendButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    self.addFriendButton.backgroundColor = [UIColor blueColor];
    self.addFriendButton.layer.cornerRadius = 12.5;
    self.addFriendButton.layer.masksToBounds = YES;
    [self addSubview:self.addFriendButton];
    
    
    self.centerView = [[UserInfoHeaderCenterView alloc] init];
    
    self.centerView.frame = CGRectMake(0, self.addFriendButton.frame.origin.y + self.addFriendButton.frame.size.height + 5, [UIScreen mainScreen].bounds.size.width, 20);
    
    [self addSubview:self.centerView];
    
}


- (void)showInfoWithModel:(UserInfoModel *)model {

    
    [self.backGroundImageView sd_setImageWithURL:[NSURL URLWithString:model.bg_img] placeholderImage:nil];
    
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:nil];
    
    self.centerView.ageLabel.text = [model.age stringValue];
    
    
    if (model.constellation == nil) {
        self.centerView.constellationLabel.text = @" 未知 ";
    } else {
    
        self.centerView.constellationLabel.text = [NSString stringWithFormat:@" %@ ",model.constellation];
    }
    
    self.centerView.distanceLabel.text = model.distance;
    
    self.centerView.appearLabel.text = model.time;
    
    self.centerView.userIdLabel.text = [NSString stringWithFormat:@"用户id:%@",model.uid];
    
    
}




@end
