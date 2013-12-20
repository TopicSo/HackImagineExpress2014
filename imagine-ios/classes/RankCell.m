//
//  RankCell.m
//  imagine
//
//  Created by Apple on 19/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "RankCell.h"

#import <QuartzCore/QuartzCore.h>
@interface RankCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

@end
@implementation RankCell

- (void)awakeFromNib
{
    self.avatarView.layer.cornerRadius = self.avatarView.frame.size.height / 2;
    self.avatarView.layer.masksToBounds = YES;
    
    self.contentView.layer.cornerRadius = self.contentView.frame.size.height / 2;
    self.contentView.layer.masksToBounds = YES;
}

- (void)setAvatar:(NSURL *)url{
    [self.avatarView setImageWithURL:url];
}

- (void)setUserame:(NSString *)username{
    self.usernameLabel.text = username;
}

- (void)setRank:(int)rank{
    self.rankLabel.text = [NSString stringWithFormat:@"%d", rank];
}


- (void)setCode:(NSString *)code{
    self.rankLabel.text = code;
}


@end
