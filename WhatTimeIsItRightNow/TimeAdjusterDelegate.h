//
//  TimeDelegate.h
//  WhatTimeIsItRightNow
//
//  Created by Drew Sullivan on 9/19/18.
//  Copyright © 2018 Drew Sullivan, DMA. All rights reserved.
//

@class TimeAdjuster;

@protocol TimeAdjusterDelegate <NSObject>

- (void)timeAdjuster:(TimeAdjuster *)timeAdjuster updateCurrentWithTimeString:(NSString *)timeString;
- (void)timeAdjuster:(TimeAdjuster *)timeAdjuster updatePreviousWithTimeString:(NSString *)timeString;
- (void)timeAdjuster:(TimeAdjuster *)timeAdjuster updateNumClicks:(int)newNumClicks;

@end
