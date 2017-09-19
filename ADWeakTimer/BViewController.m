//
//  BViewController.m
//  ADWeakTimer
//
//  Created by Andy on 2017/9/13.
//  Copyright © 2017年 Kangsheng. All rights reserved.
//

#import "BViewController.h"
#import "NSTimer+ADWeakTimer.h"

@interface BViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BOOL isBlock = NO;

    if (isBlock) {
        // Block as call back
        self.timer = [NSTimer ad_scheduledTimerWithTimeInterval:1.0 event:^{
            NSLog(@"... updateTime ...");
        } repeats:YES];
    }else {
        // Target and selector
        self.timer = [NSTimer ad_scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)updateTime:(NSTimer *)fire
{
    NSLog(@"%s ... updateTime ... ", __FUNCTION__);
}

- (void)dealloc
{
    NSLog(@"%s ... dealloc ... ", __FUNCTION__);
    [self.timer invalidate];
}


@end
