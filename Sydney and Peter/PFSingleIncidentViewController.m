//
//  PFSingleIncidentViewController.m
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PFSingleIncidentViewController.h"
#import <Parse/Parse.h>
#import "SVProgressHUD.h"

#define METERS_PER_MILE 1609.344

@interface PFSingleIncidentViewController ()

@end

@implementation PFSingleIncidentViewController

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
	// Do any additional setup after loading the view.
    PFGeoPoint *geoPoint = [self.incident objectForKey:@"location"];
    CLLocationCoordinate2D location;
    location.latitude = geoPoint.latitude;
    location.longitude = geoPoint.longitude;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [self.incidentMapView setRegion:viewRegion animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.incidentImageView.image = [UIImage imageWithData:[self.incident objectForKey:@"photo"]];
    self.incidentTitleLabel.text = [self.incident objectForKey:@"title"];
    self.incidentDescriptionTetField.text = [self.incident objectForKey:@"description"];
}
- (IBAction)markAsResolved:(id)sender
{
    [SVProgressHUD showWithStatus:@"Beautifying" maskType:SVProgressHUDMaskTypeGradient];
    PFQuery *query = [PFQuery queryWithClassName:@"Incident"];

    [query getObjectInBackgroundWithId:self.object.objectId
                                 block:^(PFObject *object, NSError *error) {
                                     [object setObject:@0 forKey:@"open"];
                                     [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                         if (succeeded) {
                                             [SVProgressHUD dismiss];
                                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You!"
                                                                                             message:@"We appreciate your help in beautifying Gainesville"
                                                                                            delegate:self
                                                                                   cancelButtonTitle:@"You're Welcome"
                                                                                   otherButtonTitles:nil, nil];
                                             [alert show];
                                         }
                                     }];
                                 }];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"DId dismiss");
//    [self performSegueWithIdentifier:@"unwind" sender:self];
}
@end
