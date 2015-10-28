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
    E_ConfigIndex_FindName,//发现标签名称
    E_ConfigIndex_AppCategory,//App分类
    E_ConfigIndex_ShowFindNav,//是否显示发现导航
    E_ConfigIndex_ShowCompany,//是否显示发现导航
    E_ConfigIndex_JPushKey, //极光key
    E_ConfigIndex_SharedID, //分享ID
    
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
        NSString *findName = [comps objectAtIndex:E_ConfigIndex_FindName];
        E_App_Category appCategory = [[comps objectAtIndex:E_ConfigIndex_AppCategory] intValue];
        NSInteger showFindNav = [[comps objectAtIndex:E_ConfigIndex_ShowFindNav] integerValue];
        NSInteger showCompany = [[comps objectAtIndex:E_ConfigIndex_ShowCompany] integerValue];
        NSString *jpushKey = [comps objectAtIndex:E_ConfigIndex_JPushKey];
        NSString *sharedID = [comps objectAtIndex:E_ConfigIndex_SharedID];
        
        ConfigEntity *entity = [[[ConfigEntity alloc] init] autorelease];
        [entity setMerchantName:name];
        [entity setMerchantID:merchantID];
        [entity setIpaName:ipaName];
        [entity setFindName:findName];
        [entity setAppCategory:appCategory];
        [entity setShowFindNav:showFindNav];
        [entity setShowCompany:showCompany];
        [entity setJpush_key:jpushKey];
        if(sharedID.length < 10){
            sharedID = @"wx6708a2328dc2baa7";   //如果填写错误则默认我信云分享ID
        }
        [entity setSharedID:sharedID];
        
        NSLog(@"商家名称=%@ 商家ID=%d ipa名称为:%@",name,(int)merchantID,ipaName);
        NSString *version = D_IPA_DEFAULT_ALL_VERSION;
        [entity setVersion:version];
        NSLog(@"版本号为:%@",version);
        
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
