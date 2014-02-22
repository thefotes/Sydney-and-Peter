//
//  NewIncidentViewController.h
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewIncidentViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *description;
@property (weak, nonatomic) IBOutlet UIButton *severityLevelOne;
@property (weak, nonatomic) IBOutlet UIButton *severityLevelTwo;
@property (weak, nonatomic) IBOutlet UIButton *severityLevelThree;
@property (weak, nonatomic) IBOutlet UILabel *latLongLabel;

- (IBAction)setSeverityTwoSelected:(id)sender;
- (IBAction)setSeverityThreeSelected:(id)sender;
- (IBAction)setSeverityOneSelected:(id)sender;


- (void)chooseImage:(id)sender;
- (IBAction)submitNewIncident:(id)sender;

@end
