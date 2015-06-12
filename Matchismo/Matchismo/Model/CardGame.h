//
//  CardGame.h
//  Matchismo
//
//  Created by Liangchuan Gu on 11/06/2015.
//  Copyright (c) 2015 CS193P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardGame : NSObject
- (void) chooseCardAtIndex: (NSInteger) index;
- (Card *) cardAtIndex: (NSInteger) index;

- (NSInteger) getScore;
- (void) setScore: (NSInteger) score;
- (NSString*) getMsg;
- (void) setMsg: (NSString*) msg;

@property(nonatomic) NSInteger score;
@property(nonatomic) NSString* msg;
@property(nonatomic, strong) NSMutableArray* cards; // of Card
@end
