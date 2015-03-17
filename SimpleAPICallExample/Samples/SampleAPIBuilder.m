//
//  SampleAPIBuilder.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "SampleAPIBuilder.h"
#import "SimpleJSONParser.h"

#define RequestTimeout 10

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

@implementation SampleAPIBuilder

+ (SimpleAPIRequest *)buildAPI {
    NSURL *url = [NSURL encodedURLWithString:@"http://coinabul.com/api.php"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:RequestTimeout];
    [request setHTTPMethod:@"GET"];
    
    SimpleAPIRequest *apiRequest = [[SimpleAPIRequest alloc] initWithRequest:request parse:nil];
    apiRequest.responseParser = [[SimpleJSONParser alloc] init];
    
    return apiRequest;
}

@end
