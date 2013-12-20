//
//  DateExpressViewController.m
//  imagine
//
//  Created by Apple on 19/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "DateExpressViewController.h"

#import <QuartzCore/QuartzCore.h>
#import <OBConnection/OBConnection.h>

@interface DateExpressViewController () <UIAlertViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) NSArray *creativos;
@property (strong, nonatomic) NSArray *business;
@property (strong, nonatomic) User *datingUser;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
- (IBAction)datetabpressed:(id)sender;
- (IBAction)ranktabpressed:(id)sender;
- (IBAction)profiletabpressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *datetabview;
@property (weak, nonatomic) IBOutlet UIView *ranktabview;
@property (weak, nonatomic) IBOutlet UIView *profiletabview;

// date
@property (weak, nonatomic) IBOutlet UIImageView *myavatarimage;
@property (weak, nonatomic) IBOutlet UIImageView *dateavatar;
@property (weak, nonatomic) IBOutlet UILabel *myusernema;
@property (weak, nonatomic) IBOutlet UILabel *dateusername;
@property (weak, nonatomic) IBOutlet UIButton *selectDateButton;
- (IBAction)submitdatepressed:(id)sender;
- (IBAction)newDatePressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

// rank
@property (weak, nonatomic) IBOutlet UITableView *ctableview;
@property (weak, nonatomic) IBOutlet UITableView *btableview;

// profile
@property (weak, nonatomic) IBOutlet UIImageView *avatarimageview;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DateExpressViewController

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
    // todo
    self.datingUser = appDelegate.me;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor imagineColor];
    
    [self.myavatarimage setImageWithURL:[NSURL URLWithString:appDelegate.me.avatar]];
    self.myusernema.text = appDelegate.me.username;
    self.selectDateButton.titleLabel.numberOfLines = 3;
    [self.avatarimageview setImageWithURL:[NSURL URLWithString:appDelegate.me.avatar]];
    self.username.text = appDelegate.me.username;
    
    self.avatarimageview.layer.cornerRadius = self.avatarimageview.frame.size.height / 2;
    self.avatarimageview.layer.masksToBounds = YES;
    
    self.myavatarimage.layer.cornerRadius = self.myavatarimage.frame.size.height / 2;
    self.myavatarimage.layer.masksToBounds = YES;
    
    self.dateavatar.layer.cornerRadius = self.dateavatar.frame.size.height / 2;
    self.dateavatar.layer.masksToBounds = YES;
    
    self.creativos = @[[User createOriol], [User createOriol], [User createOriol]];
    
    self.business = @[[User createOriol], [User createOriol], [User createOriol], [User createOriol]];
    
    [self.ctableview registerNib:[UINib nibWithNibName:@"RankCell" bundle:nil] forCellReuseIdentifier:@"RankCell"];
    [self.btableview registerNib:[UINib nibWithNibName:@"RankCell" bundle:nil] forCellReuseIdentifier:@"RankCell"];
    
    [self prepareNewDate];
    [self loadRank];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)datetabpressed:(id)sender
{
    self.datetabview.hidden = NO;
    self.ranktabview.hidden = YES;
    self.profiletabview.hidden = YES;
    self.backgroundImage.image = [UIImage imageNamed:@"FirstTab.png"];
    self.view.backgroundColor = [UIColor imagineColor];
}

- (IBAction)ranktabpressed:(id)sender {
    self.datetabview.hidden = YES;
    self.ranktabview.hidden = NO;
    self.profiletabview.hidden = YES;
    self.backgroundImage.image = [UIImage imageNamed:@"SecondTab.png"];
    self.view.backgroundColor = [UIColor rankColor];
    
    [self loadRank];
}

- (void)loadRank
{
    OBRequest *request = [OBRequest requestWithType:OBRequestMethodTypeMethodGET
                                           resource:@"rank"
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
        
        [self.ctableview reloadData];
        [self.btableview reloadData];
        
    } error:^(id data, NSError *error) {
        NSLog(@"error");
    }];
}

- (IBAction)profiletabpressed:(id)sender {
    self.datetabview.hidden = YES;
    self.ranktabview.hidden = YES;
    self.profiletabview.hidden = NO;
    self.backgroundImage.image = [UIImage imageNamed:@"ThirthTab.png"];
    self.view.backgroundColor = [UIColor profileColor];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableView == self.ctableview ? [self.creativos count] : [self.business count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RankCell"];
    
    User *user = (tableView == self.ctableview) ? self.creativos[indexPath.row] : self.business[indexPath.row];
    
    [cell setAvatar:[NSURL URLWithString:user.avatar]];
    [cell setUserame:user.username];
    [cell setRank:user.rank];
    
    return cell;
}


- (IBAction)submitdatepressed:(id)sender
{
    NSString *message = [NSString stringWithFormat:@"Que nota le pones a %@ del 1 al 12?", self.datingUser.username];
    
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Bien otro más!" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    av.alertViewStyle = UIAlertViewStylePlainTextInput;
    [av textFieldAtIndex:0].delegate = self;
    [av show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    OBRequestParameters *parameters = [OBRequestParameters emptyRequestParameters];
    [parameters setValue:self.datingUser.code forKey:@"code"];
    [parameters setValue:self.datingUser.userId forKey:@"userId"];
    [parameters setValue:[[alertView textFieldAtIndex:0] text] forKey:@"rank"];
    
    OBRequest *request = [OBRequest requestWithType:OBRequestMethodTypeMethodPOST
                                           resource:@"date"
                                         parameters:parameters];
    
    [OBConnection makeRequest:request success:^(id data, BOOL cached) {
        
        [self prepareNewDate];
  
        
    } error:^(id data, NSError *error) {
        NSLog(@"error");
    }];
}

- (void)prepareNewDate
{
    [self.selectDateButton setTitle:@"Selecciona nueva cita" forState:UIControlStateNormal];
    
    self.dateusername.text = @"";
    self.submitButton.hidden = YES;
    self.dateavatar.image = nil;
}

- (void)newDateSelected:(User *)user
{
    self.datingUser = user;
    self.dateusername.text = user.username;
    [self.dateavatar setImageWithURL:[NSURL URLWithString:user.avatar]];
    [self.selectDateButton setTitle:@"" forState:UIControlStateNormal];
    self.submitButton.hidden = NO;
}

- (IBAction)newDatePressed:(id)sender
{
    SelectNewDateViewController *vie = [[SelectNewDateViewController alloc] init];
    vie.delegate = self;
    [self.navigationController pushViewController:vie animated:YES];
}
@end
