//
//  IconConfig.m
//  PacketTool
//
//  Created by Elty on 10/8/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "IconConfig.h"
#import "Path.h"
#import "CustomFilePath.h"

@implementation IconConfig

+ (void)configIconAtPath:(NSString*)projectPath configEntity:(ConfigEntity*)entity{
	NSString *sourcePicRootPath = D_ICON_DIR_PATH;
	//图标文件~
	NSString *destDirPath = [Path iconDirpathIn:projectPath];
	NSString *sourceDirPath = [Path iconDirSourcePathIn:sourcePicRootPath itemEntity:entity];
	NSString *moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",[NSString stringWithFormat:@"%@/*",sourceDirPath],destDirPath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);

//    二维码~
//    NSString *destFilePath = [Path dbarcodeFilePathIn:projectPath];
//    NSString *sourceFilePath = [Path dbarcodeFileSourcePathIn:sourcePicRootPath itemEntity:entity];
//    moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",sourceFilePath,destFilePath];
//    system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
    
    //引导页~
    NSString *guideFilePath = [Path guideImageDirPath:projectPath];
    NSString *guideDirPath = [Path guideImageDirSourcePath:sourcePicRootPath itemEntity:entity];
    moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",guideDirPath,guideFilePath];
    system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
