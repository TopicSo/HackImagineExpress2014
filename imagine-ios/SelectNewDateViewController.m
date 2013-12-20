//
//  SelectNewDateViewController.m
//  imagine
//
//  Created by Apple on 19/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "SelectNewDateViewController.h"

#import <OBConnection/OBConnection.h>
@interface SelectNewDateViewController ()
@property (strong, nonatomic) NSArray *creativos;
@property (strong, nonatomic) NSArray *business;
@end
@implementation SelectNewDateViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    self.title = @"Nueva Cita";
    
    self.tableView.backgroundColor = [UIColor imagineColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"RankCell" bundle:nil] forCellReuseIdentifier:@"RankCell"];
    self.tableView.rowHeight = 60.0;
    OBRequest *request = [OBRequest requestWithType:OBRequestMethodTypeMethodGET
                                           resource:@"nextDate"
                                         parameters:nil];
    
    [OBConnection makeRequest:request success:^(id data, BOOL cached) {
        NSMutableArray *parsedCreativos = [NSMutableArray array];
        
        for (NSDictionary *tmpUser in data[@"creativos"]) {
            User *user = [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:tmpUser error:nil];
            [parsedCreativos addObject:user];
        }

        NSMutableArray *parsedBusiness = [NSMutableArray array];
        
        for (NSDictionary *tmpUser in data[@"business"]) {
            User *user = [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:tmpUser error:nil];
            [parsedBusiness addObject:user];
        }

        self.business = [NSArray arrayWithArray:parsedBusiness];
        self.creativos = [NSArray arrayWithArray:parsedCreativos];
        
        [self.tableView reloadData];
    } error:^(id data, NSError *error) {
        NSLog(@"error");
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int s =0;
    if (self.creativos != nil && [self.creativos count] > 0)
        s++;
    if (self.business != nil && [self.business count] > 0)
        s++;
    return s;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.creativos != nil && [self.creativos count] > 0 && section == 0)
    {
        return [self.creativos count];
    }
    
    return [self.business count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return (self.creativos != nil && [self.creativos count] > 0 && section == 0) ? @"Creativos por conocer" : @"Business por conocer";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RankCell"];
    
    User *user;
    if (self.creativos != nil && [self.creativos count] > 0 && indexPath.section == 0)
    {
        user = self.creativos[indexPath.row];
    }
    else
    {
        user = self.business[indexPath.row];
    }
    
    [cell setAvatar:[NSURL URLWithString:user.avatar]];
    [cell setUserame:user.username];
    [cell setCode:user.code];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    User *user;
    if (self.creativos != nil && [self.creativos count] > 0 && indexPath.section == 0)
    {
        user = self.creativos[indexPath.row];
    }
    else
    {
        user = self.business[indexPath.row];
    }
    
    if ([self.delegate respondsToSelector:@selector(newDateSelected:)])
    {
        [self.delegate performSelector:@selector(newDateSelected:) withObject:user];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


@end
