//
//  PFSeverityButton.m
//  Sydney and Peter
//
//  Created by Sydney Richardson on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PFSeverityButton.h"

@implementation PFSeverityButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer setBorderWidth:1.0];
        [self.layer setCornerRadius:0.5];
        [self.layer setBorderColor:[self.color CGColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
