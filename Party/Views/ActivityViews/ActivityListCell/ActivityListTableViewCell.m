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
    
    [self createViews];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


- (void)createViews {

    self.collectionView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.origin.y + self.frame.size.height - 10 - 35, [UIScreen mainScreen].bounds.size.width/3, 35)];

    
    self.collectButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 7, 50, 20)];
    [self.collectButton setImage:[UIImage imageNamed: @"collecteAct"] forState:UIControlStateNormal];
    [self.collectButton setTitle:@" 收藏" forState:UIControlStateNormal];
    self.collectButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    self.collectButton.backgroundColor = [UIColor grayColor];
    [self.collectionView addSubview:self.collectButton];
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.collectionView.frame.size.width - 20, 7, 20, 20)];
    self.countLabel.font = [UIFont systemFontOfSize:12.f];
    self.countLabel.text = @"6";
    self.countLabel.textAlignment = NSTextAlignmentCenter;
    [self.collectionView addSubview:self.countLabel];
    
    [self addSubview:self.collectionView];
    
    
    self.applyCountView = [[UIView alloc] initWithFrame:CGRectMake(self.collectionView.frame.origin.x + self.collectionView.frame.size.width, self.frame.origin.y + self.frame.size.height - 10 - 35, [UIScreen mainScreen].bounds.size.width/3, 35)];
    self.applyCountView.backgroundColor = [UIColor grayColor];
    
    
    
    
    UIButton *appliedButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 7, 50, 20)];
    [appliedButton setImage:[UIImage imageNamed: @"jionAct"] forState:UIControlStateNormal];
    [appliedButton setTitle:@" 已报" forState:UIControlStateNormal];
    appliedButton.titleLabel.font = [UIFont systemFontOfSize:12.f];

    [self.applyCountView addSubview:appliedButton];
    
    self.appliedCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.applyCountView.frame.size.width - 20, 7, 20, 20)];
    self.appliedCountLabel.font = [UIFont systemFontOfSize:12.f];
    self.appliedCountLabel.text = @"6";
    self.appliedCountLabel.textAlignment = NSTextAlignmentCenter;
    [self.applyCountView addSubview:self.appliedCountLabel];
    
    [self addSubview:self.applyCountView];
    
    
    self.shareView = [[UIView alloc] initWithFrame:CGRectMake(self.applyCountView.frame.origin.x + self.applyCountView.frame.size.width, self.frame.origin.y + self.frame.size.height - 10 - 35, [UIScreen mainScreen].bounds.size.width/3, 35)];
    self.shareView.backgroundColor = [UIColor darkGrayColor];
    
    
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 7, 50, 20)];
    [shareButton setImage:[UIImage imageNamed: @"share"] forState:UIControlStateNormal];
    [shareButton setTitle:@" 分享" forState:UIControlStateNormal];
    shareButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    
    [self.shareView addSubview:shareButton];
    
    
    [self addSubview:self.shareView];
    
    UIView *separateView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.origin.y + self.frame.size.height - 10, [UIScreen mainScreen].bounds.size.width, 10)];
    separateView.backgroundColor = [UIColor blackColor];
    
    [self addSubview:separateView];
    
    
    
    
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
