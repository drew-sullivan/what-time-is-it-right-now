//
//  TimeLabel.m
//  WhatTimeIsItRightNow
//
//  Created by Drew Sullivan on 9/19/18.
//  Copyright © 2018 Drew Sullivan, DMA. All rights reserved.
//

#import "TimeAdjuster.h"

@interface TimeAdjuster ()

@property (strong, nonatomic) UIButton* whatTimeIsItNowButton;
@property (strong, nonatomic) NSString* currentTimeAsString;
@property (strong, nonatomic) NSString* previousTimeAsString;
@property (strong, nonatomic) NSString* commentary;
@property (assign) int numClicks;

@end


@implementation TimeAdjuster

- (void)adjustCurrentTime:(TimeAdjuster *)adjuster {
    NSString *timeString = [self getNowAsString];
    self.numClicks++;
    self.commentary = [self updateCommentaryString];
    self.previousTimeAsString = self.currentTimeAsString;
    self.currentTimeAsString = timeString;
    [self.delegate timeAdjuster:self updateCurrentWithTimeString:self.currentTimeAsString];
}

- (void)adjustPreviousTime:(TimeAdjuster *)adjuster {
    [self.delegate timeAdjuster:self updatePreviousWithTimeString:self.previousTimeAsString];
}

- (void)updateNumClicks:(TimeAdjuster *)adjuster {
    [self.delegate timeAdjuster:self updateNumClicks:self.numClicks];
}

- (void)updateCommentary:(TimeAdjuster *)adjuster {
    [self.delegate timeAdjuster:self updateCommentary:self.commentary];
}

- (NSString *)getNowAsString {
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ssa"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    return dateString;
}

- (NSString *)updateCommentaryString {
    int numClicks = self.numClicks;
    if (numClicks >= 25) {
        return @"Alright, I'm blowing this thing up";
    } else if (numClicks >= 15) {
        return @"Don't you have other work you could be doing?";
    } else if (numClicks >= 13) {
        return @"This is getting serious";
    } else if (numClicks >= 10) {
        return @"We can call someone, if you'd like...";
    } else if (numClicks >= 5) {
        return @"Seriously?";
    } else if (numClicks >= 3) {
        return @"Are you ok?";
    } else {
        return @"";
    }
}

@end
