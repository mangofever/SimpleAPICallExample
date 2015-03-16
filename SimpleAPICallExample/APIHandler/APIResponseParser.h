//
//  APIResponseParser.h
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIResponseParser <NSObject>

- (id)parseResponseData:(NSData *)responseData error:(NSError **)error;

@end
