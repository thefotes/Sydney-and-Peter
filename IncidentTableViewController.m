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
#import "PFSingleIncidentViewController.h"

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

    if([sev compare:[NSNumber numberWithInt:1]]){
        cell.incidentSeverityValueLabel.text = @"!";
        cell.incidentSeverityValueLabel.backgroundColor = [UIColor colorWithRed:0.22f green:0.537f blue:0.058f alpha:1];
    }
    else if([sev compare:[NSNumber numberWithInt:2]]){
        cell.incidentSeverityValueLabel.text = @"!!";
        cell.incidentSeverityValueLabel.backgroundColor = [UIColor colorWithRed:1.0f green:0.56f blue:0.11f alpha:1];
    }
    else{
        cell.incidentSeverityValueLabel.text = @"!!!";
        cell.incidentSeverityValueLabel.backgroundColor = [UIColor colorWithRed:1.0f green:0.117f blue:0.16f alpha:1];
    }
    [cell.incidentSeverityValueLabel.layer setCornerRadius:22];
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.incidents.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PFSingleIncidentViewController *vc = segue.destinationViewController;
    vc.incident = [self.incidents objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:NO];
}
@end
