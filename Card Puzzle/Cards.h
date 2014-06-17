//
//  Cards.h
//  Card Puzzle
//
//  Created by Rohan Aurora on 6/16/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cards : NSObject

// Clubs (♣) Diamonds (♦) Hearts (♥) Spades (♠) are suits (total 4 suits)
@property (nonatomic, strong) NSString *suit;

// Cards 2-10 and Jack, King, Queen, Ace are the values (total 13 values)
@property (nonatomic, assign) int value;

// Creating array Class methods for them for easy access
+(NSArray*)suits;
+(NSArray*)values;

@end
