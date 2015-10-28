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

#pragma mark 配置相关的文件路径
+ (NSString*)plistPathIn:(NSString*)projectPath;            //plist文件的位置
+ (NSString*)customConfigPathIn:(NSString*)projectPath;     //配置文件plist的位置
+ (NSString*)jpushConfigPathIn:(NSString*)projectPath;      //极光推送配置文件的位置
+ (NSString*)certificatePathIn:(NSString*)projectPath;      //工程文件的位置

#pragma mark 图片文件的目标地址~
+ (NSString*)iconDirpathIn:(NSString*)projectPath;    //APP的logo位置
+ (NSString*)dbarcodeFilePathIn:(NSString *)projectPath;//二维码的位置
+ (NSString*)guideImageDirPath:(NSString*)projectPath;  //引导页的位置

#pragma mark 图片文件的源地址~
+ (NSString*)iconDirSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)dbarcodeFileSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)guideImageDirSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;

#pragma mark 打包后的ipa以及plist的路径
+ (NSString*)ipaDirPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaFilePathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaAppPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaPlistPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;

@end