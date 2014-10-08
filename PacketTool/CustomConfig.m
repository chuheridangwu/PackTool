//
//  CustomConfig.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "CustomConfig.h"
#import "Path.h"

#define D_KEY_MERCHANTID        @"D_KEY_MERCHANTID"
#define D_KEY_APP_MERCHANTNAME  @"D_KEY_APP_MERCHANTNAME"

@implementation CustomConfig

+ (void)configAt:(NSString*)projectPath withEntity:(ConfigEntity*)entity{
    NSInteger merchantID = entity.merchantID;
    NSAssert(merchantID > 1000, @"商家ID无效=%d",(int)merchantID);
    NSString *merchantName = entity.merchantName;
    NSAssert(merchantName, @"没有指定商家名称");
    NSAssert(projectPath, @"工程目录不能为空");
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:projectPath], @"无效的工程目录");
    
    NSString *customPlistPath = [Path customConfigPathIn:projectPath];
    NSMutableDictionary *plistDic = [NSMutableDictionary dictionaryWithContentsOfFile:customPlistPath];
    [plistDic setObject:entity.merchantName forKey:D_KEY_APP_MERCHANTNAME];
    [plistDic setObject:[NSNumber numberWithInteger:entity.merchantID] forKey:D_KEY_MERCHANTID];
    [plistDic writeToFile:customPlistPath atomically:NO];
    
    NSLog(@"配置商家信息 商家名称为:%@, 商家ID为:%d",entity.merchantName,(int)entity.merchantID);
}

@end
