//
//  Path.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "Path.h"

@implementation Path

//plist文件的地址
+ (NSString*)plistPathIn:(NSString*)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Woxin2.0-Info.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

//定制文件的位置
+ (NSString*)customConfigPathIn:(NSString*)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Classes/Common/CustomMade.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

//证书文件的位置
+ (NSString*)certificatePathIn:(NSString*)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"Woxin2.0.xcodeproj/project.pbxproj"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

//icon的位置
+ (NSString*)iconDirPathIn:(NSString*)projectPath;{
    NSString *path = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Resource/iconsLauchs"];
    return path;
}

+ (NSString*)ipaDirPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity{
	NSString *path = [ipasPath stringByAppendingPathComponent:entity.merchantName];
	return path;
}

+ (NSString*)ipaFilePathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity{
	NSString *direct = [self ipaDirPathAt:ipasPath itemEntity:entity];
	NSString *fileName = [NSString stringWithFormat:@"%d.ipa",(int)entity.merchantID];
	NSString *path = [direct stringByAppendingPathComponent:fileName];
	return path;
}

+ (NSString*)ipaAppPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity{
	NSString *direct = [ipasPath stringByAppendingPathComponent:@"AppBuild"];
	NSString *path = [direct stringByAppendingPathComponent:entity.merchantName];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:path]){
		[fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
	}
	return path;
}

+ (NSString*)ipaPlistPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity{
	NSString *direct = [self ipaDirPathAt:ipasPath itemEntity:entity];
	NSString *fileName = [NSString stringWithFormat:@"%d.plist",(int)entity.merchantID];
	NSString *path = [direct stringByAppendingPathComponent:fileName];
	return path;
}

@end
