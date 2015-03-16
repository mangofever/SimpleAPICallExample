//
//  APIHandler.h
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequestBuilder.h"
#import "APIResponseParser.h"

typedef NS_ENUM(NSInteger, APIHandlerCancelPolicy){
    APIHandlerCancelPolicyNever,
    APIHandlerCancelPolicySameURL,
    APIHandlerCancelPolicySameIdentifier,
    APIHandlerCancelPolicyAll,
};

@interface APIHandler : NSObject

@property (nonatomic, strong) NSOperationQueue *requestQueue;
@property (nonatomic, strong) id<APIResponseParser> responseParser;
@property (nonatomic) APIHandlerCancelPolicy cancelPolicy;

+ (APIHandler *)defaultAPIHandler;

- (void)sendRequest:(NSURLRequest *)request identifier:(NSString *)identifier completionHandler:(void (^)(BOOL isSuccess, id responseResult, NSError* error))resultHandler;

@end
