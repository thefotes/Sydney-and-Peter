//
//  PFSingleIncidentViewController.h
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class PFObject;

@interface PFSingleIncidentViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) NSDictionary *incident;
@property (weak, nonatomic) IBOutlet UIImageView *incidentImageView;
@property (weak, nonatomic) IBOutlet UILabel *incidentTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *incidentDescriptionTetField;
@property (weak, nonatomic) IBOutlet UILabel *incidentLocationLabel;
@property (strong, nonatomic) PFObject *object;
@property (weak, nonatomic) IBOutlet MKMapView *incidentMapView;
- (IBAction)markAsResolved:(id)sender;

@end
