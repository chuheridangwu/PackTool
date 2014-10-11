//
//  IconConfig.h
//  PacketTool
//
//  Created by Elty on 10/8/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConfigEntity;
@interface IconConfig : NSObject
+ (void)configIconAtPath:(NSString*)projectPath configEntity:(ConfigEntity*)entity;
@end
