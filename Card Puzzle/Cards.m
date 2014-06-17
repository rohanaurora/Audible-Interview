//
//  Cards.m
//  Card Puzzle
//
//  Created by Rohan Aurora on 6/16/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import "Cards.h"

@implementation Cards

// Array for suits
+(NSArray*)suits
{
    NSArray *suits = [[NSArray alloc] init];
    suits = @[@"Clubs", @"Hearts", @"Diamonds", @"Spades"];

    return suits;
}

// Array for 13 values
+(NSArray*)values
{
    NSArray *values = [[NSArray alloc] init];
    for ( int i = 1 ; i <= 13 ; i++ ) {
        
        // Got hint from http://stackoverflow.com/questions/1828327/nsarray-initialization-with-numbers
        values = [values arrayByAddingObject: [NSNumber numberWithInt: i]];
    }
    return values;
}

@end
