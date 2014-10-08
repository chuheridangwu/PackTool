//
//  CertificateParse.h
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CertificateEntity : NSObject 
@property (nonatomic,retain)NSString *merchantName;
@property (nonatomic,retain)NSString *certificate;
@property (nonatomic,retain)NSString *bundleID;
@property (nonatomic,assign)NSInteger merchantID;
@end

@interface CertificateParse : NSObject

+ (CertificateParse*)sharedCertificateParse;

- (CertificateEntity *)certificateStringForMerchantID:(NSInteger)merchantID;
@end
