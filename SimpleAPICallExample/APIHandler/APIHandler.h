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

@interface APIHandler : NSObject

@property (nonatomic, strong) NSOperationQueue *requestQueue;
@property (nonatomic, strong) id<APIRequestBuilder> requestBuilder;
@property (nonatomic, strong) id<APIResponseParser> responseParser;

+ (APIHandler *)defaultAPIHandler;

- (void)requestAPIWithKey:(NSString *)apiKey completionHandler:(void (^)(BOOL isSuccess, id result, NSError* error))resultHandler;

@end
