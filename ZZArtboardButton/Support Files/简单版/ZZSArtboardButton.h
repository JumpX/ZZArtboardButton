//
//  ZZSArtboardButton.h
//  ZZSArtboardButton
//
//  Created by Jungle on 2019/3/26.
//  Copyright (c) 2019. All rights reserved.
//  简版
//  定制全局按钮：带有圆角、背景图渐变色（或许有1px的框）

#import <UIKit/UIKit.h>
#import "UIColor+ZZAdd.h"

typedef NS_ENUM(NSInteger, ZZSArtboardType) {
    ZZSArtboardTypeUp,
    ZZSArtboardTypeDown
};

NS_ASSUME_NONNULL_BEGIN

@interface ZZSArtboardButton : UIButton

@property (nonatomic, assign) ZZSArtboardType artboardType;

- (void)setType:(ZZSArtboardType)type textColor:(UIColor *)textColor font:(UIFont *)font text:(NSString *)text;

- (void)setUpTitles;
- (void)setDownTitles;

@end

NS_ASSUME_NONNULL_END
