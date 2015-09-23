//
//  NetInterface.h
//  Party
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#ifndef Party_NetInterface_h
#define Party_NetInterface_h

//1.请求注册验证码接口
#define TESTURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
//@{@"mod":@"User",@"act":@"getverify",@"phone":@"18037101703"}

//2.注册接口
#define VerificationCodeURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
//@{@"act":@"setpassword"，@"uid":@"236257",@"rpassword":	@"e10adc3949ba59abbe56e057f20f883e",@"password":	@"e10adc3949ba59abbe56e057f20f883e",@"verify":@"4467",@"invitecode":@"",@"mod":@"User"}

//3.附近页面接口
#define NearURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
  //@{@"act":@"location_pact",@"uid":@"0",@"time_range":@"",@"page":@(1),@"count":@(20),@"constellation":@"",@"longitude":@(113.682316),@"age_range":@"20-25",@"sex":@(1),@"latitude":@(34.778620),@"mod":@"User"}

//4.当前城市接口
#define currentCityURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
 // @{@"mod":@"Activity",@"act":@"get_cityid",@"city_name":@"郑州市"}

//5.附近人信息接口
#define nearPersonInfoURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
  //@{@"mod":@"User",@"login_uid":@"0",@"latitude":@(34.778620),@"longitude":@(113.682316),@"act":@"getinfro",@"uid":@"235893"}

//6.活动_最新 接口
#define ActivityNewURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
  //@{@"act":@"allactivity",@"sort_id":@(2),@"uid":@"0",@"page":@(1),@"city_id":@"110100",@"longitude":@(113.682316),@"latitude":@(34.778620),@"mod":@"Activity",@"count":@(20)}

//7.活动详情 接口
#define ActivityInfoDetailURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
 // @{@"mod":@"Activity",@"longitude":@(113.682316),@"uid":@"0",@"latitude":@(34.778620),@"act":@"activitydetail",@"activity_id":@"59192"}

//8.活动_最热 接口
#define ActivityHotURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
  //@{@"act":@"allactivity",@"sort_id":@(2),@"uid":@"0",@"page":@(1),@"city_id":@"110100",@"longitude":@(113.682316),@"latitude":@(34.778620),@"mod":@"Activity",@"count":@(20)}

//9.活动_推荐 接口
#define ActivityRecommendURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
  //@{@"act":@"allactivity",@"uid":@"0",@"is_recommend":@(1),@"page":@(1),@"city_id":@"110100",@"longitude":@(113.682316),@"latitude":@(34.778620),@"mod":@"Activity",@"count":@(20)}

//10.活动_免费 接口
#define ActivityFreeURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
  //@{@"act":@"allactivity",@"uid":@"0",@"page":@(1),@"city_id":@"110100",@"longitude":@(113.682316),@"latitude":@(34.778620),@"mod":@"Activity",@"is_free":@(1),@"count":@(20)}


//11.发现活动 接口
#define DiscoverActivityURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
 // @{@"city_id":@"110100",@"uid":@"0",@"act":@"cityinfro",@"mod":@"Activity"}

//12.搜索活动 接口
#define SearchActivityURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
  //@{@"act":@"allactivity",@"uid":@"0",@"page":@(1),@"time_id":@(0),@"city_id":@"110100",@"longitude":@(113.682316),@"type_id":@(11),@"mod":@"Activity",@"count":@(20),@"latitude":@(34.778620)}

//13.用户登录 接口
#define UserLoginURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
//参数
  //@{@"password":@"b27b82ceb813d221ed87452dd89aa824",@"act":@"login",@"uname":@"15620629809",@"mod":@"User"}

//14.用户退出登录 接口
#define UserLoginOutURL @"http://api.zhaofangla.cn/index.php?app=api&platform=IOS&version=1.29"
  //@{@"mod":@"User",@"act":@"login_out",@"uid":@"235980"}

#endif
