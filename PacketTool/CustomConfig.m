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
#define D_KEY_APP_IS_SERVER_OLD	@"D_KEY_APP_IS_SERVER_OLD"//是否使用老地址~

#define D_KEY_APP_CATEGORY @"D_KEY_APP_CATEGORY"	//app分类~
#define D_KEY_APP_SUBSHOPID @"D_KEY_APP_SUBSHOPID" //分店ID
#define D_KEY_APP_AREAID	@"D_KEY_APP_AREAID"	//区域ID

#pragma mark 引导页
#define D_KEY_APP_GUIDE @"D_KEY_APP_GUIDE"
#define D_KEY_APP_GUIDE_ENABLE @"D_KEY_APP_GUIDE_ENABLE" //是否有引导页~
#define D_KEY_APP_GUIDE_PAGE @"D_KEY_APP_GUIDE_PAGE" //引导页的页数~

#pragma mark 注册和登录
#define D_KEY_LOG_REG	@"D_KEY_LOG_REG"
#define D_KEY_LOG_REG_BAG_ENABLE	@"D_KEY_LOG_REG_BAG_ENABLE"//注册和登录页面是否有背景图片~
#define D_KEY_LOG_REG_E_COLOR	@"D_KEY_LOG_REG_E_COLOR" //注册和登录页面的颜色枚举~

#define D_KEY_OTHER_COLOR @"D_KEY_OTHER_COLOR" //其他颜色的编号~

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
	[plistDic setValue:[NSNumber numberWithBool:entity.isServerUseOldAddress] forKey:D_KEY_APP_IS_SERVER_OLD];
	[plistDic setObject:[NSNumber numberWithInteger:entity.appCategory] forKey:D_KEY_APP_CATEGORY];
	if (entity.appCategory == E_App_Category_Public){
		[plistDic setObject:[NSNumber numberWithInteger:entity.subShopID] forKey:D_KEY_APP_SUBSHOPID];
		[plistDic setObject:[NSNumber numberWithInteger:entity.areaID] forKey:D_KEY_APP_AREAID];
	}
	
	[plistDic setObject:[NSNumber numberWithInteger:entity.otherColorIndex] forKey:D_KEY_OTHER_COLOR];
	
	NSDictionary *guideDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:entity.isGuideEnable],D_KEY_APP_GUIDE_ENABLE,[NSNumber numberWithInteger:entity.guidePage],D_KEY_APP_GUIDE_PAGE,nil];
	[plistDic setObject:guideDic forKey:D_KEY_APP_GUIDE];
	[NSNumber numberWithInteger:entity.logRegColorIndex];
	NSDictionary *regLogDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:entity.isLogRegBGEnable],D_KEY_LOG_REG_BAG_ENABLE,[NSNumber numberWithInteger:entity.logRegColorIndex],D_KEY_LOG_REG_E_COLOR,nil];
	[plistDic setObject:regLogDic forKey:D_KEY_LOG_REG];
	
	
    [plistDic writeToFile:customPlistPath atomically:NO];
	
    NSLog(@"配置商家信息 商家名称为:%@, 商家ID为:%d",entity.merchantName,(int)entity.merchantID);
}

@end
