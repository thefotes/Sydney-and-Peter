//
//  PFSingleIncidentViewController.h
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PFSingleIncidentViewController : UIViewController

@property (strong, nonatomic) NSDictionary *incident;
@property (weak, nonatomic) IBOutlet UIImageView *incidentImageView;
@property (weak, nonatomic) IBOutlet UILabel *incidentTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *incidentDescriptionTetField;
@property (weak, nonatomic) IBOutlet UILabel *incidentLocationLabel;

@end
