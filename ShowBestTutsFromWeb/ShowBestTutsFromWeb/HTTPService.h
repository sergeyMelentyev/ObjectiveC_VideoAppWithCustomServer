//
//  HTTPService.h
//  ShowBestTutsFromWeb
//
//  Created by Админ on 09.03.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSDictionary * __nullable dataDict, NSString * __nullable errMessage);

@interface HTTPService : NSObject

// CREATE A STATIC FUNC DEFINITION. CAN BE CALLED GLOBALY ON A CLASS
+(id) instance;

-(void) getTutorials:(nullable onComplete)completionHandler;

@end