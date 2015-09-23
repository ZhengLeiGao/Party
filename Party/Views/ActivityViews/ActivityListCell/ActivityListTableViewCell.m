//
//  ActivityListTableViewCell.m
//  Party
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "ActivityListTableViewCell.h"

#import "ActivityPhotosModel.h"

@implementation ActivityListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


- (void)showDataWithModel:(ActivityModel *)model {
    
    [self.actImageView sd_setImageWithURL:[NSURL URLWithString:[[model.photosArr firstObject] cpic]] placeholderImage:nil];
    
    
    

    self.userImageView.layer.cornerRadius = 20;
    
    self.userImageView.layer.masksToBounds = YES;
    
    
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:nil];
    
    self.userName.text = model.uname;
    
    self.publishTime.text = [NSString stringWithFormat:@"%@ 创建",model.cTime];
    
    self.actTitle.text = model.f_name;
    
    self.actTime.text = [NSString stringWithFormat:@"%@ -- %@",model.s_time,model.e_time];
    
}







@end
