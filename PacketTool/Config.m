//
//  Config.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "Config.h"
#import "CustomFilePath.h"
#import "PlistConfig.h"
#import "ProjectConfig.h"
#import "CustomConfig.h"
#import "IconConfig.h"
#import "TxtparseOBJ.h"
#import "AppPublicEntity.h"

enum{
    E_ConfigIndex_Name = 0,//商家名称
    E_ConfigIndex_ID,//商家ID
	E_ConfigIndex_IpaName,//app的名称
	E_ConfigIndex_AppCategory,//App分类
    E_ConfigIndex_IsServerUseOldAddress,//是否使用老的服务器地址~
	E_ConfigIndex_GuideEnable,//导航是否启动~
	E_ConfigIndex_GuidePage,//导航的页数
	E_ConfigIndex_LogRegBgEnable,//注册登录页面是否有背景图片~
	E_ConfigIndex_LogRegColorIndex,//注册登录页面的颜色编号
//	E_ConfigIndex_SideSliderBgEnable,//侧边栏是否有背景图片~
//	E_ConfigIndex_SideSliderColorIndex,//侧边栏颜色编号 目前只有一种为0
	E_ConfigIndex_OtherColorIndex,//其他的颜色编号
	
    E_ConfigIndex_Invalid,
};

enum{
	E_PublicAppConfigIndex_Name = 0,//商家名称
	E_PublicAppConfigIndex_ID,//商家ID
	E_PublicAppConfigIndex_AreaID,//区域ID
	E_PublicAppConfigIndex_SubShopID,//分店ID
	
	E_PublicAppConfigIndex_Invalid,
};

@implementation Config

+ (void)config:(ConfigEntity*)entity{
	[ProjectConfig configAt:D_CODE_SOURCE_PROJECT_DIR_PATH withConfigEntity:entity];
	[PlistConfig configAt:D_CODE_SOURCE_PROJECT_DIR_PATH withEntity:entity];
	[IconConfig configIconAtPath:D_CODE_SOURCE_PROJECT_DIR_PATH configEntity:entity];
    [CustomConfig configAt:D_CODE_SOURCE_PROJECT_DIR_PATH withEntity:entity];
}

+ (NSArray*)loadPublicEntityList{
	NSMutableArray *publicConfigList = [NSMutableArray array];
	NSString *path = [[NSBundle mainBundle] pathForResource:@"publicAppMade" ofType:nil];
	NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
	NSArray *configDatas = [TxtparseOBJ parseDataFrom:string itemSeparator:@"\n" elementSeparator:@"\t"];
	for (NSArray *comps in configDatas) {
		NSInteger cmpCounts = [comps count];
		NSAssert(cmpCounts == E_PublicAppConfigIndex_Invalid, @"解析错误或者数据有错 %@",comps);
		NSString *merchantName = [comps objectAtIndex:E_PublicAppConfigIndex_Name];
		NSInteger merchantID = [[comps objectAtIndex:E_PublicAppConfigIndex_ID] integerValue];
		NSInteger areaID = [[comps objectAtIndex:E_PublicAppConfigIndex_AreaID] integerValue];
		NSInteger subShopID = [[comps objectAtIndex:E_PublicAppConfigIndex_SubShopID] integerValue];
		AppPublicEntity *entity = [[[AppPublicEntity alloc] init] autorelease];
		[entity setMerchantName:merchantName];
		[entity setMerchantID:merchantID];
		[entity setAreaID:areaID];
		[entity setSubShopID:subShopID];
		[publicConfigList addObject:entity];
	}
	return publicConfigList;
}

+ (NSArray*)loadMainConfigEntityList{
	NSMutableArray *configList = [NSMutableArray array];
	NSString *path = [[NSBundle mainBundle] pathForResource:@"customMade" ofType:nil];
	NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
	NSArray *configDatas = [TxtparseOBJ parseDataFrom:string itemSeparator:@"\n" elementSeparator:@"\t"];
	for (NSArray *comps in configDatas) {
		NSInteger cmpCounts = [comps count];
		NSString *name = [comps objectAtIndex:E_ConfigIndex_Name];
		if([name hasPrefix:@"//"]){
			continue;
		}
		NSAssert(cmpCounts == E_ConfigIndex_Invalid, @"解析错误或者数据有错 %@",comps);
		
		NSInteger merchantID = [[comps objectAtIndex:E_ConfigIndex_ID] integerValue];
		NSString *ipaName = [comps objectAtIndex:E_ConfigIndex_IpaName];
		E_App_Category appCategory = [[comps objectAtIndex:E_ConfigIndex_AppCategory] intValue];
		
		ConfigEntity *entity = [[[ConfigEntity alloc] init] autorelease];
		[entity setMerchantName:name];
		[entity setMerchantID:merchantID];
		[entity setIpaName:ipaName];
		[entity setAppCategory:appCategory];
		NSLog(@"商家名称=%@ 商家ID=%d ipa名称为:%@",name,(int)merchantID,ipaName);
		NSString *version = D_IPA_DEFAULT_ALL_VERSION;
		NSInteger useOld = [[comps objectAtIndex:E_ConfigIndex_IsServerUseOldAddress] integerValue];
		[entity setIsServerUseOldAddress:useOld==1];
		[entity setVersion:version];
		NSLog(@"版本号为:%@",version);
		
		BOOL isGuideEnable = [[comps objectAtIndex:E_ConfigIndex_GuideEnable] boolValue];
		NSInteger guidePage = [[comps objectAtIndex:E_ConfigIndex_GuidePage] integerValue];
		BOOL logRegBgEnable = [[comps objectAtIndex:E_ConfigIndex_LogRegBgEnable] boolValue];
		NSInteger logRegColorIndex = [[comps objectAtIndex:E_ConfigIndex_LogRegColorIndex] integerValue];
		NSInteger otherColorIndex = [[comps objectAtIndex:E_ConfigIndex_OtherColorIndex] integerValue];
		[entity setIsGuideEnable:isGuideEnable];
		[entity setGuidePage:guidePage];
		[entity setIsLogRegBGEnable:logRegBgEnable];
		[entity setLogRegColorIndex:logRegColorIndex];
		[entity setOtherColorIndex:otherColorIndex];
		[configList addObject:entity];
	}
	return configList;
}

+ (NSArray*)loadConfigEntityList{
	NSArray *mainConfigList = [self loadMainConfigEntityList];
	NSArray *publicAppList = [self loadPublicEntityList];
	
	for (ConfigEntity *entity in mainConfigList){
		E_App_Category category = entity.appCategory;
		if (category == E_App_Category_Public){
			AppPublicEntity *aPublicEntity = nil;
			for (AppPublicEntity *publicEntity in publicAppList){
				if (publicEntity.merchantID == entity.merchantID){
					aPublicEntity = publicEntity;
					break;
				}
			}
			NSAssert(aPublicEntity!=nil, @"没有找到公众版 id=%d的配置",(int)entity.merchantID);
			[entity setSubShopID:aPublicEntity.subShopID];
			[entity setAreaID:aPublicEntity.areaID];
		}
	}
	return mainConfigList;
}
@end
