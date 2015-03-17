//
//  SampleAPIBuilder.h
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleAPIRequest.h"

@interface SampleAPIBuilder : NSObject

+ (SimpleAPIRequest *)buildAPI;

@end
