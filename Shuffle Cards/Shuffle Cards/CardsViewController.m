//
//  CardsViewController.m
//  Shuffle Cards
//
//  Created by Rohan Aurora on 6/17/14.
//  Copyright (c) 2014 Rohan Aurora. All rights reserved.
//

#import "CardsViewController.h"

#define NUMBER_OF_CARDS 13
#define NUMBER_OF_SUITES 4

#define CARD_SUITE @[@"Clubs",@"Spades",@"Diamonds", @"Hearts"]
#define CARD_VALUE @[@"Ace",@"2",@"3", @"4",@"5",@"6", @"7",@"8",@"9", @"10",@"Jack",@"Queen", @"King"]

@implementation CardsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createCards];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cardCell"];
    
    cardsArray = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Deal One" style:UIBarButtonItemStyleDone target:self action:@selector(dealACard)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
}

-(void)dealACard {
    if([theCards count] > 0) {
        [cardsArray insertObject:[theCards lastObject] atIndex:0];
        [theCards removeLastObject];
        [self.tableView reloadData];
    } else {
        NSLog(@"No More Cards - Shuffle Again");
        [self ShuffleAndCleanUp];
    }
}


-(void) ShuffleAndCleanUp {
    [cardsArray removeAllObjects];
    [self createCards];
    
}

// Generating a standard 52-card deck
-(void) createCards {
    int suite = 0;
    if(theCards) {
        theCards = nil;
    }
    theCards  = [[NSMutableArray alloc] init];
    
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
    
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cardsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cardCell" forIndexPath:indexPath];
    
    Card *theCard = [cardsArray objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d_%d.png",theCard.suite, theCard.value]];
    
    return cell;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

// Function to shuffle standard 52-deck
-(NSArray *) shuffleDeck:(NSMutableArray *) theCardArray{
    
    int totalCards = NUMBER_OF_CARDS*NUMBER_OF_SUITES;
    
    for (int i = 0; i<totalCards; i++) {
        [theCardArray exchangeObjectAtIndex:i withObjectAtIndex: i + arc4random()%(totalCards -i)];
    }
    
    return [NSArray arrayWithArray:theCardArray];
}


@end