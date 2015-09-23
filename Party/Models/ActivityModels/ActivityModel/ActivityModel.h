//
//  ActivityModel.h
//  Party
//
//  Created by qianfeng on 15/9/23.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "BaseModel.h"

@interface ActivityModel : BaseModel

@property (nonatomic, copy) NSString *activity_id;
@property (nonatomic, copy) NSString *f_name;
@property (nonatomic, copy) NSString *s_name;
@property (nonatomic, copy) NSString *Intro;
@property (nonatomic, copy) NSString *s_time;
@property (nonatomic, copy) NSString *e_time;
@property (nonatomic, copy) NSString *cTime;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *host;
@property (nonatomic, copy) NSString *now_price;
@property (nonatomic, copy) NSString *residue_day;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, strong) NSMutableArray *photosArr;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSNumber *age;
@property (nonatomic, copy) NSNumber *collect_count;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *share_title;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSNumber *apply_count;
@property (nonatomic, copy) NSString *share_count;
@property (nonatomic, copy) NSString *commentCount;
@property (nonatomic, copy) NSNumber *score_average;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *cpic;
@property (nonatomic, copy) NSString *is_apply;
@property (nonatomic, copy) NSString *is_collect;
@property (nonatomic, copy) NSString *is_agree;
@property (nonatomic, copy) NSString *is_free;
@end
