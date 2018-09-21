//
//  TimeLabel.h
//  WhatTimeIsItRightNow
//
//  Created by Drew Sullivan on 9/19/18.
//  Copyright © 2018 Drew Sullivan, DMA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeAdjusterDelegate.h"

@interface TimeAdjuster : NSObject

@property (nonatomic, weak) id <TimeAdjusterDelegate> delegate;

- (void)adjustCurrentTime:(TimeAdjuster *)adjuster;
- (void)adjustPreviousTime:(TimeAdjuster *)adjuster;
- (void)updateNumClicks:(TimeAdjuster *)adjuster;

@end
