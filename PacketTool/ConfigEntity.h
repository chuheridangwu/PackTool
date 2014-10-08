//
//  ConfigEntity.h
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigEntity : NSObject
@property (nonatomic,assign)NSInteger merchantID;//商家ID
@property (nonatomic,retain)NSString *merchantName;//商家名称
@property (nonatomic,retain)NSString *ipaName;//ipa名称
@property (nonatomic,retain)NSString *version;//版本号
@property (nonatomic,retain)NSString *appURL;//app的地址
@property (nonatomic,retain)NSString *bundleID;//bundleID
@end
