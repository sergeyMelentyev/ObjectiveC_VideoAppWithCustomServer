//
//  ViewController.m
//  ShowBestTutsFromWeb
//
//  Created by Админ on 09.03.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;
@end

@implementation ViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.videoList = [[NSArray alloc] init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSMutableArray *arrOfVideosForTableView = [[NSMutableArray alloc] init];
            for (NSDictionary *d in dataArray) {
                Video *vid = [[Video alloc] init];
                vid.videoTitle = [d objectForKey:@"videoTitle"];
                vid.videoDescription = [d objectForKey:@"videoDescription"];
                vid.videoIframe = [d objectForKey:@"videoIframe"];
                vid.thumbnailUrl = [d objectForKey:@"thumbnailUrl"];
                [arrOfVideosForTableView addObject:vid];
            }
            self.videoList = arrOfVideosForTableView;
        } else if (errMessage) {
            // Alert user with error
        }
    }];
}
// CUSTOM FUNCTION FOR PUTTING TABLEVIEW BACK TO THE MAIN THREAD AND UPGRADE IT
-(void) updateTableData {
    
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
@end









