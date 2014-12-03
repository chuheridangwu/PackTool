//
//  Path.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "Path.h"

@implementation Path

//plist文件的地址
+ (NSString*)plistPathIn:(NSString*)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Woxin2.0-Info.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

//定制文件的位置
+ (NSString*)customConfigPathIn:(NSString*)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Classes/Common/CustomMade.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

//证书文件的位置
+ (NSString*)certificatePathIn:(NSString*)projectPath{
    NSString *path = [projectPath stringByAppendingPathComponent:@"Woxin2.0.xcodeproj/project.pbxproj"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:path], @"无效的地址");
    return path;
}

+ (NSString*)iconDirPathIn:(NSString*)projectPath{
	NSString *dirPath = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Resource/iconsLauchs/Icon"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
}

+ (NSString*)flashIconDirPathIn:(NSString*)projectPath{
	NSString *dirPath = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Resource/iconsLauchs/Flash"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
}

+ (NSString*)dbarcodeFilePathIn:(NSString *)projectPath{
	NSString *filePath = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Resource/OtherPic/D_Barcode/TwoDimension@2x.png"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:filePath], @"无效的地址");
	return filePath;
}

+ (NSString*)guideImageDirPath:(NSString*)projectPath{
	NSString *dirPath = [projectPath stringByAppendingPathComponent:@"/Woxin2.0/Resource/GuideView"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
}
+ (NSString*)logRegBgImageFilePath:(NSString*)projectPath{
	NSString *filePath = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Resource/LoginAndRegister/loginBg@2x.jpg"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:filePath], @"无效的地址");
	return filePath;
}

+ (NSString*)logRegIconFilePath:(NSString*)projectPath{
	NSString *filePath = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Resource/LoginAndRegister/loginW@2x.png"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:filePath], @"无效的地址");
	return filePath;
}

+ (NSString*)sideSliderBgImageFilePath:(NSString*)projectPath{
	NSString *filePath = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Resource/LeftSideMenu/BG/wxSettingBg@2x.jpg"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:filePath], @"无效的地址");
	return filePath;
}

+ (NSString*)sideSliderIconDirPath:(NSString*)projectPath{
	NSString *dirPath = [projectPath stringByAppendingPathComponent:@"Woxin2.0/Resource/LeftSideMenu/ICON"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
}

+ (NSString*)otherIconDirPath:(NSString*)projectPath{
	NSString *dirPath = [projectPath stringByAppendingPathComponent:@"/Woxin2.0/Resource/OtherPic/other"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
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

+ (NSString*)iconSourceRootDirIn:(NSString*)picPath{
	NSString *dir = [picPath stringByAppendingPathComponent:@"Icon"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dir], @"无效的地址");
	return dir;
}

+ (NSString*)leftSideSourceRootDirIn:(NSString*)picPath{
	NSString *dir = [picPath stringByAppendingPathComponent:@"LeftSide"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dir], @"无效的地址");
	return dir;
}

+ (NSString*)logRegSourceRootDirIn:(NSString*)picPath{
	NSString *dir = [picPath stringByAppendingPathComponent:@"logReg"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dir], @"无效的地址");
	return dir;
}

+ (NSString*)otherIconSourceRootDirIn:(NSString*)picPath{
	NSString *dir = [picPath stringByAppendingPathComponent:@"OtherIcon"];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:dir], @"无效的地址");
	return dir;
}

#pragma mark 图片文件的源地址~
+ (NSString*)appIconPathAtSourcePathIn:(NSString*)picDirPath merchantID:(NSInteger)merchantID{
	NSString *iconDir = [self iconSourceRootDirIn:picDirPath];
	NSString *appIconDir = [iconDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d/Icon",(int)merchantID]];
	return appIconDir;
}
+ (NSString*)iconDirSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSInteger merchantID = entity.merchantID;
	NSString *appIconDir = [self appIconPathAtSourcePathIn:picDirPath merchantID:merchantID];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *dirPath = nil;
	if ([fileManager fileExistsAtPath:appIconDir]){
		dirPath = appIconDir;
	}else{
		E_App_Category appCategory = entity.appCategory;
		switch (appCategory){
			case E_App_Category_Eatable:
				dirPath = [self appIconPathAtSourcePathIn:picDirPath merchantID:10001];
				break;
			case E_App_Category_Public:
				dirPath = [self appIconPathAtSourcePathIn:picDirPath merchantID:10020];
				break;
		}
		return nil;
	}
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
}

+ (NSString*)appFlashPathAtSourcePathIn:(NSString*)picDirPath merchantID:(NSInteger)merchantID{
	NSString *iconDir = [self iconSourceRootDirIn:picDirPath];
	NSString *appFlahDir = [iconDir stringByAppendingPathComponent:[NSString stringWithFormat:@"/%d/Flash",(int)merchantID]];
	return appFlahDir;
}

+ (NSString*)flashIconDirSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSInteger merchantID = entity.merchantID;
	NSString *appFlahDir = [self appFlashPathAtSourcePathIn:picDirPath merchantID:merchantID];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *dirPath = nil;
	if ([fileManager fileExistsAtPath:appFlahDir]){
		dirPath = appFlahDir;
	}else{
		E_App_Category appCategory = entity.appCategory;
		switch (appCategory){
			case E_App_Category_Eatable:
				dirPath = [self appFlashPathAtSourcePathIn:picDirPath merchantID:10001];
				break;
			case E_App_Category_Public:
				dirPath = [self appFlashPathAtSourcePathIn:picDirPath merchantID:10020];
				break;
		}
	}
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
}

+ (NSString*)dbarcodeFileSourcePathIn:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSString *D_BarcodeSourceDir = [self D_BarcodeSourceRootDirIn:picDirPath];
	NSString *path = [D_BarcodeSourceDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d/*",(int)entity.merchantID]];
	return path;
}

+ (NSString*)guideImageDirSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSString *guideDir = nil;
	if (!entity.isGuideEnable){
		guideDir = [self noneGuideImageDirSourcePath:picDirPath];
	}else{
		NSInteger merchantID = entity.merchantID;
		if (entity.appCategory == E_App_Category_Eatable){
			merchantID = 10001;
		}
		NSString *guideRootDir = [self guideSourceRootDirIn:picDirPath];
		guideDir = [guideRootDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%d",(int)merchantID]];
	}
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSAssert([fileManager fileExistsAtPath:guideDir], @"无效的地址");
	return guideDir;
}

+ (NSString*)logRegBgImageFileSourcePath:(NSString*)picDirPath merchantID:(NSInteger)merchantID{
	NSString *filePath = [picDirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"logReg/%d/BG/loginBg@2x.jpg",(int)merchantID]];
	return filePath;
}

+ (NSString*)logRegBgImageFileSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSString *filePath = nil;
	NSFileManager *fileManager = [NSFileManager	defaultManager];
	if (!entity.isLogRegBGEnable){
		filePath = [self noneLogRegBgImageFileSourcePath:picDirPath];
	}else{
		NSInteger merchantID = entity.merchantID;
		filePath = [self logRegBgImageFileSourcePath:picDirPath merchantID:merchantID];
		if (![fileManager fileExistsAtPath:filePath]){
			switch (entity.appCategory){
				case E_App_Category_Eatable:
					filePath = [self logRegBgImageFileSourcePath:picDirPath merchantID:10001];
					break;
				default:
					break;
			}
		}
	}
	NSAssert([fileManager fileExistsAtPath:filePath], @"无效的地址");
	return filePath;
}

+ (NSString*)logRegIconFileSourcePath:(NSString*)picDirPath merchantID:(NSInteger)merchantID{
	NSString *iconPath = [picDirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"logReg/%d/ICON/loginW@2x.png",(int)merchantID]];
	return iconPath;
}

+ (NSString*)logRegIconFileSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSString *iconPath = [self logRegIconFileSourcePath:picDirPath merchantID:entity.merchantID];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:iconPath]){
		iconPath = [self logRegIconFileSourcePath:picDirPath merchantID:10001];
	}
	NSAssert([fileManager fileExistsAtPath:iconPath], @"无效的地址");
	return iconPath;
}


+ (NSString*)sideSliderBgImageFileSourcePath:(NSString*)picDirPath merchantID:(NSInteger)merchantID{
	NSString *filePath = [picDirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"LeftSide/%d/BG/wxSettingBg@2x.jpg",(int)merchantID]];
	return filePath;
}

+ (NSString*)sideSliderBgImageFileSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSString *filePath = [self sideSliderBgImageFileSourcePath:picDirPath merchantID:entity.merchantID];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:filePath]){
		switch (entity.appCategory){
				case E_App_Category_Eatable:
				filePath = [self sideSliderBgImageFileSourcePath:picDirPath merchantID:10001];
				break;
				case E_App_Category_Public:
				filePath = [self sideSliderBgImageFileSourcePath:picDirPath merchantID:10020];
				break;
		}
	}
	NSAssert([fileManager fileExistsAtPath:filePath], @"无效的地址");
	return filePath;
}

+ (NSString*)sideSliderIconDirSourcePath:(NSString*)picDirPath merchantID:(NSInteger)merchantID{
	NSString *filePath = [picDirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"LeftSide/%d/ICON",(int)merchantID]];
	return filePath;
}

+ (NSString*)sideSliderIconDirSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSString *dirPath = [self sideSliderIconDirSourcePath:picDirPath merchantID:entity.merchantID];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:dirPath]){
		switch (entity.appCategory){
			case E_App_Category_Eatable:
				dirPath = [self sideSliderIconDirSourcePath:picDirPath merchantID:10001];
				break;
			case E_App_Category_Public:
				dirPath = [self sideSliderIconDirSourcePath:picDirPath merchantID:10020];
				break;
		}
	}
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
}

+ (NSString*)otherIconDirSourcePath:(NSString*)picDirPath merchantID:(NSInteger)merchantID{
	NSString *filePath = [picDirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"OtherIcon/%d",(int)merchantID]];
	return filePath;
}

+ (NSString*)otherIconDirSourcePath:(NSString*)picDirPath itemEntity:(ConfigEntity*)entity{
	NSString *dirPath = [self otherIconDirSourcePath:picDirPath merchantID:entity.merchantID];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:dirPath]){
		switch (entity.appCategory){
			case E_App_Category_Eatable:
				dirPath = [self otherIconDirSourcePath:picDirPath merchantID:10001];
				break;
			case E_App_Category_Public:
				dirPath = [self otherIconDirSourcePath:picDirPath merchantID:10020];
				break;
		}
	}
	NSAssert([fileManager fileExistsAtPath:dirPath], @"无效的地址");
	return dirPath;
}

#pragma 默认地址~
+ (NSString*)noneGuideImageDirSourcePath:(NSString*)picDirPath{
	NSString *noneGuideImageDirSourcePath = [picDirPath stringByAppendingPathComponent:@"Guide/noneGuideImage"];
	return noneGuideImageDirSourcePath;
}

+ (NSString*)noneLogRegBgImageFileSourcePath:(NSString*)picDirPath{
	NSString *noneLogRegBgImageFileSourcePath = [picDirPath stringByAppendingPathComponent:@"logReg/loginBg@2x.jpg"];
	return noneLogRegBgImageFileSourcePath;
}

#pragma mark ipa包的地址~
+ (NSString*)ipaDirPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity{
	NSString *path = [ipasPath stringByAppendingPathComponent:entity.merchantName];
	return path;
}

+ (NSString*)ipaFilePathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity{
	NSString *direct = [self ipaDirPathAt:ipasPath itemEntity:entity];
	NSString *fileName = [NSString stringWithFormat:@"%d.ipa",(int)entity.merchantID];
	NSString *path = [direct stringByAppendingPathComponent:fileName];
	return path;
}

+ (NSString*)ipaAppPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity{
	NSString *direct = [ipasPath stringByAppendingPathComponent:@"AppBuild"];
	NSString *path = [direct stringByAppendingPathComponent:entity.merchantName];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:path]){
		[fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
	}
	return path;
}

+ (NSString*)ipaPlistPathAt:(NSString*)ipasPath itemEntity:(ConfigEntity*)entity{
	NSString *direct = [self ipaDirPathAt:ipasPath itemEntity:entity];
	NSString *fileName = [NSString stringWithFormat:@"%d.plist",(int)entity.merchantID];
	NSString *path = [direct stringByAppendingPathComponent:fileName];
	return path;
}

@end
