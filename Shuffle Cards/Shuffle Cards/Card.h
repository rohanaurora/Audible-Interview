//
//  Card.h
//  Shuffle Cards
//
//  Created by Rohan Aurora on 6/17/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ENUM(int, CardSuite) {
    CardSuiteClubs = 0,
    CardSuiteSpades = 1,
    CardSuiteDiamonds = 2,
    CardSuiteHearts = 3
};

NS_ENUM(int, CardType) {
    CardTypeAce = 0,
    CardTypeTwo = 1,
    CardTypeThree = 2,
    CardTypeFour = 3,
    CardTypeFive = 4,
    CardTypeSix = 5,
    CardTypeSeven = 6,
    CardTypeEight = 7,
    CardTypeNine = 8,
    CardTypeTen = 9,
    CardTypeJack = 10,
    CardTypeQueen = 11,
    CardTypeKing = 12
};


@interface Card : NSObject

@property (nonatomic, assign) int suite;
@property (nonatomic, assign) int value;

- (instancetype)initWithSuite:(int)theSuite andValue:(int) theValue;

@end