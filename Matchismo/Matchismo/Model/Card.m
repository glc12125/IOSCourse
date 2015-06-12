//
//  Card.m
//  Matchismo
//
//  Created by Liangchuan Gu on 02/05/2014.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

-(int) match:(NSArray *)otherCards
{
    int score=0;
    for(Card * card in otherCards)
    {
        if([card.contents isEqualToString:self.contents])
        {
            score=1;
        }
    }
    
    return score;
}

@end
