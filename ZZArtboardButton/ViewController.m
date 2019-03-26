//
//  ViewController.m
//  
//
//  Created by Jungle on 2019/3/26.
//  Copyright (c) 2019. All rights reserved.
//

#import "ViewController.h"
#import "ZZArtboardButton.h"
#import "BXArtboardButton.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createButton0];
    [self createButton1];
    [self createButton2];
    [self createButton3];
    [self createButton4];
    [self createButton5];
    [self createButton6];
    [self createButton7];
    [self createButton8];
    [self createBXButtonUp];
    [self createBXButtonDown];
    [self createZZUpButton];
    [self createZZDownButton];
}

- (void)createButton0 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 34.0, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColor:[UIColor blueColor] forState:UIControlStateNormal];
    [customButton setBackgroundImageWithColor:[UIColor redColor] forState:UIControlStateHighlighted | UIControlStateSelected];
    [customButton setBackgroundImageWithColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [customButton addTarget:self action:@selector(bxClearClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customButton];
}

- (void)createButton1 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100.0, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:customButton];
}

- (void)createButton2 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColor:[UIColor redColor] boderColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:customButton];
}

- (void)createButton3 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*2, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] boderColor:[UIColor blackColor] forState:UIControlStateNormal directionType:BXArtboardDirectionTypeDefault];
    [self.view addSubview:customButton];
}

- (void)createButton4 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*3, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] boderColor:[UIColor blackColor] forState:UIControlStateNormal directionType:BXArtboardDirectionTypeTopToBottom];
    [self.view addSubview:customButton];
}

- (void)createButton5 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*4, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] boderColor:[UIColor blackColor] forState:UIControlStateNormal directionType:BXArtboardDirectionTypeLeftToRight];
    [self.view addSubview:customButton];
}

- (void)createButton6 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*5, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] forState:UIControlStateNormal directionType:BXArtboardDirectionTypeLeftTopToRightBottom];
    [self.view addSubview:customButton];
}

- (void)createButton7 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*6, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] forState:UIControlStateNormal];
    [self.view addSubview:customButton];
}

- (void)createButton8 {
    BXArtboardButton *customButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*7, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] forState:UIControlStateNormal directionType:BXArtboardDirectionTypeTopToBottom];
    [self.view addSubview:customButton];
}

- (void)createBXButtonUp {
    BXArtboardButton *upButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*8, SCREEN_WIDTH/2.0, 44.0);
    [upButton setType:BXArtboardTypeUp textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型一 正常状态"];
    [upButton setUpTitles];
    [upButton addTarget:self action:@selector(bxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upButton];
}

- (void)createBXButtonDown {
    BXArtboardButton *upButton = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*9, SCREEN_WIDTH/2.0, 44.0);
    [upButton setType:BXArtboardTypeDown textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型一 正常状态"];
    [upButton setDownTitles];
    [upButton addTarget:self action:@selector(bxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upButton];
}

- (void)createZZUpButton {
    ZZArtboardButton *upButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*10, SCREEN_WIDTH/2.0, 44.0);
    [upButton setType:ZZArtboardTypeUp textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型一 正常状态"];
    [upButton setUpTitles];
    [upButton addTarget:self action:@selector(zzClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upButton];
}

- (void)createZZDownButton {
    ZZArtboardButton *downButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*11, SCREEN_WIDTH/2.0, 44.0);
    [downButton setType:ZZArtboardTypeDown textColor:[UIColor colorWithHex:@"#1D9AFF"] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型二 正常状态"];
    [downButton setDownTitles];
    [downButton addTarget:self action:@selector(zzClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downButton];
}

- (void)bxClearClick:(BXArtboardButton *)button {
    [button clearAllBackgroundImages];
    if (!button.selected) {
        button.selected = YES;
    } else {
        button.enabled = NO;
        button.selected = NO;
    }
    [button setBackgroundImageWithColors:@[[UIColor redColor], [UIColor blackColor]] forState:UIControlStateNormal directionType:BXArtboardDirectionTypeDefault];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        button.enabled = YES;
    });
}

- (void)bxClick:(BXArtboardButton *)button {
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

- (void)zzClick:(ZZArtboardButton *)button {
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
