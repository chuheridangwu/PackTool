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
+ (NSString*)plistPathIn:(NSString*)projectPath;//plist文件的位置~
+ (NSString*)customConfigPathIn:(NSString*)projectPath;//配置文件plist的位置~
+ (NSString*)certificatePathIn:(NSString*)projectPath;//工程文件的位置~

#pragma mark 图片文件的目标地址~
+ (NSString*)iconDirPathIn:(NSString*)projectPath;//图标文件的位置~
+ (NSString*)flashIconDirPathIn:(NSString*)projectPath;//flash图片的位置~
+ (NSString*)dbarcodeFilePathIn:(NSString *)projectPath;//二维码的位置
+ (NSString*)guideImageDirPath:(NSString*)projectPath;//引导页图片的位置~
+ (NSString*)logRegBgImageFilePath:(NSString*)projectPath;//注册页面背景图片的位置~
+ (NSString*)logRegIconFilePath:(NSString*)projectPath;//注册页面的顶部icon
+ (NSString*)sideSliderBgImageFilePath:(NSString*)projectPath;//侧边栏背景图片的位置~
+ (NSString*)sideSliderIconDirPath:(NSString*)projectPath;//侧边栏里面的Icon的地址~
+ (NSString*)otherIconDirPath:(NSString*)projectPath;//其他图标的目录地址~

#pragma mark 图片文件的源地址~
+ (NSString*)iconDirSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)flashIconDirSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)dbarcodeFileSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)guideImageDirSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)logRegBgImageFileSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)logRegIconFileSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)sideSliderBgImageFileSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)sideSliderIconDirSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)otherIconDirSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity;

#pragma 默认地址~
+ (NSString*)noneGuideImageDirSourcePath:(NSString*)picDirPath;
+ (NSString*)noneLogRegBgImageFileSourcePath:(NSString*)picDirPath;

#pragma mark 打包后的ipa以及plist的路径
+ (NSString*)ipaDirPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaFilePathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaAppPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;
+ (NSString*)ipaPlistPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity;

@end