//
//  DBarcodeConfig.m
//  PacketTool
//
//  Created by Elty on 10/14/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "DBarcodeConfig.h"
#import "ConfigEntity.h"
#import "CustomFilePath.h"
#import "Path.h"

@implementation DBarcodeConfig

+ (void)configDBarcode:(NSString*)projectPath configEntity:(ConfigEntity*)entity{
	NSInteger merchantID = entity.merchantID;
	NSString *thisDBarcodeFilePath = [D_DBARCODE_DIR_PATH stringByAppendingPathComponent:[NSString stringWithFormat:@"%d",(int)merchantID]];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *dBarcodeSourcePath = [thisDBarcodeFilePath stringByAppendingPathComponent:@"*"];
	if(![fileManager fileExistsAtPath:thisDBarcodeFilePath]){
		NSAssert(NO, @"商家=%d的二维码缺失",(int)merchantID);
	}
	NSString *iconDesPath = [Path dbarcodePath:projectPath];
	NSString *moveItems = [NSString stringWithFormat:@"cp -f %@ %@",dBarcodeSourcePath,iconDesPath];
	system([moveItems cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
