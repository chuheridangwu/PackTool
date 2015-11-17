//
//  Path.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "Path.h"

@implementation Path

//plist文件的位置
+(NSString*)plistPathIn:(NSString *)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"RKWXT/Info.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

//定制文件的位置
+(NSString*)customConfigPathIn:(NSString *)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"RKWXT/Common/CustomMade/CustomMade.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

//极光推送配置文件的位置
+(NSString*)jpushConfigPathIn:(NSString*)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"RKWXT/PushConfig.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

//证书文件的位置
+(NSString*)certificatePathIn:(NSString *)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"RKWXT.xcodeproj/project.pbxproj"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

+ (NSString*)dbarcodeFilePathIn:(NSString *)projectPath{
    NSString *filePath = [projectPath stringByAppendingPathComponent:@"RKWXT/Resources/Icon/Other/TwoDimension@2x.png"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:filePath], @"无效的地址");
    return filePath;
}

+(NSString*)iconDirpathIn:(NSString *)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"RKWXT/Resources/Icon"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

+(NSString*)guideImageDirPath:(NSString *)projectPath{
    NSString *dirPath = [projectPath stringByAppendingPathComponent:@"RKWXT/Resources/GuideImg"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
    return dirPath;
}

+(NSString*)linkPageImageDirPath:(NSString *)projectPath{
    NSString *dirPath = [projectPath stringByAppendingPathComponent:@"RKWXT/Resources/AppStartImg"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
    return dirPath;
}

+ (NSString*)iconSourceRootDirIn:(NSString*)picPath{
    NSString *dir = [picPath stringByAppendingPathComponent:@"Icon"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:dir], @"无效的地址");
    return dir;
}

#pragma mark 图片文件的源地址
+(NSString*)appIconPathAtSourcePathIn:(NSString*)picDirPath merchantID:(NSInteger)merchantID{
    NSString *iconDir = [self iconSourceRootDirIn:picDirPath];
    NSString *appIconDir = [iconDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d/Icon",(int)merchantID]];
    return appIconDir;
}

+(NSString*)iconDirSourcePathIn:(NSString *)picDirPath itemEntity:(ConfigEntity *)entity{
    NSInteger merchantID = entity.merchantID;
    NSString *appIconDir = [self appIconPathAtSourcePathIn:picDirPath merchantID:merchantID];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *dirPath = nil;
    if([fileManager fileExistsAtPath:appIconDir]){
        dirPath = appIconDir;
    }
    NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
    return dirPath;
}

+ (NSString*)dbarcodeFileSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
    NSString *D_BarcodeSourceDir = [self D_BarcodeSourceRootDirIn:picDirPath];
    NSString *path = [D_BarcodeSourceDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d/*",(int)entity.merchantID]];
    return path;
}

+(NSString*)guideImageDirSourcePath:(NSString *)picDirPath itemEntity:(ConfigEntity *)entity{
    NSString *guideImageDir = [self guideSourceRootDirIn:picDirPath];
    NSString *path = [guideImageDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d/*",100000]];
    if(entity.merchantID == 10145){
        path = [guideImageDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d/*",(int)entity.merchantID]];
    }
    return path;
}

+(NSString*)linkPageImageSourcePath:(NSString *)picDirPath itemEntity:(ConfigEntity *)entity{
    NSString *linkPageDir = [self linkSourceRootDirIn:picDirPath];
    NSString *path = [linkPageDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d/*",100000]];
    if(entity.merchantID == 10198 || entity.merchantID == 10135){
        path = [linkPageDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d/*",(int)entity.merchantID]];
    }
    return path;
}

#pragma mark 一些文件夹的位置~
+ (NSString*)D_BarcodeSourceRootDirIn:(NSString*)picPath{
    NSString *dir = [picPath stringByAppendingPathComponent:@"D_Barcode"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:dir], @"无效的地址");
    return dir;
}

+ (NSString*)guideSourceRootDirIn:(NSString*)picPath{
    NSString *dir = [picPath stringByAppendingPathComponent:@"Guide"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:dir], @"无效的地址");
    return dir;
}

+ (NSString*)linkSourceRootDirIn:(NSString*)picPath{
    NSString *dir = [picPath stringByAppendingPathComponent:@"StartImg"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:dir], @"无效的地址");
    return dir;
}

#pragma mark ipa包的地址~
+(NSString *)ipaDirPathAt:(NSString *)ipasPath itemEntity:(ConfigEntity *)entity{
    NSString *path = [ipasPath stringByAppendingPathComponent:@"IPA"];
    return path;
}

+(NSString *)ipaFilePathAt:(NSString *)ipasPath itemEntity:(ConfigEntity *)entity{
    NSString *direct = [self ipaDirPathAt:ipasPath itemEntity:entity];
    NSString *fileName = [NSString stringWithFormat:@"%d.ipa",(int)entity.merchantID];
    NSString *path = [direct stringByAppendingPathComponent:fileName];
    return path;
}

+(NSString *)ipaAppPathAt:(NSString *)ipasPath itemEntity:(ConfigEntity *)entity{
    NSString *direct = [ipasPath stringByAppendingPathComponent:@"AppBuild"];
    NSString *path = [direct stringByAppendingPathComponent:entity.merchantName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path]){
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}

+(NSString *)ipaPlistPathAt:(NSString *)ipasPath itemEntity:(ConfigEntity *)entity{
    NSString *direct = [self ipaDirPathAt:ipasPath itemEntity:entity];
    NSString *fileName = [NSString stringWithFormat:@"%d.plist",(int)entity.merchantID];
    NSString *path = [direct stringByAppendingPathComponent:fileName];
    return path;
}

@end
