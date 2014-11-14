//
//  IpaPlistConfig.m
//  PacketTool
//
//  Created by Elty on 10/7/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "IpaPlistFactory.h"
#import "ConfigEntity.h"
#import "Path.h"
#import "CustomFilePath.h"

@interface IpaPlistFactory()
{
	NSMutableDictionary *_ipaPlistDic;
}
@end

@implementation IpaPlistFactory

- (void)dealloc{
	[_ipaPlistDic release];
	[super dealloc];
}

+ (IpaPlistFactory*)sharedIpaPlistFactory{
	static dispatch_once_t onceToken;
	static IpaPlistFactory *sharedInstance = nil;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[IpaPlistFactory alloc] init];
	});
	return sharedInstance;
}

- (id)init{
	if (self = [super init]){
		NSString *path = [[NSBundle mainBundle] pathForResource:@"10001" ofType:@"plist"];
		_ipaPlistDic = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
	}
	return self;
}

- (NSString *)ipaURL:(ConfigEntity*)entity{
	NSString *rootURL = @"http://yun.67call.com/Ios/";
	if (!entity.isServerUseOldAddress){
		rootURL = @"http://wxa.67call.com/Ios/";
	}
	NSString *url = [NSString stringWithFormat:@"%@%d.ipa",rootURL,(int)entity.merchantID];
	return url;
}

- (void)createIpaPlistFor:(ConfigEntity*)entity{
	NSString *ipaPlistPath = [Path ipaPlistPathAt:D_IPAS_DIR_PATH itemEntity:entity];
	NSArray *items = [_ipaPlistDic objectForKey:@"items"];
	NSDictionary *itemDic = [items objectAtIndex:0];
	NSArray *assets = [itemDic objectForKey:@"assets"];
	NSMutableDictionary *asset = [assets objectAtIndex:0];
	[asset setObject:[self ipaURL:entity] forKey:@"url"];
	
	NSMutableDictionary *metadata = [itemDic objectForKey:@"metadata"];
	[metadata setObject:entity.bundleID forKey:@"bundle-identifier"];
	[metadata setObject:entity.version forKey:@"bundle-version"];
	[metadata setObject:entity.ipaName forKey:@"title"];
	
	[_ipaPlistDic writeToFile:ipaPlistPath atomically:NO];
}

@end
