//
//  SimpleAPIRequest.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "SimpleAPIRequest.h"

@implementation SimpleAPIRequest

- (id)initWithRequest:(NSURLRequest *)request {
    return [self initWithRequest:request identifier:request.URL.absoluteString parse:nil];
}

- (id)initWithRequest:(NSURLRequest *)request parse:(id<APIResponseParser>)parser {
    return [self initWithRequest:request identifier:request.URL.absoluteString parse:parser];
}

- (id)initWithRequest:(NSURLRequest *)request identifier:(NSString *)identifier parse:(id<APIResponseParser>)parser {
    self = [super init];
    if (self) {
        self.request = request;
        self.responseParser = parser;
        self.identifier = identifier;
    }
    
    return self;
}

- (void)startWithCompletion:(void (^)(BOOL, id, NSError *))completion {
    self.receivedData = [NSMutableData dataWithCapacity:0];
    self.completion = completion;
    self.connection = [NSURLConnection connectionWithRequest:self.request delegate:self];
    
    if (!self.connection) {
        self.receivedData = nil;
    }
}

- (void)cancel {
    [self.connection cancel];
    self.connection = nil;
    self.completion = nil;
}

#pragma mark - Hanlding Response Data

- (void)handleResultData:(NSData *)data {
    if (self.responseParser) {
        NSError *parsingError = nil;
        id parsedResult = [self.responseParser parseResponseData:data error:&parsingError];
        if (parsingError || (parsedResult == nil)) {
            [self finishRequestWithError:parsingError];
        } else {
            [self finishRequestWithResult:parsedResult];
        }
    } else {
        [self finishRequestWithResult:data];
    }
}

- (void)finishRequestWithError:(NSError *)error {
    if (self.completion) {
        self.completion(NO, nil, error);
    }
}

- (void)finishRequestWithResult:(id)result {
    if (self.completion) {
        self.completion(YES, result, nil);
    }
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self finishRequestWithError:error];
    self.connection = nil;
    self.receivedData = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self handleResultData:self.receivedData];
    self.connection = nil;
    self.receivedData = nil;
}

@end
