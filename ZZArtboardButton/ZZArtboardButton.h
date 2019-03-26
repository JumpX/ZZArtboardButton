//
//  ZZArtboardButton.h
//  ZZArtboardButton
//
//  Created by Jungle on 2019/3/26.
//  Copyright (c) 2019. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+ZZAdd.h"

typedef NS_ENUM(NSInteger, ZZArtboardType) {
    ZZArtboardTypeUp,
    ZZArtboardTypeDown
};

NS_ASSUME_NONNULL_BEGIN

@interface ZZArtboardButton : UIButton

@property (nonatomic, assign) ZZArtboardType artboardType;

- (void)setType:(ZZArtboardType)type textColor:(UIColor *)textColor font:(UIFont *)font text:(NSString *)text;

- (void)setUpTitles;
- (void)setDownTitles;

@end

NS_ASSUME_NONNULL_END
