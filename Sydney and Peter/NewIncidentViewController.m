//
//  NewIncidentViewController.m
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "NewIncidentViewController.h"
#import <Parse/Parse.h>

@interface NewIncidentViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) PFGeoPoint *geoPoint;
@end

@implementation NewIncidentViewController

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
    self.titleLabel.delegate = self;
    self.description.delegate = self;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseImage:)];
    tapGesture.numberOfTapsRequired = 1;

    [self.imageView addGestureRecognizer:tapGesture];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        self.geoPoint = geoPoint;
        NSString *latLongString = [NSString stringWithFormat:@"%lf,%lf", geoPoint.latitude, geoPoint.longitude];
        self.latLongLabel.text = latLongString;
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"Info: %@", info);
    self.imageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)chooseImage:(id)sender
{
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.delegate = self;
    self.picker.allowsEditing = YES;
    [self presentViewController:self.picker
                       animated:YES
                     completion:nil];
}

- (IBAction)submitNewIncident:(id)sender
{
    NSData *imageData = UIImageJPEGRepresentation(self.imageView.image, 0.05f);
    
    PFObject *testObject = [PFObject objectWithClassName:@"Incident"];
    [testObject setObject:self.titleLabel.text forKey:@"title"];
    [testObject setObject:self.description.text forKey:@"description"];
    [testObject setObject:[NSDate date] forKey:@"date"];
    [testObject setObject:self.geoPoint forKey:@"location"];
    [testObject setObject:imageData forKey:@"photo"];
    [testObject setObject:[self severityOfIncident] forKey:@"severity"];
    [testObject setObject:@"User" forKey:@"user"];
    [testObject setObject:@(1) forKey:@"open"];
    
    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved"
                                                            message:@"Thank you for reporting this incident"
                                                           delegate:nil
                                                  cancelButtonTitle:@"WOo"
                                                  otherButtonTitles:nil, nil];
            [alert show];
            self.titleLabel.text = nil;
            self.description.text = nil;
            self.latLongLabel.text = nil;
//            self.imageView.image = nil;
            UIImage *image = [UIImage imageNamed:@"selectPhoto_placeholder"];
            self.imageView.image = image;
        } else {
            NSLog(@"Failure :( ");
        }
    }];
}

- (NSNumber *)severityOfIncident
{
    if ([self.severityLevelOne isSelected]) {
        return @1;
    } else if ([self.severityLevelTwo isSelected]){
        return @2;
    } else {
        return @3;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
