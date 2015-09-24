//
//  SettingButton.m
//  Party
//
//  Created by qianfeng on 15/9/24.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "SettingButton.h"
#define kImageRatio 0.8
@implementation SettingButton

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
}


- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
}


#pragma mark 返回按钮内部titlelabel的边框
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, contentRect.size.height * kImageRatio, contentRect.size.width, contentRect.size.height - contentRect.size.height * kImageRatio);
    
}

#pragma mark 返回按钮内部UIImage的边框
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height * kImageRatio);
}

@end
