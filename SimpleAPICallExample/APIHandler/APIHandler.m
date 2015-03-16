//
//  APIHandler.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "APIHandler.h"

@implementation APIHandler

+ (APIHandler *)defaultAPIHandler {
    static dispatch_once_t once;
    static APIHandler *instance;
    dispatch_once(&once, ^{
        instance = [[APIHandler alloc] init];
        instance.requestQueue = [[NSOperationQueue alloc] init];
        instance.requestQueue.maxConcurrentOperationCount = 1;
    });
    return instance;
}

- (void)requestAPIWithKey:(NSString *)apiKey completionHandler:(void (^)(BOOL isSuccess, id responseResult, NSError* error))resultHandler {
    [self.requestQueue cancelAllOperations];
    NSURLRequest *request = [self.requestBuilder buildAPIRequestWithKey:apiKey];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.requestQueue completionHandler:^(NSURLResponse *response, NSData *rawData, NSError *connectionError) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (rawData && !connectionError) {
                
                if (self.responseParser) {
                    NSError *parsingError = nil;
                    id parsedResult = [self.responseParser parseResponseData:rawData error:&parsingError];
                    if (parsingError || (parsedResult == nil)) {
                        if (resultHandler) {
                            resultHandler(NO, nil, parsingError);
                        }
                    } else {
                        if (resultHandler) {
                            resultHandler(YES, parsedResult, nil);
                        }
                    }
                } else {
                    resultHandler(YES, rawData, nil);
                }
            } else {
                if (resultHandler) {
                    resultHandler(NO, nil, connectionError);
                }
            }
        });
    }];
}

@end
