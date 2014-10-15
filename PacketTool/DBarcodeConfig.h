//
//  DBarcodeConfig.h
//  PacketTool
//
//  Created by Elty on 10/14/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConfigEntity;
@interface DBarcodeConfig : NSObject

+ (void)configDBarcode:(NSString*)projectPath configEntity:(ConfigEntity*)entity;
@end
