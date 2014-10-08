//
//  CustomConfig.h
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConfigEntity.h"

@interface CustomConfig : NSObject
+ (void)configAt:(NSString*)projectPath withEntity:(ConfigEntity*)entity;
@end
