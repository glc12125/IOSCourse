//
//  Card.h
//  Matchismo
//
//  Created by Liangchuan Gu on 02/05/2014.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong,nonatomic) NSString * contents;

@property(nonatomic, getter = isChosen) BOOL chosen;
@property(nonatomic,getter = isMatched) BOOL matched;

-(int)match:(NSArray *) otherCards;

@end
