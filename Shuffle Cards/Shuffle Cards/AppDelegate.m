//
//  AppDelegate.m
//  Shuffle Cards
//
//  Created by Rohan Aurora on 6/17/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import "AppDelegate.h"
#import "Card.h"

#define NUMBER_OF_CARDS 13
#define NUMBER_OF_SUITES 4

#define CARD_SUITE @[@"Clubs",@"Spades",@"Diamonds", @"Hearts"]
#define CARD_VALUE @[@"Ace",@"2",@"3", @"4",@"5",@"6", @"7",@"8",@"9", @"10",@"Jack",@"Queen", @"King"]


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    int suite = 0;
    
    NSMutableArray *theCards  = [[NSMutableArray alloc] init];
    
    while (suite < NUMBER_OF_SUITES)
    {
        int cardNumber = 0;
        while (cardNumber < NUMBER_OF_CARDS) {
            
            Card *myCard = [[Card alloc] initWithSuite:suite andValue:cardNumber];
            
            [theCards addObject:myCard];
            cardNumber ++;
        }
        
        suite++;
    }
    
    for (Card *theCard in theCards) {
        NSLog(@"The Card is: %@ of %@",[CARD_VALUE objectAtIndex:theCard.value], [CARD_SUITE objectAtIndex:theCard.suite]);
        
    }
    
    NSArray *theShuffledDeck = [self shuffleDeck:theCards];
    
    for (Card *theCard in theShuffledDeck) {
        NSLog(@"The Card is: %@ of %@",[CARD_VALUE objectAtIndex:theCard.value], [CARD_SUITE objectAtIndex:theCard.suite]);
    }
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}





-(NSArray *) shuffleDeck:(NSMutableArray *) theCardArray{
    
    
    int totalCards = NUMBER_OF_CARDS*NUMBER_OF_SUITES;
    
    for (int i = 0; i<totalCards; i++) {
        [theCardArray exchangeObjectAtIndex:i withObjectAtIndex: i + arc4random()%(totalCards -i)];
    }
    
    return [NSArray arrayWithArray:theCardArray];
}
@end