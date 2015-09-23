//
//  ActivityPhotosModel.h
//  Party
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "BaseModel.h"

@interface ActivityPhotosModel : BaseModel

@property (nonatomic, copy) NSString *cpic;
@property (nonatomic, copy) NSString *is_cover;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *power;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, copy) NSString *uid;


@end
