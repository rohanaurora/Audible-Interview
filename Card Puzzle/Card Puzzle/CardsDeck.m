//
//  CardsDeck.m
//  Card Puzzle
//
//  Created by Rohan Aurora on 6/16/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import "CardsDeck.h"
#import "Cards.h"

@implementation CardsDeck

-(void) creatingDeck {
    
    // Got hint from - http://stackoverflow.com/questions/4546951/stupid-nsmutablearray-addobject-mistake
    self.cardsInDeck = [[NSMutableArray alloc] init];
    
    // Running both suits and values loop
    for (NSString *suit in [Cards suits]) {
        for (NSNumber *value in [Cards values] ) {
            
            // Creating new object from Cards
            Cards *awesomeCard = [[Cards alloc] init];
            
            // Adding values to newCard
            awesomeCard.suit =  suit;
            awesomeCard.value = [value intValue];
            
            
            // Inserting awesomeCard to the end of cardsInDeck
            [[self cardsInDeck] addObject:awesomeCard];
        }
    }
    
    // Calling shuffleDeck function below
    self.cardsInDeck = [self shuffleDeck];
    NSLog(@"Shuffling starts \n\n %@", self.cardsInDeck );
 
}


// Shuffling the deck
-(NSMutableArray*) shuffleDeck{
    
    for (int i = 0; i<52; i++) {
        
        // Got hint from http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray
        [self.cardsInDeck exchangeObjectAtIndex:i withObjectAtIndex: i + arc4random()%(52 -i)];
    }
    
    return self.cardsInDeck;
}
@end

