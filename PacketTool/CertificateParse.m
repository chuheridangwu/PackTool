//
//  CertificateParse.m
//  PacketTool
//
//  Created by Elty on 10/6/14.
//  Copyright (c) 2014 Elty. All rights reserved.
//

#import "CertificateParse.h"
#import "TxtparseOBJ.h"

enum{
    E_CertificateIndex_Name = 0,
    E_CertificateIndex_ID,
    E_CertificateIndex_Cert,
	E_CertificateIndex_BundleID,
    
    E_CertificateIndex_Invalid,
};

@implementation CertificateEntity

- (void)dealloc{
    [_merchantName release];
    [_certificate release];
	[_bundleID release];
    [super dealloc];
}

@end

@interface CertificateParse()
{
    NSMutableArray *_certificatList;
}
@end

@implementation CertificateParse

- (void)dealloc{
    [_certificatList release];
    [super dealloc];
}

+ (CertificateParse*)sharedCertificateParse{
    static dispatch_once_t onceToken;
    static CertificateParse *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CertificateParse alloc] init];
    });
    return sharedInstance;
}

- (id)init{
    if (self = [super init]){
        _certificatList = [[NSMutableArray alloc] init];
        [self loadCertificateList];
    }
    return self;
}

- (void)loadCertificateList{
    [_certificatList removeAllObjects];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Certificate" ofType:nil];
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    NSArray *certificateDatas = [TxtparseOBJ parseDataFrom:string itemSeparator:@"\n" elementSeparator:@"\t"];
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    for (NSArray *comps in certificateDatas) {
        if([comps count] != E_CertificateIndex_Invalid){
            NSLog(@"解析错误 = %@",comps);
            continue;
        }
        NSString *name = [comps objectAtIndex:E_CertificateIndex_Name];
		if([name hasPrefix:@"//"]){
			continue;
		}
		
        NSInteger merchantID = [[comps objectAtIndex:E_CertificateIndex_ID] integerValue];
        NSString *certificate = [comps objectAtIndex:E_CertificateIndex_Cert];
		NSString *bundleID = [comps objectAtIndex:E_CertificateIndex_BundleID];
        
        CertificateEntity *entity = [[CertificateEntity alloc] init];
        [entity setCertificate:certificate];
		[entity setBundleID:bundleID];
        [entity setMerchantID:merchantID];
        [entity setMerchantName:name];
        [_certificatList addObject:entity];
        [entity release];
    }
    [pool drain];
}

- (CertificateEntity *)certificateStringForMerchantID:(NSInteger)merchantID{
    for (CertificateEntity *entity in _certificatList) {
        if(entity.merchantID == merchantID){
            NSLog(@"当前商家名称为 %@ 商家ID = %d",entity.merchantName,(int)entity.merchantID);
            return entity;
        }
    }
    NSAssert(NO, @"没有找到当前的商家ID = %d对应的证书",(int)merchantID);
    return nil;
}

@end
