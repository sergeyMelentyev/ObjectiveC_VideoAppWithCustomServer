//
//  ViewController.m
//  ShowBestTutsFromWeb
//
//  Created by Админ on 09.03.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[HTTPService instance] getTutorials:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMessage) {
        if (dataDict) {
             
        } else if (errMessage) {
            // Alert user with error
        }
    }];
}

@end