//
//  APIRequestBuilder.h
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, APIRequestMethod){
    APIRequestMethodGET,
    APIRequestMethodPOST,
    APIRequestMethodPUT,
    APIRequestMethodDELETE
};

@interface APIRequestBuilder : NSObject

@property (nonatomic) NSTimeInterval timeoutInterval;

- (NSURLRequest *)buildAPIRequestWithURLString:(NSString *)urlString method:(APIRequestMethod)method;

@end
