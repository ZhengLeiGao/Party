//
//  GZLHelper.m
//  Party
//
//  Created by qianfeng on 15/9/18.
//  Copyright (c) 2015年 高正磊. All rights reserved.
//

#import "GZLHelper.h"
#import "NSString+Hashing.h"
@implementation GZLHelper

+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr {

    //转化为Double
    double t = [timerStr doubleValue];
    
    //计算出距离1970的NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:t];
    
    //转化为 时间格式化字符串
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    //转化为 时间字符串
    return [df stringFromDate:date];
}

//动态 计算行高
//根据字符串的实际内容的多少 在固定的宽度和字体的大小，动态的计算出实际的高度
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size {
    
    /*
     第一个参数: 预设空间 宽度固定  高度预设 一个最大值
     第二个参数: 行间距 如果超出范围是否截断
     第三个参数: 属性字典 可以设置字体大小
     */
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
  
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    //返回计算出的行高
    return rect.size.height;
}

//获取iOS版本号
+ (double)getCurrentIOS {

    return [[[UIDevice currentDevice] systemVersion] doubleValue];
}

+ (CGSize)getScreenSize {

    return [UIScreen mainScreen].bounds.size;
}

//获得当前系统时间到指定时间的时间差字符串,传入目标时间字符串和格式
+ (NSString *)stringNowToDate:(NSString *)toDate formatter:(NSString *)formatterStr {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if (formatter) {
        [formatter setDateFormat:formatterStr];
    } else {
    
        [formatter setDateFormat:[NSString stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]];
    }
    
    NSDate *date = [formatter dateFromString:toDate];
    
    return [self stringNowToDate:date];
}

//获得到指定时间的时间差字符串,格式在此方法内返回前自己根据需要格式化
+ (NSString *)stringNowToDate:(NSDate *)toDate {

    //创建日期 NSCalendar对象
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    //得到当前时间
    NSDate *today = [NSDate date];

    unsigned int unitFlags = 0;
    
    if ([GZLHelper getCurrentIOS] >= 8.0) {
        
        //用来得到具体的时差,位运算
        unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    } else {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        //用来得到具体的时差,位运算
        unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
#pragma clang diagnostic pop
    }
    
    if (toDate && today) {//不为nil进行转化
        NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:toDate options:0];
        
        //NSString *dateStr=[NSString stringWithFormat:@"%d年%d月%d日%d时%d分%d秒",[d year],[d month], [d day], [d hour], [d minute], [d second]];
          NSString *dateStr=[NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)[d hour], (long)[d minute], (long)[d second]];
        
        return dateStr;
    }
    return @"";
}

//获取 一个文件 在沙盒Library/Caches/ 目录下的路径
+ (NSString *)getFullPathWithFile:(NSString *)urlName {

    //先获取 沙盒中的Library/Caches/路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *myCacheDirectory = [docPath stringByAppendingPathComponent:@"MyCaches"];
    
    //检测MyCaches 文件夹是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:myCacheDirectory]) {
        
        //不存在 那么创建
        [[NSFileManager defaultManager] createDirectoryAtPath:myCacheDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //用md5进行 加密 转化为 一串十六进制数字 (md5加密可以把一个字符串转化为一串唯一的用十六进制表示的串)
    NSString *newName = [urlName MD5Hash];
    
    //拼接路径
    return [myCacheDirectory stringByAppendingPathComponent:newName];
}

//检测 缓存文件 是否超时
+ (BOOL)isTimeOutWithFile:(NSString *)filePath timeOut:(double)timeOut {

    //获取文件的属性
    NSDictionary *fileDict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    
    //获取文件的上次的修改时间
    NSDate *lastModfyDate = fileDict.fileModificationDate;
    
    //算出时间差 获取当前系统时间 和 lastModfyDate时间差
    NSTimeInterval sub = [[NSDate date] timeIntervalSinceDate:lastModfyDate];
    
    if (sub < 0) {
        sub = -sub;
    }
    
    //比较是否超时
    if (sub > timeOut) {
        //如果时间差 大于 设置的超时时间 那么就表示超时
        return YES;
    }
    
    return NO;
}






























@end
