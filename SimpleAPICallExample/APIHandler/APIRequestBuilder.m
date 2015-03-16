//
//  APIRequestBuilder.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "APIRequestBuilder.h"

@interface NSURL (URLEncodeSupport)

+ (NSURL *)encodedURLWithString:(NSString *)urlString;

@end

@implementation NSURL (URLEncodeSupport)

+ (NSURL *)encodedURLWithString:(NSString *)urlString {
    NSString* encodedURLString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:encodedURLString];
    
    return url;
}

@end



@implementation APIRequestBuilder

- (NSURLRequest *)buildAPIRequestWithURLString:(NSString *)urlString method:(APIRequestMethod)method{
    NSURL *url = [NSURL encodedURLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:self.timeoutInterval];
    [request setHTTPMethod:[self httpMethodStringOfAPIRequestMethod:method]];
    
    return request;
}

- (NSString *)httpMethodStringOfAPIRequestMethod:(APIRequestMethod)method {
    switch (method) {
        case APIRequestMethodGET:
            return @"GET";
            break;
        case APIRequestMethodPOST:
            return @"POST";
            break;
        case APIRequestMethodPUT:
            return @"PUT";
            break;
        case APIRequestMethodDELETE:
            return @"DELETE";
            break;
            
        default:
            return @"GET";
            break;
    }
}



@end
