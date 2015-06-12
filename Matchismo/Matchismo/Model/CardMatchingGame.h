//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Liangchuan Gu on 10/05/2014.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardGame.h"
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : CardGame

// designated initializer
- (instancetype) initWithCardCount: (NSInteger) count
                         usingDeck: (Deck *) deck
                      matchCardNum: (NSInteger)num;
- (void) chooseCardAtIndex: (NSInteger) index;

@end
