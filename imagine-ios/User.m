//
//  User.m
//  imagine
//
//  Created by Apple on 19/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "User.h"

#import <NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "MTLValueTransformer.h"

@implementation User

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"userId": @"userId",
             @"username": @"username",
             @"avatar": @"avatar",
             @"code": @"code",
             @"rank": @"rank"
             };
}

+ (User *)createOriol
{
    User *user = [[User alloc] init];
    user.username = @"Oriol";
    user.code = @"D12";
    user.avatar = @"http://images.ak.instagram.com/profiles/profile_11704238_75sq_1320963894.jpg";
    user.rank = 3;
    
    return user;
}

@end
