//
//  HSSessionManager.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/7/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HSSessionManager : AFHTTPSessionManager

+(id) sharedManager;

@end
