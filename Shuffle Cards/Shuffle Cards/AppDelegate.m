//
//  AppDelegate.m
//  Shuffle Cards
//
//  Created by Rohan Aurora on 6/17/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    CardsViewController *cardsVc = [[CardsViewController alloc] init];
    cardsVc.title = @"Cards";
    UINavigationController *theNav = [[UINavigationController alloc] initWithRootViewController:cardsVc];
    
    self.window.rootViewController = theNav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end