//
//  CustomConfig.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "CustomConfig.h"
#import "Path.h"

#define D_KEY_MERCHANTID        @"D_KEY_MERCHANTID" //商家ID
#define D_KEY_APP_MERCHANTNAME  @"D_KEY_APP_MERCHANTNAME" //商家名称

#define D_KEY_APP_CATEGORY @"D_KEY_APP_CATEGORY"	//app分类~
#define D_KEY_APP_SUBSHOPID @"D_KEY_APP_SUBSHOPID" //分店ID
#define D_KEY_APP_AREAID	@"D_KEY_APP_AREAID"	//区域ID

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
	
	[plistDic setObject:[NSNumber numberWithInteger:entity.appCategory] forKey:D_KEY_APP_CATEGORY];
	if (entity.appCategory == E_App_Category_Public){
		[plistDic setObject:[NSNumber numberWithInteger:entity.subShopID] forKey:D_KEY_APP_SUBSHOPID];
		[plistDic setObject:[NSNumber numberWithInteger:entity.areaID] forKey:D_KEY_APP_AREAID];
	}else{
		[plistDic removeObjectForKey:D_KEY_APP_SUBSHOPID];
		[plistDic removeObjectForKey:D_KEY_APP_AREAID];
	}
	
    [plistDic writeToFile:customPlistPath atomically:NO];
	
    NSLog(@"配置商家信息 商家名称为:%@, 商家ID为:%d",entity.merchantName,(int)entity.merchantID);
}

@end
