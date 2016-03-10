//
//  VideoCell.m
//  ShowBestTutsFromWeb
//
//  Created by Админ on 10.03.16.
//  Copyright © 2016 Melentyev. All rights reserved.
//

#import "VideoCell.h"

@interface VideoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descripLbl;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImg;
@property (weak, nonatomic) IBOutlet UIView *videoCellConteiner;
@end

@implementation VideoCell
-(void) awakeFromNib {
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
}
-(void) updateUI:(nonnull Video*)video {
    self.titleLbl.text = video.videoTitle;
    self.descripLbl.text = video.videoDescription;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: video.thumbnailUrl]]];
    self.thumbImg.image = image;
}
@end