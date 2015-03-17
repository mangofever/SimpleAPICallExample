//
//  SimpleAPIRequester.h
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequester.h"

@interface SimpleAPIRequester : NSObject <APIRequester>

@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) void (^completion)(NSURLResponse* response, NSData* rawData, NSError* connectionError);
@property (nonatomic, strong) NSURLConnection *connection;

@end
