//
//  ProjectConfig.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "ProjectConfig.h"
#import "CertificateParse.h"
#import "Path.h"
#import "ConfigEntity.h"

@implementation ProjectConfig

+ (void)configAt:(NSString*)projectFilePath withConfigEntity:(ConfigEntity*)entity{
    CertificateEntity *certificateEntity = [[CertificateParse sharedCertificateParse] certificateStringForMerchantID:entity.merchantID];
    NSAssert(certificateEntity, @"没有查到相应的证书");
	[entity setBundleID:certificateEntity.bundleID];
    
    NSString *certificatePath = [Path certificatePathIn:projectFilePath];
    NSMutableDictionary *citificateDic = [NSMutableDictionary dictionaryWithContentsOfFile:certificatePath];
    NSArray *releaseDicArray = [self releaseBuildSettingDicInDic:citificateDic];
    for (NSMutableDictionary *buildSettingDic in releaseDicArray){
        [buildSettingDic setObject:certificateEntity.certificate forKey:@"PROVISIONING_PROFILE"];
    }
    [citificateDic writeToFile:certificatePath atomically:NO];
}

+ (NSArray*)releaseBuildSettingDicInDic:(NSMutableDictionary*)dic{
    NSMutableDictionary *objectsDic = [dic objectForKey:@"objects"];
    NSArray *objects = [objectsDic allValues];
    NSMutableArray *releaseArray = [NSMutableArray array];
    for (NSMutableDictionary *obj in objects){
        NSArray *keys = [obj allKeys];
        if ([keys indexOfObject:@"buildSettings"] != NSNotFound){
            NSString *name = [obj objectForKey:@"name"];
            if ([name isEqualToString:@"Release"]){
                [releaseArray addObject:[obj objectForKey:@"buildSettings"]];
            }
        }
    }
    NSAssert([releaseArray count] > 0, @"没有找到release的证书选项");
    return releaseArray;
}

@end
