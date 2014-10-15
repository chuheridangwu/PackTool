//
//  Path.h
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConfigEntity.h"

@interface Path : NSObject

#pragma mark 配置相关的文件或文件夹路径
+ (NSString*)plistPathIn:(NSString*)projectPath;
+ (NSString*)customConfigPathIn:(NSString*)projectPath;
+ (NSString*)certificatePathIn:(NSString*)projectPath;
+ (NSString*)iconDirPathIn:(NSString*)projectPath;
+ (NSString*)dbarcodePath:(NSString *)projectPath;

#pragma mark 打包后的ipa以及plist的路径
+ (NSString*)ipaDirPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaFilePathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaAppPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaPlistPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
@end