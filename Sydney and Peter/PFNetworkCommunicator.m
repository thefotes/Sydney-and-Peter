//
//  PFNetworkCommunicator.m
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PFNetworkCommunicator.h"
#import <Parse/Parse.h>

@implementation PFNetworkCommunicator

+ (instancetype)sharedCommunicator
{
    static id sharedCommunicator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCommunicator = [[self alloc] init];
    });
    return sharedCommunicator;
}

- (void)fetchAllIncidentsWithCompletion:(RequestCompletionBlock)completionBlock
{
    PFQuery *query = [PFQuery queryWithClassName:@"Incident"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if (completionBlock) {
                completionBlock(YES, objects, nil);
            }
        } else {
            if (completionBlock) {
                completionBlock(NO, nil, error);
            }
        }
    }];
}

@end
