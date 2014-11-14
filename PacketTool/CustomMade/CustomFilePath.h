//
//  CustomFilePath.h
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#ifndef PacketTool_CustomFilePath_h
#define PacketTool_CustomFilePath_h

//此为必须填的选项
#define D_CODE_SOURCE_PROJECT_DIR_PATH @"/Users/Elty/Desktop/Woxin2.0" //工程的文件夹位置
/* 商家如果要自定义图片
 将商家的图片存放在以商家ID命名的文件夹中 并将这个文件夹存放在这个设置的文件夹下
 如果不设置 则将此选项注释掉
 */
#define D_ICON_DIR_PATH	 @"/Users/Elty/Documents/Project/Picture/Icon"	//软件的相关小图片的文件夹位置
#define D_DBARCODE_DIR_PATH @"/Users/Elty/Documents/Project/Picture/D_Barcode" //二维码的图片文件夹位置
//此为必须设置的选项
#define D_IPAS_DIR_PATH @"/Users/Elty/Desktop/IPAS" // 所有Ipa包存放的位置
//如果配置文件中设置了版本号则以配置里面的版本号为准
#define D_IPA_DEFAULT_ALL_VERSION @"2.1.14.3" //默认的版本号

#endif