//
//  HTTPService.m
//  ShowBestTutsFromWeb
//
//  Created by Админ on 09.03.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import "HTTPService.h"

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

@end