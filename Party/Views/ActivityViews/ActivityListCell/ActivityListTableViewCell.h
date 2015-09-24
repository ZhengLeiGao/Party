//
//  ActivityListTableViewCell.h
//  Party
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
@interface ActivityListTableViewCell : UITableViewCell




@property (weak, nonatomic) IBOutlet UIImageView *actImageView;

@property (weak, nonatomic) IBOutlet UILabel *actTitle;

@property (weak, nonatomic) IBOutlet UILabel *actTime;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UIButton *userSexAndAge;
@property (weak, nonatomic) IBOutlet UILabel *publishTime;


@property (nonatomic, strong) UIView *collectionView;
@property (nonatomic, strong) UIButton *collectButton;
@property (nonatomic, strong) UILabel *countLabel;

@property (nonatomic, strong) UIView *applyCountView;
@property (nonatomic, strong) UILabel *appliedCountLabel;



@property (nonatomic, strong) UIView *shareView;



- (void)showDataWithModel:(ActivityModel *)model;


@end
