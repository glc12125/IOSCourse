//
//  HistoryViewController.m
//  Matchismo
//
//  Created by Liangchuan Gu on 12/06/2015.
//  Copyright (c) 2015 CS193P. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (id record in self.playHistory) {
        if ([record isKindOfClass:[NSString class]]) {
            self.historyTextView.text = [NSString stringWithFormat:@"%@\n%@", self.historyTextView.text, (NSString*) record];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
