//
// NSTimer+ADWeakTimer.h
// Created by Andy on 2017/9/18.
// Copyright © 2017年 Kangsheng. All rights reserved.
// Github link: https://github.com/binjiayou66/ADWeakTimer
// Referred to Sunnyxx
//

#import <Foundation/Foundation.h>

@interface NSTimer (ADWeakTimer)

/// Target and selector
+ (NSTimer *)ad_scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats;

/// Block as call back
+ (NSTimer *)ad_scheduledTimerWithTimeInterval:(NSTimeInterval)interval event:(void (^)())event repeats:(BOOL)repeats;

@end
