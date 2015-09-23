//
//  UserListTableViewCell.h
//  Party
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
@interface UserListTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *userImage;



@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@property (weak, nonatomic) IBOutlet UIButton *userAge;


@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


- (void)showDataWithModel:(UserModel *)model;


@end
