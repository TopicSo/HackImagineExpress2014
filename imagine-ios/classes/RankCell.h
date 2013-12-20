//
//  RankCell.h
//  imagine
//
//  Created by Apple on 19/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankCell : UITableViewCell
- (void)setAvatar:(NSURL *)url;
- (void)setUserame:(NSString *)username;
- (void)setRank:(int)rank;
- (void)setCode:(NSString *)code;
@end
