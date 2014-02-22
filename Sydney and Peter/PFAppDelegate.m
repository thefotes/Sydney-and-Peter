//
//  PFAppDelegate.m
//  Sydney and Peter
//
//  Created by Peter Foti on 2/22/14.
//  Copyright (c) 2014 Peter Foti. All rights reserved.
//

#import "PFAppDelegate.h"
#import <Parse/Parse.h>

@implementation PFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [Parse setApplicationId:@"DwDJXiiF1IwHIGbD28ZhEWVSowyapOV6TaKR1Hzn"
                  clientKey:@"zWdGNZSHiKGKi05DAoCLbKUrEih9OvctGuVFIQwP"];
    

    UIImage *image = [UIImage imageNamed:@"graf.jpg"];
    NSData *dataImage = UIImageJPEGRepresentation(image, 0.05f);
    
    PFObject *testObject = [PFObject objectWithClassName:@"Incident"];
    [testObject setObject:@"Grafiti" forKey:@"title"];
    [testObject setObject:@"Grafiti en north wall" forKey:@"description"];
    [testObject setObject:[NSDate date] forKey:@"date"];
    [testObject setObject:@(80.0) forKey:@"location"];
    [testObject setObject:dataImage forKey:@"photo"];
    [testObject setObject:@(10) forKey:@"severity"];
    [testObject setObject:@"User" forKey:@"user"];
    [testObject setObject:@(0) forKey:@"open"];

    
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"Incident"];
////    [query includeKey:@"photo"];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (error) {
//            NSLog(@"Error: %@", error);
//        }
//        NSLog(@"Objects: %@", objects);
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
//        imageView.image = [UIImage imageWithData:[[objects objectAtIndex:1] objectForKey:@"photo"]];
//        [self.window addSubview:imageView];
//    }];
    
    [testObject saveInBackground];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
