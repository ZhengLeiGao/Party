//
//  GZLHelper.h
//  Party
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GZLHelper : NSObject

//把一个秒字符串 转化为真正的本地时间
//@"1419055200" -> 转化 日期字符串
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr;

//根据字符串内容的多少  在固定宽度 下计算出实际的行高
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size;

//获取 当前设备版本
+ (double)getCurrentIOS;

//获取当前设备屏幕的大小
+ (CGSize)getScreenSize;

//获得当前系统时间到指定时间的时间差字符串,传入目标时间字符串和格式
+ (NSString *)stringNowToDate:(NSString *)toDate formatter:(NSString *)formatterStr;

//获取 一个文件 在沙盒沙盒Library/Caches/ 目录下的路径
+ (NSString *)getFullPathWithFile:(NSString *)urlName;

//检测 缓存文件 是否超时
+ (BOOL)isTimeOutWithFile:(NSString *)filePath timeOut:(double)timeOut;


@end
