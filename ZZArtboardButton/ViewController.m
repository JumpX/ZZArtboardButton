//
//  ViewController.m
//  
//
//  Created by Jungle on 2019/3/26.
//  Copyright (c) 2019. All rights reserved.
//

#import "ViewController.h"
#import "ZZArtboardButton.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUpButton];
    [self createDownButton];
}

- (void)createUpButton {
    ZZArtboardButton *upButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake(SCREEN_WIDTH/4.0, SCREEN_HEIGHT/2.0-55.0, SCREEN_WIDTH/2.0, 44.0);
    [upButton setType:BXArtboardTypeUp textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型一 正常状态"];
    [upButton setUpTitles];
    [upButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upButton];
}

- (void)createDownButton {
    ZZArtboardButton *downButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake(SCREEN_WIDTH/4.0, SCREEN_HEIGHT/2.0+11.0, SCREEN_WIDTH/2.0, 44.0);
    [downButton setType:BXArtboardTypeDown textColor:[UIColor colorWithHex:@"#1D9AFF"] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型二 正常状态"];
    [downButton setDownTitles];
    [downButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downButton];
}

- (void)click:(ZZArtboardButton *)button {
    if (!button.selected) {
        button.selected = YES;
    } else {
        button.enabled = NO;
        button.selected = NO;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        button.enabled = YES;
    });
}


@end
