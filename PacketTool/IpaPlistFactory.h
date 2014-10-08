//
//  IpaPlistConfig.h
//  PacketTool
//
//  Created by Elty on 10/7/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConfigEntity;
@interface IpaPlistFactory : NSObject

+ (IpaPlistFactory*)sharedIpaPlistFactory;
- (void)createIpaPlistFor:(ConfigEntity*)entity;
@end
