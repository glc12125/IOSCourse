//
//  CardGame.m
//  Matchismo
//
//  Created by Liangchuan Gu on 11/06/2015.
//  Copyright (c) 2015 CS193P. All rights reserved.
//

#import "CardGame.h"

@implementation CardGame


- (NSMutableArray*) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}


- (void) chooseCardAtIndex: (NSInteger) index
{}

- (Card *) cardAtIndex:(NSInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

- (NSInteger) getScore
{
    return _score;
}
- (void) setScore: (NSInteger) score
{
    if (_score != score) {
        _score = score;
    }
}
- (NSString*) getMsg
{
    return _msg;
}
- (void) setMsg: (NSString*) msg
{
    if (_msg != msg) {
        _msg = [NSString stringWithString:msg];
    }
}

@end
