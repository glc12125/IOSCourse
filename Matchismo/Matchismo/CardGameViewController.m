//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Liangchuan Gu on 28/04/2014.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "HistoryViewController.h"

@interface CardGameViewController ()

@property (nonatomic, strong) CardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property(nonatomic, strong) NSMutableArray* playHistory;

@end

@implementation CardGameViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    if (!self.playHistory) {
        self.playHistory = [[NSMutableArray alloc] init];
    }
}

-(CardMatchingGame*) game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]
                                               matchCardNum:2];
    }
    
    return _game;
}

-(Deck*) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)cardTouchButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void) updateUI
{
    for (UIButton* cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
    self.msgLabel.text = self.game.msg;
    [self.playHistory addObject:self.game.msg];
}

-(NSString*) titleForCard:(Card*) card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage*) backgroundImageForCard:(Card*) card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

-(void) reStartGame
{
    for (UIButton* cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        card.chosen = false;
        card.matched = false;
    }
    [self updateUI];
    self.game = nil;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", 0];
    self.msgLabel.text = @"Start Game";
    [self.playHistory removeAllObjects];
}

- (IBAction)reStart:(UIButton *)sender
{
    [self reStartGame];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"matchToHistorySegue"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController* historyScreen = (HistoryViewController*)segue.destinationViewController;
            historyScreen.playHistory = self.playHistory;
        }
    }
}

@end
