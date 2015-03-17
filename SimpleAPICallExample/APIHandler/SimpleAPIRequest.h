//
//  SimpleAPIRequester.h
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIResponseParser.h"

@interface SimpleAPIRequest : NSObject

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) id<APIResponseParser> responseParser;
@property (nonatomic, strong) void (^completion)(BOOL isSuccess, id parsedResult, NSError* connectionError);

- (id)initWithRequest:(NSURLRequest *)request parse:(id<APIResponseParser>)parser;
- (id)initWithRequest:(NSURLRequest *)request identifier:(NSString *)identifier parse:(id<APIResponseParser>)parser;

- (void)startWithCompletion:(void (^)(BOOL isSuccess, id parsedResult, NSError* connectionError))completion;
- (void)cancel;

@end
