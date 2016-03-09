//
//  HTTPService.m
//  ShowBestTutsFromWeb
//
//  Created by Админ on 09.03.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import "HTTPService.h"
#define URL_BASE "http://localhost:6060"
#define URL_TOTORIALS "/tutorials"

// CREATE A SINGLETON
@implementation HTTPService

+(id) instance {
    static HTTPService *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
        return sharedInstance;
    }
}

-(void) getTitorials {
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat: @"%s%s", URL_BASE, URL_TOTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            if (err != nil) {
                NSLog(@"%@", json.debugDescription);
            }
        } else {
            NSLog(@"Answer to server in case of error: %@", error.debugDescription);
        }
        
    }] resume];
}

@end