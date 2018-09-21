//
//  ViewController.m
//  WhatTimeIsItRightNow
//
//  Created by Drew Sullivan on 9/19/18.
//  Copyright © 2018 Drew Sullivan, DMA. All rights reserved.
//

#import "ViewController.h"
#import "TimeAdjuster.h"

@interface ViewController () <TimeAdjusterDelegate>

@property (strong, nonatomic) TimeAdjuster* timeAdjuster;
@property (strong, nonatomic) IBOutlet UILabel* currentTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *previousTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *numClicksLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentaryLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timeAdjuster = [[TimeAdjuster alloc] init];
    self.timeAdjuster.delegate = self;
    
    self.commentaryLabel.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)wasTapped:(id)sender {
    [self.timeAdjuster adjustCurrentTime:self.timeAdjuster];
    [self.timeAdjuster adjustPreviousTime:self.timeAdjuster];
    [self.timeAdjuster updateNumClicks:self.timeAdjuster];
    [self.timeAdjuster updateCommentary:self.timeAdjuster];
}

- (void)timeAdjuster:(TimeAdjuster *)timeAdjuster updateCurrentWithTimeString:(NSString *)timeString {
    self.currentTimeLabel.text = timeString;
}

- (void)timeAdjuster:(TimeAdjuster *)timeAdjuster updatePreviousWithTimeString:(NSString *)timeString {
    if (timeString != NULL) {
        NSString *previousTimeMessage = [[NSString alloc] initWithFormat:@"It used to be %@", timeString];
        self.previousTimeLabel.text = previousTimeMessage;
    } else {
        self.previousTimeLabel.text = @"...";
    }
}

- (void)timeAdjuster:(TimeAdjuster *)timeAdjuster updateNumClicks:(int)newNumClicks {
    NSString *numClicksLabel = [[NSString alloc] initWithFormat:@"You've now clicked %i time(s)", newNumClicks];
    self.numClicksLabel.text = numClicksLabel;
}

- (void)timeAdjuster:(TimeAdjuster *)timeAdjuster updateCommentary:(NSString *)commentaryString {
    self.commentaryLabel.text = commentaryString;
}

@end
