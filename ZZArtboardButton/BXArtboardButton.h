//
//  BXArtboardButton.h
//  YppLife
//
//  Created by Jungle on 2019/3/25.
//  Copyright (c) 2019. All rights reserved.
//
//  定制全局按钮：带有圆角、1px的框、背景图渐变色

#import <UIKit/UIKit.h>
#import "UIColor+ZZAdd.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BXArtboardType) {
    BXArtboardTypeCustom,       // 自定义（普通的UIButton，不带任何效果）
    BXArtboardTypeUp,           // 类型一（蓝条：背景渐变色）
    BXArtboardTypeDown          // 类型二（白条：不渐变）
};

typedef NS_ENUM(NSInteger, BXArtboardDirectionType) {
    BXArtboardDirectionTypeDefault,                 // 左下 -> 右上（默认）
    BXArtboardDirectionTypeTopToBottom,             // 上 -> 下
    BXArtboardDirectionTypeLeftToRight,             // 左 -> 右
    BXArtboardDirectionTypeLeftTopToRightBottom     // 左上 -> 右下
};

@interface BXArtboardButton : UIButton

/* 主要方法 */
- (void)setType:(BXArtboardType)type textColor:(UIColor *)textColor font:(UIFont *)font text:(NSString *)text;


- (void)setCustomTitles;
- (void)setUpTitles;
- (void)setDownTitles;

/* 以下为可选方法 */
/* 建议只在 type = BXArtboardTypeCustom 时使用 */

- (void)setBackgroundImageWithUpNormalStyle;
- (void)setBackgroundImageWithUpHighlightedStyle;
- (void)setBackgroundImageWithUpDisableStyle;
- (void)setBackgroundImageWithDownNormalStyle;
- (void)setBackgroundImageWithDownHighlightedStyle;
- (void)setBackgroundImageWithDownDisableStyle;

/* 清除所有状态下背景图 */
- (void)clearAllBackgroundImages;

/**
 设置背景图（纯色）

 @param backgroundColor     背景色
 @param state               UIControlState
 */
- (void)setBackgroundImageWithColor:(UIColor *)backgroundColor
                           forState:(UIControlState)state;
/**
 设置背景图（纯色、带1px的框）

 @param backgroundColor     背景色
 @param boderColor          框颜色
 @param state               UIControlState
 */
- (void)setBackgroundImageWithColor:(UIColor *)backgroundColor
                         boderColor:(UIColor *)boderColor
                           forState:(UIControlState)state;
/**
 设置背景图（渐变色）
 
 @param backgroundColors    背景色数组
 @param state               UIControlState
 */
- (void)setBackgroundImageWithColors:(NSArray <UIColor *>*)backgroundColors
                            forState:(UIControlState)state;
/**
 设置背景图（渐变色、带1px的框）
 
 @param backgroundColors    背景色数组
 @param boderColor          框颜色
 @param state               UIControlState
 */
- (void)setBackgroundImageWithColors:(NSArray <UIColor *>*)backgroundColors
                          boderColor:(UIColor *)boderColor
                            forState:(UIControlState)state;
/**
 设置背景图（多个渐变色）

 @param backgroundColors    背景色数组
 @param state               UIControlState
 @param directionType       BXArtboardDirectionType（默认左下->右上）
 */
- (void)setBackgroundImageWithColors:(NSArray <UIColor *>*)backgroundColors
                            forState:(UIControlState)state
                       directionType:(BXArtboardDirectionType)directionType;
/**
 设置背景图（多个渐变色、带1px的框）

 @param backgroundColors    背景色数组
 @param boderColor          框颜色
 @param state               UIControlState
 @param directionType       BXArtboardDirectionType（默认左下->右上）
 */
- (void)setBackgroundImageWithColors:(NSArray <UIColor *>*)backgroundColors
                          boderColor:(UIColor *)boderColor
                            forState:(UIControlState)state
                       directionType:(BXArtboardDirectionType)directionType;

@end

NS_ASSUME_NONNULL_END
