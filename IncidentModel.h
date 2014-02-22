//
//  IncidentModel.h
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class UserModel;

@interface IncidentModel : NSObject

@property (copy, nonatomic) NSString *description;
@property (strong, nonatomic) NSDate *date;
@property (nonatomic) CLLocationCoordinate2D location;
@property (strong, nonatomic) UIImage *photo;
@property (nonatomic) NSInteger severity;
@property (strong, nonatomic) UserModel *user;

@end
