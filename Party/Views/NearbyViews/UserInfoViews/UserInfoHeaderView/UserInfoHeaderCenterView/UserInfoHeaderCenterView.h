//
//  UserInfoHeaderCenterView.h
//  Party
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoHeaderCenterView : UIView


@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;


@property (weak, nonatomic) IBOutlet UILabel *constellationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *distanceImageView;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *appearImageView;

@property (weak, nonatomic) IBOutlet UILabel *appearLabel;


@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;


@end
