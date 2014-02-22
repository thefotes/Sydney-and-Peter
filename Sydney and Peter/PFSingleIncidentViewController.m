//
//  PFSingleIncidentViewController.m
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PFSingleIncidentViewController.h"

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
@end
