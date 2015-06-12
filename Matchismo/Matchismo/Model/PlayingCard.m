//
//  PlayingCard.m
//  Matchismo
//
//  Created by Liangchuan Gu on 02/05/2014.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "PlayingCard.h"



@implementation PlayingCard

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1) {
        PlayingCard* playingCard = [otherCards firstObject];
        if (playingCard.rank ==self.rank) {
            score = 4;
        } else if ([playingCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    } else {
        int matchedRank = 0;
        int matchedSuit = 0;
        for (PlayingCard * playingCard in otherCards) {
            if (playingCard.rank ==self.rank) {
                ++matchedRank;
                score += pow(4,matchedRank);
            } else if ([playingCard.suit isEqualToString:self.suit]) {
                ++matchedSuit;
                score += pow(2,matchedSuit);
            }
        }
        for (int i = 0; i < otherCards.count; ++i) {
            for (int j = i + 1; j < otherCards.count; ++j) {
                if ([[otherCards objectAtIndex:i] rank] == [[otherCards objectAtIndex:j] rank]) {
                    ++matchedRank;
                    score += pow(4,matchedRank);
                } else if ([[[otherCards objectAtIndex:i] suit] isEqualToString:[[otherCards objectAtIndex:j] suit]]) {
                    ++matchedSuit;
                    score += pow(2,matchedSuit);
                }

            }
        }
    }
    
    return score;
}

-(NSString *) contents
{
    NSArray * rankStrings=[PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

-(NSString *)suit
{
    return _suit?_suit :@"?";
}

-(void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

+(NSArray *)validSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}

-(void) setRank:(NSUInteger)rank
{
    if(rank <=[PlayingCard maxRank])
    {
        _rank=rank;
    }
}
@end
