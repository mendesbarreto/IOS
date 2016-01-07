//
//  HSSessionManager.m
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/7/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HSSessionManager.h"

static NSString *const kBaseURL = @"https://omgvamp-hearthstone-v1.p.mashape.com";


@implementation HSSessionManager


-(instancetype) init
{
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    if(!self) return nil;
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    self.securityPolicy.validatesDomainName = NO;
    self.securityPolicy.allowInvalidCertificates = YES;
    
    [self.requestSerializer setValue:@"W0KEPiq4B6mshId80a8F4crqcRRap1kiA0CjsnXfwF0x6vXdSy" forHTTPHeaderField:@"X-Mashape-Key"];
    
    
    [self GET:@"/cards" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%f", downloadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"FAIL %@", error.localizedDescription);
    }];
    
    return self;
}

+(instancetype) sharedManager
{
    static HSSessionManager *_sessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [[HSSessionManager alloc] init];
    });
    return _sessionManager;
}

@end
