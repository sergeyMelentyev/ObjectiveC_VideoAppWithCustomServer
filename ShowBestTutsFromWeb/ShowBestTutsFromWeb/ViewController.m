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
#import "VideoCell.h"
#import "VideoViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;
@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.videoList = [[NSArray alloc] init];
    
    // FROM NOW WORKING ON A BACKGROUND THREAD
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
            [self updateTableData];
        } else if (errMessage) {
            // Alert user with error
        }
    }];
}
// CUSTOM FUNCTION FOR PUTTING TABLEVIEW BACK TO THE MAIN THREAD AND UPGRADE IT
- (void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"main"];
    if (!cell) {
        cell = [[VideoCell alloc] init];
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *vidCell = (VideoCell*)cell;
    [vidCell updateUI:video];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"videoViewController" sender:video];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoViewController *vc = (VideoViewController*)segue.destinationViewController;
    Video *video = (Video*)sender;
    vc.video = video;
}
@end









