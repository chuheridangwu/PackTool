//
//  Xcodebuild.m
//  PacketTool
//
//  Created by Elty on 10/7/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "Xcodebuild.h"
#import "CustomFilePath.h"
#import "Path.h"

#define D_TargetName @"Woxin2.0"
@implementation Xcodebuild

+ (void)xcodeBuild:(ConfigEntity*)configEntity{
	NSString *projectPath = D_CODE_SOURCE_PROJECT_DIR_PATH;
	NSString *cd = [NSString stringWithFormat:@"cd %@",projectPath];
	NSString *clean = [NSString stringWithFormat:@"/usr/bin/xcodebuild -target %@ clean",D_TargetName];
	NSString *build = [NSString stringWithFormat:@"/usr/bin/xcodebuild -configuration \"Release\" -target %@ build",D_TargetName];
	NSString *ipaPath = [Path ipaFilePathAt:D_IPAS_DIR_PATH itemEntity:configEntity];
	NSString *dsmPath = [D_CODE_SOURCE_PROJECT_DIR_PATH stringByAppendingPathComponent:@"build"];
	NSString *ipaAppPath = [dsmPath stringByAppendingPathComponent:@"Release-iphoneos/*.app"];
	NSString *run = [NSString stringWithFormat:@"/usr/bin/xcrun -sdk iphoneos PackageApplication -v %@ -o %@",ipaAppPath,ipaPath];
	NSString *shell = [NSString stringWithFormat:@"%@\n %@\n %@\n %@\n",cd,clean,build,run];
	system([shell cStringUsingEncoding:NSUTF8StringEncoding]);
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *appBuildPath = [Path ipaAppPathAt:D_IPAS_DIR_PATH itemEntity:configEntity];
	appBuildPath = [appBuildPath stringByAppendingPathComponent:@"build"];
	[fileManager moveItemAtPath:dsmPath toPath:appBuildPath error:nil];
}

@end
