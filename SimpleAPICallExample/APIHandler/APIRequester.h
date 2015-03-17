//
//  APIRequester.h
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIRequester <NSObject>

- (void)sendRequest:(NSURLRequest *)request completion:(void (^)(NSURLResponse* response, NSData* rawData, NSError* connectionError))completion;

@end
