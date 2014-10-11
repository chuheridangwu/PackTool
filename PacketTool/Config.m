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

enum{
    E_ConfigIndex_Name = 0,
    E_ConfigIndex_ID,
	E_ConfigIndex_IpaName,
    E_ConfigIndex_Version,
    
    E_ConfigIndex_Invalid,
};

@implementation Config

+ (void)config:(ConfigEntity*)entity{
	[ProjectConfig configAt:D_CODE_SOURCE_PROJECT_DIR_PATH withConfigEntity:entity];
	[PlistConfig configAt:D_CODE_SOURCE_PROJECT_DIR_PATH withEntity:entity];
	[IconConfig configIconAtPath:D_CODE_SOURCE_PROJECT_DIR_PATH configEntity:entity];
    [CustomConfig configAt:D_CODE_SOURCE_PROJECT_DIR_PATH withEntity:entity];
}

+ (NSArray*)loadConfigEntityList{
    NSMutableArray *configList = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"customMade" ofType:nil];
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    NSArray *certificateDatas = [TxtparseOBJ parseDataFrom:string itemSeparator:@"\n" elementSeparator:@"\t"];
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    for (NSArray *comps in certificateDatas) {
        NSInteger cmpCounts = [comps count];
        NSAssert(cmpCounts >= E_ConfigIndex_Version && cmpCounts <= E_ConfigIndex_Invalid, @"解析错误或者数据有错 %@",comps);
        NSString *name = [comps objectAtIndex:E_ConfigIndex_Name];
		if([name hasPrefix:@"//"]){
			continue;
		}
		
        NSInteger merchantID = [[comps objectAtIndex:E_ConfigIndex_ID] integerValue];
		NSString *ipaName = [comps objectAtIndex:E_ConfigIndex_IpaName];
        
        ConfigEntity *entity = [[[ConfigEntity alloc] init] autorelease];
        [entity setMerchantName:name];
        [entity setMerchantID:merchantID];
		[entity setIpaName:ipaName];
        NSLog(@"商家名称=%@ 商家ID=%d ipa名称为:%@",name,(int)merchantID,ipaName);
		NSString *version = D_IPA_DEFAULT_ALL_VERSION;
        if(cmpCounts == E_ConfigIndex_Invalid){
            NSString *aVersion = [comps objectAtIndex:E_ConfigIndex_Version];
			if (![self isVersionEmpty:aVersion]){
				version = aVersion;
			}
        }
		[entity setVersion:version];
		NSLog(@"版本号为:%@",version);
        [configList addObject:entity];
    }
    [pool drain];
    
    return configList;
}

+ (BOOL)isVersionEmpty:(NSString*)version{
	if (!version){
		return YES;
	}
	
	NSInteger len = version.length;
	for (int index = 0; index < len; index++){
		char ch = [version characterAtIndex:index];
		if (ch != ' ' && ch != '	'){
			return NO;
		}
	}
	return YES;
}

@end
