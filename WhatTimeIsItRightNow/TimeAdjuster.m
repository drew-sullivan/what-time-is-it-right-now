//
//  TimeLabel.m
//  WhatTimeIsItRightNow
//
//  Created by Drew Sullivan on 9/19/18.
//  Copyright © 2018 Drew Sullivan, DMA. All rights reserved.
//

#import "TimeAdjuster.h"

@interface TimeAdjuster ()

@property (strong, nonatomic) UIButton *whatTimeIsItNowButton;
@property (strong, nonatomic) NSString* currentTimeAsString;
@property (strong, nonatomic) NSString* previousTimeAsString;
@property (assign) int numClicks;

@end


@implementation TimeAdjuster

- (void)adjustCurrentTime:(TimeAdjuster *)adjuster {
    NSString *timeString = [self getNowAsString];
    self.numClicks++;
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

- (NSString *)getNowAsString {
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ssa"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    return dateString;
}

@end
