//
//  HSSessionManager+Cards.m
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/8/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HSSessionManager+Cards.h"
#import "HSCardsResponse.h"

@implementation HSSessionManager (Cards)


- (NSURLSessionDataTask *) getAllCardsWithRequestModel:(HSCardsRequest *) request
                                              onSucess:(HSSessionManagerGetSuccess) successHandler
                                             onFailure:(HSSessionManagerGetFailure) failureHandler
{
    NSDictionary *parameters = nil;
    
    if(request)
    {
        parameters = [MTLJSONAdapter JSONDictionaryFromModel:request error:nil];
    }
    
    return [self GET:kEndPointCards parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"Progress: %f \n", downloadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *responseDictionary = (NSDictionary *) responseObject;
        NSError *error;
        HSCardsResponse *response = [MTLJSONAdapter modelOfClass:HSCardsResponse.class fromJSONDictionary:responseDictionary error:&error];
        successHandler(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureHandler(error);
    }];
    
}


@end
