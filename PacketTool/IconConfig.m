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
	NSString *destDirPath = [Path iconDirPathIn:projectPath];
	NSString *sourceDirPath = [Path iconDirSourcePathIn:sourcePicRootPath itemEntity:entity];
	NSString *moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",[NSString stringWithFormat:@"%@/*",sourceDirPath],destDirPath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	
	//flash文件
	destDirPath = [Path flashIconDirPathIn:projectPath];
	sourceDirPath = [Path flashIconDirSourcePathIn:sourcePicRootPath itemEntity:entity];
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",[NSString stringWithFormat:@"%@/*",sourceDirPath],destDirPath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	
	//二维码~
	NSString *destFilePath = [Path dbarcodeFilePathIn:projectPath];
	NSString *sourceFilePath = [Path dbarcodeFileSourcePathIn:sourcePicRootPath itemEntity:entity];
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",sourceFilePath,destFilePath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	
	//引导页
	destDirPath = [Path guideImageDirPath:projectPath];
	sourceDirPath = [Path noneGuideImageDirSourcePath:sourcePicRootPath];
	//先用默认的小图片覆盖掉~
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",[NSString stringWithFormat:@"%@/*",sourceDirPath],destDirPath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	sourceDirPath = [Path guideImageDirSourcePath:sourcePicRootPath itemEntity:entity];
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",[NSString stringWithFormat:@"%@/*",sourceDirPath],destDirPath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	
	//注册页面的背景图片~
	destFilePath = [Path logRegBgImageFilePath:projectPath];
	sourceFilePath = [Path logRegBgImageFileSourcePath:sourcePicRootPath itemEntity:entity];
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",sourceFilePath,destFilePath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	
	//注册页面的小logo
	destFilePath = [Path logRegIconFilePath:projectPath];
	sourceFilePath = [Path logRegIconFileSourcePath:sourcePicRootPath itemEntity:entity];
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",sourceFilePath,destFilePath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	
	//侧边栏上面的背景图片~
	destFilePath = [Path sideSliderBgImageFilePath:projectPath];
	sourceFilePath = [Path sideSliderBgImageFileSourcePath:sourcePicRootPath itemEntity:entity];
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",sourceFilePath,destFilePath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	
	//侧边栏上的小Icon文件夹~
	destDirPath = [Path sideSliderIconDirPath:projectPath];
	sourceDirPath = [Path sideSliderIconDirSourcePath:sourcePicRootPath itemEntity:entity];
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",[NSString stringWithFormat:@"%@/*",sourceDirPath],destDirPath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
	
	//其他的图片~
	destDirPath = [Path otherIconDirPath:projectPath];
	sourceDirPath = [Path otherIconDirSourcePath:sourcePicRootPath itemEntity:entity];
	moveItem = [NSString stringWithFormat:@"cp -rf %@ %@",[NSString stringWithFormat:@"%@/*",sourceDirPath],destDirPath];
	system([moveItem cStringUsingEncoding:NSUTF8StringEncoding]);
#warning 拨号键盘~
}

@end
