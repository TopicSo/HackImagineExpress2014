//
//  LoginViewController.m
//  imagine
//
//  Created by Apple on 19/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
- (IBAction)loginButtonPressed:(id)sender;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor imagineColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(id)sender
{
    [self logged];
}

- (void)logged
{
    appDelegate.me = [User createOriol];
    BOOL dateExpressIsExpired = NO;
    
    if (dateExpressIsExpired)
    {
        [self.navigationController pushViewController:[[ResultViewController alloc] init] animated:YES];
    }
    else
    {
        [self.navigationController pushViewController:[[DateExpressViewController alloc] init] animated:YES];
    }
}

@end
