//
//  ConfigEntity.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "ConfigEntity.h"

@implementation ConfigEntity

- (void)dealloc{
    [_merchantName release];
	[_ipaName release];
    [_version release];
    [_appURL release];
	[_bundleID release];
    [_findName release];
    [_jpush_key release];
    [super dealloc];
}

@end
