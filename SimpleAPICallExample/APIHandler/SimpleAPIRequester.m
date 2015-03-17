//
//  SimpleAPIRequester.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "SimpleAPIRequester.h"

@implementation SimpleAPIRequester

- (void)sendRequest:(NSURLRequest *)request completion:(void (^)(NSURLResponse* response, NSData* rawData, NSError* connectionError))completion {
    
    self.completion = completion;
    self.receivedData = [NSMutableData dataWithCapacity:0];
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (!self.connection) {
        self.receivedData = nil;
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
    self.completion(nil, nil, error);
    self.connection = nil;
    self.receivedData = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.completion(nil, self.receivedData, nil);
    self.connection = nil;
    self.receivedData = nil;
}

@end
