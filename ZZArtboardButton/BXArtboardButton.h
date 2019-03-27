//
//  BXArtboardButton.h
//  ZZArtboardButton
//
//  Created by Jungle on 2019/3/25.
//  Copyright (c) 2019. All rights reserved.
//
//  加强版
//  定制全局按钮：带有圆角、背景图渐变色（或许有1px的框）

/**
 
 Sample Code:
 
 ************************** 类型一（蓝条）**************************
 @code
 BXArtboardButton *button = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
 button.frame = CGRectMake(0, 0, 100.0, 44.0);
 [button setType:BXArtboardTypeUp textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"开始派单"];
 [self addSubview:button];
 @endcode
 
 ************************** 类型二（白条）**************************
 @code
 BXArtboardButton *button = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
 button.frame = CGRectMake(0, 0, 100.0, 44.0);
 [button setType:BXArtboardTypeDown textColor:[UIColor colorWithHexString:@"#1D9AFF"] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"关闭"];
 [self addSubview:button];
 @endcode
 
 ***************************** 自定义 *****************************
 @code
 BXArtboardButton *button = [BXArtboardButton buttonWithType:UIButtonTypeCustom];
 button.frame = CGRectMake(0, 0, 100.0, 44.0);
 [button setType:BXArtboardTypeCustom textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium] text:@"自定义"];
 [button setBackgroundImageWithColors:@[[UIColor blackColor], [UIColor redColor], [UIColor greenColor]] forState:UIControlStateNormal directionType:BXArtboardDirectionTypeLeftTopToRightBottom];
 [self setTitle:@"自定义 正常状态" forState:UIControlStateNormal];
 [self setTitle:@"自定义 高亮状态" forState:UIControlStateHighlighted];
 [self setTitle:@"自定义 高亮状态" forState:UIControlStateHighlighted | UIControlStateSelected];
 [self setTitle:@"自定义 无效状态" forState:UIControlStateDisabled];
 [self addSubview:button];
 @endcode
 
 */

#import <UIKit/UIKit.h>
#import "UIColor+ZZAdd.h"

NS_ASSUME_NONNULL_BEGIN

// 按钮类型
typedef NS_ENUM(NSInteger, BXArtboardType) {
    BXArtboardTypeCustom,           // 自定义（普通的UIButton，不带任何效果）
    BXArtboardTypeUp,               // 类型一（蓝条：背景渐变色）
    BXArtboardTypeDown              // 类型二（白条：不渐变）
};

// 渐变方向
typedef NS_ENUM(NSInteger, BXArtboardDirectionType) {
    BXArtboardDirectionTypeDefault,                 // 左下 -> 右上（默认）
    BXArtboardDirectionTypeTopToBottom,             // 上 -> 下
    BXArtboardDirectionTypeLeftToRight,             // 左 -> 右
    BXArtboardDirectionTypeLeftTopToRightBottom     // 左上 -> 右下
};

@interface BXArtboardButton : UIButton

/* 主要方法 */
- (void)setType:(BXArtboardType)type textColor:(UIColor *)textColor font:(UIFont *)font text:(NSString *)text;

/* test */
- (void)setCustomTitles;
- (void)setUpTitles;
- (void)setDownTitles;


/************************** 以下为可选方法 **************************/
/*********** 建议只在 type = BXArtboardTypeCustom 时使用 ************/

/* 系统高亮，默认YES */
@property (nonatomic, assign) BOOL bxAdjustsWhenHighlighted;// 比adjustsImageWhenHighlighted准确

/* 自定义类型 使用蓝条 */
- (void)setUpNormalStyleWithNormalState;
- (void)setUpHighlightedStyleWithHighlightedState;
- (void)setUpDisabledStyleWithDisabledState;
- (void)setUpNormalStyleWithState:(UIControlState)state;
- (void)setUpHighlightedStyleWithState:(UIControlState)state;
- (void)setUpDisabledStyleWithState:(UIControlState)state;
/* 自定义类型 使用白条 */
- (void)setDownNormalStyleWithNormalState;
- (void)setDownHighlightedStyleWithHighlightedState;
- (void)setDownDisabledStyleWithDisabledState;
- (void)setDownNormalStyleWithState:(UIControlState)state;
- (void)setDownHighlightedStyleWithState:(UIControlState)state;
- (void)setDownDisabledStyleWithState:(UIControlState)state;

/* 清除所有状态下背景图 */
- (void)clearAllBackgroundImages;

#pragma mark - 设置背景图

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

#pragma mark - 图层

/**
 渐变图层
 
 @param frame               frame
 @param colors              渐变颜色数组
 @param directionType       BXArtboardDirectionType（默认左下->右上）
 @return                    渐变图层
 */
- (CAGradientLayer *)gradientLayerWithFrame:(CGRect)frame colors:(NSArray <UIColor *>*)colors directionType:(BXArtboardDirectionType)directionType;

/**
 图层（背景色、带1px框）
 
 @param frame               frame
 @param bgColor             背景色
 @param borderColor         框颜色
 @return                    图层
 */
- (CALayer *)createLayerWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor borderColor:(UIColor *)borderColor;

/**
 图层（背景色）
 
 @param frame               frame
 @param color               背景色
 @return                    图层
 */
- (CALayer *)maskLayerWithFrame:(CGRect)frame color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
