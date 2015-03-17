//
//  ViewController.m
//  SimpleAPICallExample
//
//  Created by Mango on 2015. 3. 16..
//  Copyright (c) 2015년 Mangofever. All rights reserved.
//

#import "ViewController.h"
#import "SampleAPIBuilder.h"
#import "APIHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [SampleAPIBuilder buildAPI];
    
    [[APIHandler defaultAPIHandler] sendRequest:request identifier:@"temp" completionHandler:^(BOOL isSuccess, NSDictionary *responseResult, NSError *error) {
        NSLog(@">>>%@",responseResult.description);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
