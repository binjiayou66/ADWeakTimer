//
//  ViewController.m
//  ADWeakTimer
//
//  Created by Andy on 2017/9/13.
//  Copyright © 2017年 Kangsheng. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:arc4random() % 100 / 100.0 alpha:1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self presentViewController:[[BViewController alloc] init] animated:YES completion:nil];
}

@end
