//
//  AppPublicEntity.h
//  PacketTool
//
//  Created by Elty on 11/5/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppPublicEntity : NSObject
@property (nonatomic,assign)NSInteger merchantID;//商家ID
@property (nonatomic,retain)NSString *merchantName;//商家名称
@property (nonatomic,assign)NSInteger areaID; //区域ID
@property (nonatomic,assign)NSInteger subShopID; //分店ID
@end
