//
//  UserInfoModel.h
//  Party
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfoModel : BaseModel

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *job;
@property (nonatomic, copy) NSNumber *age;
@property (nonatomic, copy) NSString *r_time;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *commentCount;
@property (nonatomic, copy) NSString *apply_count;
@property (nonatomic, assign) BOOL feed_count;
@property (nonatomic, copy) NSString *hx_uname;
@property (nonatomic, copy) NSString *hx_nickname;
@property (nonatomic, copy) NSString *hx_password;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, copy) NSString *bg_img;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *sign;
@property (nonatomic, copy) NSString *affective_state;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *school;
@property (nonatomic, copy) NSString *home;
@property (nonatomic, copy) NSString *hobbay;
@property (nonatomic, copy) NSString *constellation;
@property (nonatomic, copy) NSString *place;
@property (nonatomic, copy) NSString *user_intro;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *total_score;
@property (nonatomic, copy) NSNumber *level;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSNumber *lv_number;
@property (nonatomic, copy) NSNumber *lv_id;
@property (nonatomic, copy) NSString *lv_name;
@property (nonatomic, copy) NSString *lv_pic;
@property (nonatomic, copy) NSString *count_fensi;
@property (nonatomic, copy) NSString *count_guanzhu;
@property (nonatomic, copy) NSString *count_weibo;
@property (nonatomic, copy) NSString *group_id;
@property (nonatomic, assign) BOOL is_friend;
@property (nonatomic, assign) BOOL is_black;
@property (nonatomic, assign) BOOL is_blacked;








@end
