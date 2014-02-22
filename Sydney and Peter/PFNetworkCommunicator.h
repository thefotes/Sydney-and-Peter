//
//  PFNetworkCommunicator.h
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestCompletionBlock) (BOOL success, NSArray *objects, NSError *error);

@interface PFNetworkCommunicator : NSObject

+ (instancetype)sharedCommunicator;

- (void)fetchAllIncidentsWithCompletion:(RequestCompletionBlock)completionBlock;

- (void)fetchOpenIncidentsWithCompletion:(RequestCompletionBlock)completionBlock;
@end
