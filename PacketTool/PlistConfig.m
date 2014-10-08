//
//  PlistConfig.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "PlistConfig.h"
#import "Path.h"
#import "CustomFilePath.h"

@implementation PlistConfig

+ (void)configAt:(NSString*)projectFilePath withEntity:(ConfigEntity*)entity{
    NSString *plistPath = [Path plistPathIn:projectFilePath];
    NSMutableDictionary *plistDic = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    [plistDic setObject:entity.ipaName forKey:@"CFBundleDisplayName"];
    NSString *version = entity.version;
    [plistDic setObject:version forKey:@"CFBundleShortVersionString"];
	[plistDic setObject:entity.bundleID forKey:@"CFBundleIdentifier"];
    [plistDic writeToFile:plistPath atomically:NO];
    
    NSLog(@"配置plist文件 版本号为:%@, app名称为:%@",version,entity.merchantName);
}
@end
