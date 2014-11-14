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
	NSInteger merchantID = entity.merchantID;
	NSString *thisIconPath = [D_ICON_DIR_PATH stringByAppendingPathComponent:[NSString stringWithFormat:@"%d",(int)merchantID]];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *iconSourcePath = [thisIconPath stringByAppendingPathComponent:@"*"];
	NSString *iconDesPath = [Path iconDirPathIn:projectPath];
	if(![fileManager fileExistsAtPath:thisIconPath]){
		NSLog(@"商家=%d的icon缺失",(int)merchantID);
		NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
		iconSourcePath = [resourcePath stringByAppendingPathComponent:@"Icon-*"];
		//iTunesArtWorkPath
		NSString *iTunesArtWorkPath = [resourcePath stringByAppendingString:@"iTunesArtWork.png"];
		[NSString stringWithFormat:@"cp -f %@ %@",iTunesArtWorkPath,iconDesPath];
	}
	NSString *moveItems = [NSString stringWithFormat:@"cp -f %@ %@",iconSourcePath,iconDesPath];
	system([moveItems cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
