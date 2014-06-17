//
//  Card.m
//  Shuffle Cards
//
//  Created by Rohan Aurora on 6/17/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)initWithSuite:(int)theSuite andValue:(int) theValue
{
    self = [super init];
    if (self) {
        self.suite = theSuite;
        self.value = theValue;
    }
    return self;
}
@end