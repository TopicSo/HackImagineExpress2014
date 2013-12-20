//
//  User.h
//  imagine
//
//  Created by Apple on 19/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//


#import <MTLModel.h>
#import <MTLJSONAdapter.h>


@interface User : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, assign) int rank;
@property (nonatomic, strong) NSString *code;

+ (User *)createOriol;

@end
