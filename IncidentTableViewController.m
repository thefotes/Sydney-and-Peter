//
//  IncidentTableViewController.m
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "IncidentTableViewController.h"
#import "PFIncidentCell.h"
#import "PFNetworkCommunicator.h"

@interface IncidentTableViewController ()

@property (copy, nonatomic) NSArray *incidents;

@end

@implementation IncidentTableViewController

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
//    [[PFNetworkCommunicator sharedCommunicator] fetchAllIncidentsWithCompletion:^(BOOL success, NSArray *objects, NSError *error) {
//        if (success) {
//            NSLog(@"Objects; %@", objects);
//            self.incidents = [objects copy];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.tableView reloadData];
//            });
//        } else {
//            NSLog(@"Error: %@", error);
//        }
//    }];
    
    [[PFNetworkCommunicator sharedCommunicator] fetchOpenIncidentsWithCompletion:^(BOOL success, NSArray *objects, NSError *error) {
        if (success) {
            NSLog(@"Objects; %@", objects);
            self.incidents = [objects copy];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
            NSLog(@"Error: %@", error);
        }
    }];
}

- (NSArray *)incidents
{
    return _incidents = _incidents ?: [NSArray new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFIncidentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[PFIncidentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.titleLabel.text = [[self.incidents objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.descLabel.text = [[self.incidents objectAtIndex:indexPath.row] objectForKey:@"description"];
    
    UIImage *image = [UIImage imageWithData:[[self.incidents objectAtIndex:indexPath.row] objectForKey:@"photo"]];
    cell.incidentImageView.image = image;
    
    NSNumber *sev = [[self.incidents objectAtIndex:indexPath.row] objectForKey:@"severity"];
    
    NSString *sevString;
    if([sev compare:[NSNumber numberWithInt:1]]){
        sevString = @"!";
    }
    else if([sev compare:[NSNumber numberWithInt:2]]){
        sevString = @"!!";
    }
    else
        sevString = @"!!!";
    
    cell.incidentSeverityValueLabel.text = sevString;
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.incidents.count;
}

@end
