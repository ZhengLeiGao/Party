//
//  UserListTableViewCell.m
//  Party
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "UserListTableViewCell.h"



@implementation UserListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)showDataWithModel:(UserModel *)model {

    self.userImage.layer.cornerRadius = 30;
    self.userImage.layer.masksToBounds= YES;
    [self.userImage sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed: @"userImage"]];
    
    self.nameLabel.text = model.uname;
    
    self.userAge.titleLabel.text = [NSString stringWithFormat:@"%@",[model.age stringValue]];
    self.userAge.userInteractionEnabled = NO;
    self.userAge.layer.cornerRadius = 5;
    self.userAge.layer.masksToBounds = YES;
    self.userAge.titleLabel.font = [UIFont systemFontOfSize:10.f];
    self.userAge.titleLabel.textAlignment = NSTextAlignmentRight;
    if ([model.sex isEqualToString:@"0"]) {
        self.userAge.backgroundColor = [UIColor colorWithRed:0.77 green:0.36 blue:0.36 alpha:1.0];
        self.userAge.imageView.image = [UIImage imageNamed: @"girl"];
    } else {
         self.userAge.backgroundColor = [UIColor colorWithRed:0.21 green:0.42 blue:0.79 alpha:1.0];
        self.userAge.imageView.image = [UIImage imageNamed: @"boy"];
    }
    
    self.timeLabel.text = [NSString stringWithFormat:@"%@|%@",model.distance,model.time];
    self.contentLabel.text = model.sign;

    if (model.hobbyListArr.count != 0) {
        for (int i = 0; i < model.hobbyListArr.count; i ++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 30 - i*20, self.timeLabel.frame.origin.y + self.timeLabel.frame.size.height, 18, 18)];
            button.titleLabel.font = [UIFont systemFontOfSize:12.f];
            button.layer.cornerRadius = 3;
            button.layer.masksToBounds = YES;
            
            [self addSubview:button];
            if ([[model.hobbyListArr[i] name] isEqualToString:@"聚"]) {
                button.backgroundColor = [UIColor colorWithRed:1.00 green:0.33 blue:0.85 alpha:1.0];
                [button setTitle:@"聚" forState:UIControlStateNormal];
            }
            
            if ([[model.hobbyListArr[i] name]isEqualToString:@"益"]) {
                button.backgroundColor = [UIColor colorWithRed:0.49 green:0.73 blue:0.24 alpha:1.0];
                [button setTitle:@"益" forState:UIControlStateNormal];
            }
            
            if ([[model.hobbyListArr[i] name]isEqualToString:@"旅"]) {
                button.backgroundColor = [UIColor colorWithRed:1.00 green:0.42 blue:0.01 alpha:1.0];
                [button setTitle:@"旅" forState:UIControlStateNormal];
            }
            if ([[model.hobbyListArr[i] name]isEqualToString:@"讲"]) {
                button.backgroundColor = [UIColor colorWithRed:0.38 green:0.14 blue:0.61 alpha:1.0];
                [button setTitle:@"讲" forState:UIControlStateNormal];
            }
            if ([[model.hobbyListArr[i] name]isEqualToString:@"亲"]) {
                button.backgroundColor = [UIColor colorWithRed:0.33 green:0.38 blue:0.78 alpha:1.0];
                [button setTitle:@"亲" forState:UIControlStateNormal];
            }
            
            if ([[model.hobbyListArr[i] name]isEqualToString:@"互"]) {
                button.backgroundColor = [UIColor colorWithRed:0.29 green:0.37 blue:0.65 alpha:1.0];
                [button setTitle:@"互" forState:UIControlStateNormal];
            }
        }
    }
}








@end
