//
//  HSSessionManager+Cards.h
//  HearthstoneCards
//
//  Created by Douglas Barreto on 1/8/16.
//  Copyright © 2016 Douglas Mendes. All rights reserved.
//

#import "HSSessionManager.h"
#import "HSCardsRequest.h"
#import "HSCardsResponse.h"
#import "HSConstants.h"

typedef void(^HSSessionManagerGetSuccess)(HSCardsResponse *response);
typedef void(^HSSessionManagerGetFailure)(NSError * _Nonnull error);

@interface HSSessionManager (Cards)
- (NSURLSessionDataTask *) getAllCardsWithRequestModel:(HSCardsRequest * _Nonnull) request
                                              onSucess:(HSSessionManagerGetSuccess _Nonnull) successHandler
                                             onFailure:(HSSessionManagerGetFailure _Nullable) failureHandler;


@end
