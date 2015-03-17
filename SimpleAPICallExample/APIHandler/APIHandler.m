//
//  APIHandler.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "APIHandler.h"
#import "SimpleJSONParser.h"
#import "SimpleAPIRequest.h"

@implementation APIHandler

+ (APIHandler *)defaultAPIHandler {
    static dispatch_once_t once;
    static APIHandler *instance;
    dispatch_once(&once, ^{
        instance = [[APIHandler alloc] init];
        instance.apiRequests = [[NSMutableDictionary alloc] init];
        instance.cancelPolicy = APIHandlerCancelPolicyAll;
    });
    return instance;
}

- (void)sendAPIRequest:(SimpleAPIRequest *)apiRequest completionHandler:(void (^)(BOOL, id, NSError *))resultHandler {
    [self addRequest:apiRequest];
    
    [apiRequest startWithCompletion:^(BOOL isSuccess, id parsedResult, NSError *error) {
        [self.apiRequests removeObjectForKey:apiRequest.identifier];
        if (resultHandler) {
            resultHandler(isSuccess, parsedResult, error);
        }
    }];
}

- (void)cancelIdenticalToAPIRequest:(SimpleAPIRequest *)apiRequest {
    SimpleAPIRequest *existingRequest = [self.apiRequests objectForKey:apiRequest.identifier];
    [existingRequest cancel];
    [self.apiRequests removeObjectForKey:existingRequest.identifier];
}

- (void)addRequest:(SimpleAPIRequest *)request {
    if (self.cancelPolicy == APIHandlerCancelPolicyAll) {
        for (SimpleAPIRequest *existingRequest in self.apiRequests.allValues) {
            [existingRequest cancel];
        }
        [self.apiRequests removeAllObjects];
    } else if (self.cancelPolicy == APIHandlerCancelPolicySameRequestOnly) {
        [self cancelIdenticalToAPIRequest:request];
    }
    
    [self.apiRequests setObject:request forKey:request.identifier];
}


@end
