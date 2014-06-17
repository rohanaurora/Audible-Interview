//
//  CardsDeck.h
//  Card Puzzle
//
//  Created by Rohan Aurora on 6/16/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cards.h"

@interface CardsDeck : NSObject

@property (nonatomic, strong) NSMutableArray *cardsInDeck;


-(void) creatingDeck;
-(NSMutableArray*) shuffleDeck;


@end