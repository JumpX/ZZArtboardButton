//
//  ViewController.m
//  
//
//  Created by Jungle on 2019/3/26.
//  Copyright (c) 2019. All rights reserved.
//

#import "ViewController.h"
#import "ZZSArtboardButton.h"
#import "ZZArtboardButton.h"

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
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 34.0, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColor:[UIColor blueColor] forState:UIControlStateNormal];
    [customButton setBackgroundImageWithColor:[UIColor redColor] forState:UIControlStateHighlighted | UIControlStateSelected];
    [customButton setBackgroundImageWithColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [customButton addTarget:self action:@selector(bxClearClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customButton];
}

- (void)createButton1 {
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    customButton.bxAdjustsWhenHighlighted = NO;
    __weak typeof(customButton) weakButton = customButton;
    customButton.layoutCustomBackgroundImageBlock = ^{
        [weakButton setBackgroundImageWithColor:[UIColor redColor] forState:UIControlStateNormal];
        [weakButton setBackgroundImageWithColor:[UIColor blackColor] forState:UIControlStateSelected];
    };
    [customButton addTarget:self action:@selector(bxSelectedClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customButton];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100.0, SCREEN_WIDTH/2.0, 44.0);
}

- (void)createButton2 {
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0, SCREEN_WIDTH/2.0, 44.0);
    customButton.bxAdjustsWhenHighlighted = NO;
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    __weak typeof(customButton) weakButton = customButton;
    customButton.layoutCustomBackgroundImageBlock = ^{
        [weakButton setBackgroundImageWithColors:@[[UIColor redColor],[UIColor blueColor]] boderColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weakButton setBackgroundImageWithColors:@[[UIColor blueColor],[UIColor redColor]] boderColor:[UIColor blueColor] forState:UIControlStateSelected];
        weakButton.clipsToBounds = NO;
        [ZZArtboardButton setShadowWithLayer:weakButton.layer color:[UIColor randomColor] offset:CGSizeZero radius:10.0 opacity:0.8 height:25.0];
    };
    [customButton addTarget:self action:@selector(bxChangeFrameClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customButton];
}

- (void)createButton3 {
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*2, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor whiteColor], [UIColor blackColor], [UIColor whiteColor], [UIColor blackColor], [UIColor blackColor]] boderColor:[UIColor blackColor] forState:UIControlStateNormal directionType:ZZArtboardDirectionTypeDefault];
    customButton.clipsToBounds = NO;
    [ZZArtboardButton setShadowWithLayer:customButton.layer color:[UIColor blueColor] offset:CGSizeZero radius:10.0 opacity:0.5 height:25.0];
    [self.view addSubview:customButton];
}

- (void)createButton4 {
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*3, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blueColor], [UIColor whiteColor], [UIColor redColor]] boderColor:[UIColor blackColor] forState:UIControlStateNormal directionType:ZZArtboardDirectionTypeTopToBottom];
    [self.view addSubview:customButton];
}

- (void)createButton5 {
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*4, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blueColor], [UIColor redColor]] boderColor:[UIColor blackColor] forState:UIControlStateNormal directionType:ZZArtboardDirectionTypeLeftToRight];
    [self.view addSubview:customButton];
}

- (void)createButton6 {
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*5, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor redColor]] forState:UIControlStateNormal directionType:ZZArtboardDirectionTypeLeftTopToRightBottom];
    [self.view addSubview:customButton];
}

- (void)createButton7 {
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*6, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] forState:UIControlStateNormal];
    [self.view addSubview:customButton];
}

- (void)createButton8 {
    ZZArtboardButton *customButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    customButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*7, SCREEN_WIDTH/2.0, 44.0);
    [customButton setType:ZZArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义 正常状态"];
    [customButton setCustomTitles];
    [customButton setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] forState:UIControlStateNormal directionType:ZZArtboardDirectionTypeTopToBottom];
    [self.view addSubview:customButton];
}

- (void)createBXButtonUp {
    ZZArtboardButton *upButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*8, SCREEN_WIDTH/2.0, 44.0);
    [upButton setType:ZZArtboardTypeUp textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型一 正常状态"];
    [upButton setUpTitles];
    [upButton addTarget:self action:@selector(bxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upButton];
}

- (void)createBXButtonDown {
    ZZArtboardButton *upButton = [ZZArtboardButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*9, SCREEN_WIDTH/2.0, 44.0);
    [upButton setType:ZZArtboardTypeDown textColor:[UIColor colorWithHex:@"#1D9AFF"] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型一 正常状态"];
    [upButton setDownTitles];
    [upButton addTarget:self action:@selector(bxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upButton];
}

- (void)createZZUpButton {
    ZZSArtboardButton *upButton = [ZZSArtboardButton buttonWithType:UIButtonTypeCustom];
    upButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*10, SCREEN_WIDTH/2.0, 44.0);
    [upButton setType:ZZSArtboardTypeUp textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型一 正常状态"];
    [upButton setUpTitles];
    [upButton addTarget:self action:@selector(zzClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upButton];
}

- (void)createZZDownButton {
    ZZSArtboardButton *downButton = [ZZSArtboardButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake(SCREEN_WIDTH/4.0, 100+66.0*11, SCREEN_WIDTH/2.0, 44.0);
    [downButton setType:ZZSArtboardTypeDown textColor:[UIColor colorWithHex:@"#1D9AFF"] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"类型二 正常状态"];
    [downButton setDownTitles];
    [downButton addTarget:self action:@selector(zzClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downButton];
}

- (void)bxClearClick:(ZZArtboardButton *)button {
    [button clearAllBackgroundImages];
    if (!button.selected) {
        button.selected = YES;
    } else {
        button.enabled = NO;
        button.selected = NO;
    }
    [button setBackgroundImageWithColors:@[[UIColor redColor], [UIColor blackColor]] forState:UIControlStateNormal directionType:ZZArtboardDirectionTypeDefault];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        button.enabled = YES;
    });
}

- (void)bxSelectedClick:(ZZArtboardButton *)button {
    button.selected = !button.selected;
    button.frame = CGRectMake(10, 100, 200, 80);
}

- (void)bxChangeFrameClick:(ZZArtboardButton *)button {
    button.selected = !button.selected;
    CGRect rect = CGRectMake(150, 100+arc4random()%10, 200+arc4random()%20, 80+arc4random()%20);
    if (!CGRectEqualToRect(button.frame, rect)) {
        button.frame = rect;
    }
}

- (void)bxClick:(ZZArtboardButton *)button {
    CGRect rect = button.frame;
    rect.size.width = 300;
    rect.size.height = 60;
    button.frame = rect;
    if (!button.selected) {
        button.selected = YES;
    } else {
        button.enabled = NO;
        button.selected = NO;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        button.enabled = YES;
        CGRect rect = button.frame;
        rect.size.width = 240;
        rect.size.height = 40;
        button.frame = rect;
    });
}

- (void)zzClick:(ZZSArtboardButton *)button {
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
