//
//  AppDelegate.m
//  imagine
//
//  Created by Apple on 19/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "AppDelegate.h"

#import <OBConnection/OBConnection.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.navigationController = [[UINavigationController alloc] init];

    BOOL logged = NO;
    BOOL dateExpressIsExpired = NO;
    
    if (logged)
    {
        self.me = [User createOriol];
    }
    
    if (dateExpressIsExpired)
    {
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:[[ResultViewController alloc] init]];
    }
    else
    {
        if (logged)
        {
            self.navigationController = [[UINavigationController alloc] initWithRootViewController:[[DateExpressViewController alloc] init]];
        }
        else
        {
            self.navigationController = [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
        }
    }
    
    [OBConnection registerWithBaseUrl:[NSURL URLWithString:@"http://localhost:9000/"]];

    self.navigationController.navigationBarHidden = YES;
    self.window.rootViewController = self.navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
