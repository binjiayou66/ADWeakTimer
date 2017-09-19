//
// NSTimer+ADWeakTimer.h
// Created by Andy on 2017/9/18.
// Copyright © 2017年 Kangsheng. All rights reserved.
// Github link: https://github.com/binjiayou66/ADWeakTimer
// Referred to Sunnyxx
//

#import "NSTimer+ADWeakTimer.h"

@interface ADWeakTimerTarget : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation ADWeakTimerTarget

- (void)fire:(NSTimer *)timer
{
    if(self.target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:timer.userInfo afterDelay:0.0f];
#pragma clang diagnostic pop
    } else {
        [self.timer invalidate];
    }
}

@end

@implementation NSTimer (ADWeakTimer)

#pragma mark - public method

+ (NSTimer *)ad_scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats
{
    ADWeakTimerTarget* timerTarget = [[ADWeakTimerTarget alloc] init];
    timerTarget.target = target;
    timerTarget.selector = selector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget
                                                       selector:@selector(fire:)
                                                       userInfo:userInfo
                                                        repeats:repeats];
    return timerTarget.timer;
}

+ (NSTimer *)ad_scheduledTimerWithTimeInterval:(NSTimeInterval)interval event:(void (^)())event repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(p_timerBlockInvoke:) userInfo:[event copy] repeats:repeats];
}

#pragma mark - private method

+ (void)p_timerBlockInvoke:(NSTimer *)timer
{
    void (^event)() = timer.userInfo;
    !event ?: event();
}

@end
