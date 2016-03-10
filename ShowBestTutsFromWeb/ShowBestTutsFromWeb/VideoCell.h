//
//  VideoCell.h
//  ShowBestTutsFromWeb
//
//  Created by Админ on 10.03.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface VideoCell : UITableViewCell
-(void) updateUI:(nonnull Video*)video;
@end