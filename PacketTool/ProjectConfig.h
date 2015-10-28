//
//  ProjectConfig.h
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConfigEntity;
@interface ProjectConfig : NSObject

+ (void)configAt:(NSString*)projectFilePath withConfigEntity:(ConfigEntity*)entity;

@end
