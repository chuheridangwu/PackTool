//
//  main.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"
#import "CustomFilePath.h"
#import "Path.h"
#import "IpaPlistFactory.h"
#import "Xcodebuild.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *configList = [Config loadConfigEntityList];
        for (ConfigEntity *entity in configList){
			NSString *ipaDirPath = [Path ipaDirPathAt:D_IPAS_DIR_PATH itemEntity:entity];
			//创建文件夹
			NSFileManager *fileManager = [NSFileManager defaultManager];
			if ([fileManager createDirectoryAtPath:ipaDirPath withIntermediateDirectories:YES attributes:nil error:nil]) {
				NSLog(@"create a directory");
			}else{
				NSLog(@"create a directory failed");
			}
            [Config config:entity];
			[[IpaPlistFactory sharedIpaPlistFactory] createIpaPlistFor:entity];
			[Xcodebuild xcodeBuild:entity];
        }
    }
    return 0;
}
