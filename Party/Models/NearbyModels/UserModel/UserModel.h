//
//  UserModel.h
//  Party
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSNumber *age;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *sign;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *time;

@property (nonatomic, strong) NSMutableArray *hobbyListArr;






/*
 "uid": "200494",
 "uname": "amanda",
 "sex": "0",
 "age": 24,
 "avatar": "http://7xawow.com2.z0.glb.qiniucdn.com/w0209.jpg",
 "sign": "Love is low to the dust alone Watch",
 "distance": "372.49km",
 "time": "1周前",
 "hobby_list": []
 */


@end
