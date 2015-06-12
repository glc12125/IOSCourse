//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Liangchuan Gu on 10/05/2014.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property(nonatomic, strong) NSMutableArray* matchedCards;
@property(nonatomic, readwrite) NSInteger matchCardNum;
@end

@implementation CardMatchingGame


- (NSMutableArray*) matchedCards
{
    if (!_matchedCards) {
        _matchedCards = [[NSMutableArray alloc] init];
    }
    return _matchedCards;
}

- (instancetype) initWithCardCount: (NSInteger) count
                         usingDeck: (Deck *) deck
                      matchCardNum: (NSInteger)num
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; ++i) {
            Card * card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.score = 0;
        self.matchCardNum = num;
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSInteger)index
{
    Card* card = [self cardAtIndex:index];
    
    if (card.isChosen) {
        card.chosen = NO;
    } else {
        if (self.matchedCards.count < self.matchCardNum) {
            if (self.matchedCards.count + 1 < self.matchCardNum) {
                card.chosen = YES;
                [self.matchedCards addObject:card];
                self.msg = [NSString stringWithFormat:@"%@", card.contents];
            } else {
                NSArray* cardsToMatch = [NSArray arrayWithArray:self.matchedCards];
                int matchScore = [card match:cardsToMatch];

                if (matchScore == 0) {
                    self.msg = [NSString stringWithFormat:@"%@ does not match with", card.contents];
                    self.score -= MISMATCH_PENALTY;
                    for (Card* otherCard in self.matchedCards) {
                        otherCard.matched = NO;
                        otherCard.chosen = NO;
                        self.msg = [self.msg stringByAppendingFormat:@" %@", otherCard.contents];
                    }
                    [self.matchedCards removeAllObjects];
                    [self.matchedCards addObject:card];
                    self.msg = [self.msg stringByAppendingFormat:@" penalty %d", MISMATCH_PENALTY];
                } else {
                    self.msg = [NSString stringWithFormat:@"%@ matches with", card.contents];
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card* otherCard in self.matchedCards) {
                        otherCard.matched = YES;
                        otherCard.chosen = YES;
                        self.msg = [self.msg stringByAppendingFormat:@" %@", otherCard.contents];
                    }
                    [self.matchedCards removeAllObjects];
                    self.msg = [self.msg stringByAppendingFormat:@" score %d", matchScore];
                }
                card.chosen = YES;
                self.score -= COST_TO_CHOOSE;
                
            }
        }
    }
}

@end

