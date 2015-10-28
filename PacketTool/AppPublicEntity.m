//
//  AppPublicEntity.m
//  PacketTool
//
//  Created by Elty on 11/5/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "AppPublicEntity.h"

@implementation AppPublicEntity

- (void)dealloc{
	[_merchantName release];
	[super dealloc];
}
@end
