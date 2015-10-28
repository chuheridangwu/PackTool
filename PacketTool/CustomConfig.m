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
#define D_KEY_FIND_NAME @"D_KEY_FIND_NAME"  //发现名字
#define D_KEY_FIND_SHOWNAV  @"D_KEY_FIND_SHOWNAV" //显示发现
#define D_KEY_SHOWCOMPANY  @"D_KEY_SHOWCOMPANY" //显示公司

#define APP_KEY  @"APP_KEY" //极光key


@implementation CustomConfig

+ (void)configAt:(NSString*)projectPath withEntity:(ConfigEntity*)entity{
    NSInteger merchantID = entity.merchantID;
    NSAssert(merchantID > 1, @"商家ID无效=%d",(int)merchantID);
    NSString *merchantName = entity.merchantName;
    NSAssert(merchantName, @"没有指定商家名称");
    NSAssert(projectPath, @"工程目录不能为空");
    NSString *findName = entity.findName;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:projectPath], @"无效的工程目录");
    
    NSString *customPlistPath = [Path customConfigPathIn:projectPath];
    NSMutableDictionary *plistDic = [NSMutableDictionary dictionaryWithContentsOfFile:customPlistPath];
    [plistDic setObject:entity.merchantName forKey:D_KEY_APP_MERCHANTNAME];
    [plistDic setObject:[NSNumber numberWithInteger:entity.merchantID] forKey:D_KEY_MERCHANTID];
    [plistDic setObject:[NSNumber numberWithInteger:entity.appCategory] forKey:D_KEY_APP_CATEGORY];
    [plistDic setObject:findName forKey:D_KEY_FIND_NAME];
    [plistDic setObject:[NSNumber numberWithInteger:entity.showFindNav] forKey:D_KEY_FIND_SHOWNAV];
    [plistDic setObject:[NSNumber numberWithInteger:entity.showCompany] forKey:D_KEY_SHOWCOMPANY];
    if (entity.appCategory == E_App_Category_Public){
        [plistDic setObject:[NSNumber numberWithInteger:entity.subShopID] forKey:D_KEY_APP_SUBSHOPID];
        [plistDic setObject:[NSNumber numberWithInteger:entity.areaID] forKey:D_KEY_APP_AREAID];
    }
    
    NSString *pushConfigPath = [Path jpushConfigPathIn:projectPath];
    NSMutableDictionary *pushPlistDic = [NSMutableDictionary dictionaryWithContentsOfFile:pushConfigPath];
    [pushPlistDic setObject:entity.jpush_key forKey:APP_KEY];
    
    [plistDic writeToFile:customPlistPath atomically:NO];
    [pushPlistDic writeToFile:pushConfigPath atomically:NO];
    
    NSLog(@"配置商家信息 商家名称为:%@, 商家ID为:%d",entity.merchantName,(int)entity.merchantID);
}

@end
