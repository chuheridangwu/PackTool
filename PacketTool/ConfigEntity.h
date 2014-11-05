//
//  ConfigEntity.h
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	E_App_Category_Eatable = 0,//餐饮类~
	E_App_Category_Public,//大众版
}E_App_Category;

@interface ConfigEntity : NSObject
@property (nonatomic,assign)NSInteger merchantID;//商家ID
@property (nonatomic,retain)NSString *merchantName;//商家名称
@property (nonatomic,retain)NSString *ipaName;//ipa名称
@property (nonatomic,retain)NSString *version;//版本号
@property (nonatomic,retain)NSString *appURL;//app的地址
@property (nonatomic,retain)NSString *bundleID;//bundleID

@property (nonatomic,assign)E_App_Category appCategory;//app 分类
@property (nonatomic,assign)NSInteger areaID; //区域ID
@property (nonatomic,assign)NSInteger subShopID; //分店ID
@end
