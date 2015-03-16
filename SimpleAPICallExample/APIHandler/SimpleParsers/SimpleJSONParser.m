//
//  SimpleJSONParser.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "SimpleJSONParser.h"

@implementation SimpleJSONParser

#pragma mark - APIResponseParser
- (NSDictionary *)parseResponseData:(NSData *)responseData error:(NSError **)error {
    NSError *jsonError;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&jsonError];
    if (jsonError) {
        *error = jsonError;
        return nil;
    } else {
        return dictionary;
    }
    
}

@end
