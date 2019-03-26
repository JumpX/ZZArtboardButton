//
//  BXArtboardButton.m
//  YppLife
//
//  Created by Jungle on 2019/3/25.
//  Copyright (c) 2019. All rights reserved.
//

#import "BXArtboardButton.h"

static NSString * const kUpNormalFromColor = @"#2FCEFF";
static NSString * const kUpNormalToColor = @"#39A7FF";

static NSString * const kDownNormalTitleColor = @"#1D9AFF";
static NSString * const kDownNormalBorderLayerColor = @"#2399FF";
static NSString * const kDownDisbaledBackgroundColor = @"#C8C8C8";
static NSString * const kDownDisbaledBorderLayerColor = @"#E1E1E1";

@interface UIView (BXArtboardButton)

- (UIImage *)snapshotImage;

@end

@implementation UIView (BXArtboardButton)

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

@end

@interface CALayer (BXArtboardButton)

- (UIImage *)snapshotImage;

@end

@implementation CALayer (BXArtboardButton)

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

@interface BXArtboardButton ()

@property (nonatomic, assign)   BXArtboardType      type;

@property (nonatomic, strong)   UIImage             *up_normalImage;
@property (nonatomic, strong)   UIImage             *up_highlightedImage;
@property (nonatomic, strong)   UIImage             *up_disabledImage;

@property (nonatomic, strong)   UIImage             *down_normalImage;
@property (nonatomic, strong)   UIImage             *down_highlightedImage;
@property (nonatomic, strong)   UIImage             *down_disabledImage;

@end

@implementation BXArtboardButton

#pragma mark - Public

- (void)setType:(BXArtboardType)type textColor:(UIColor *)textColor font:(UIFont *)font text:(NSString *)text {
    [self.titleLabel setFont:font];
    [self setTitle:text forState:UIControlStateNormal];
    [self setTitleColor:textColor forState:UIControlStateNormal];
    self.type = type;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.layer.cornerRadius = frame.size.height/2.0;
    self.layer.masksToBounds = YES;
}

- (void)setType:(BXArtboardType)type {
    _type = type;
    switch (type) {
        case BXArtboardTypeUp: {
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self setBackgroundImageWithUpNormalStyle];
            [self setBackgroundImageWithUpHighlightedStyle];
            [self setBackgroundImageWithUpDisableStyle];
        }
            break;
        case BXArtboardTypeDown: {
            [self setTitleColor:[UIColor colorWithHex:kDownNormalTitleColor] forState:UIControlStateNormal];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
            [self setBackgroundImageWithDownNormalStyle];
            [self setBackgroundImageWithDownHighlightedStyle];
            [self setBackgroundImageWithDownDisableStyle];
        }
            break;
        case BXArtboardTypeCustom: {
            
        }
            break;
            
        default:
            break;
    }
}

- (void)setCustomTitles {
    [self setTitle:@"自定义 正常状态" forState:UIControlStateNormal];
    [self setTitle:@"自定义 高亮状态" forState:UIControlStateHighlighted];
    [self setTitle:@"自定义 高亮状态" forState:UIControlStateHighlighted | UIControlStateSelected];
    [self setTitle:@"自定义 无效状态" forState:UIControlStateDisabled];
}

- (void)setUpTitles {
    [self setTitle:@"类型一 正常状态" forState:UIControlStateNormal];
    [self setTitle:@"类型一 高亮状态" forState:UIControlStateHighlighted];
    [self setTitle:@"类型一 高亮状态" forState:UIControlStateHighlighted | UIControlStateSelected];
    [self setTitle:@"类型一 无效状态" forState:UIControlStateDisabled];
}

- (void)setDownTitles {
    [self setTitle:@"类型二 正常状态" forState:UIControlStateNormal];
    [self setTitle:@"类型二 高亮状态" forState:UIControlStateHighlighted];
    [self setTitle:@"类型二 高亮状态" forState:UIControlStateHighlighted | UIControlStateSelected];
    [self setTitle:@"类型二 无效状态" forState:UIControlStateDisabled];
}

- (void)setBackgroundImageWithUpNormalStyle {
    [self setBackgroundImage:self.up_normalImage  forState:UIControlStateNormal];
}

- (void)setBackgroundImageWithUpHighlightedStyle {
    [self setBackgroundImage:self.up_highlightedImage  forState:UIControlStateHighlighted];
    [self setBackgroundImage:self.up_highlightedImage  forState:UIControlStateHighlighted | UIControlStateSelected];
}

- (void)setBackgroundImageWithUpDisableStyle {
    [self setBackgroundImage:self.up_disabledImage  forState:UIControlStateDisabled];
}

- (void)setBackgroundImageWithDownNormalStyle {
    [self setBackgroundImage:self.down_normalImage  forState:UIControlStateNormal];
}

- (void)setBackgroundImageWithDownHighlightedStyle {
    [self setBackgroundImage:self.down_highlightedImage  forState:UIControlStateHighlighted];
    [self setBackgroundImage:self.down_highlightedImage  forState:UIControlStateHighlighted | UIControlStateSelected];
}

- (void)setBackgroundImageWithDownDisableStyle {
    [self setBackgroundImage:self.down_disabledImage  forState:UIControlStateDisabled];
}

- (void)clearAllBackgroundImages {
    [self setBackgroundImage:nil  forState:UIControlStateNormal];
    [self setBackgroundImage:nil  forState:UIControlStateHighlighted];
    [self setBackgroundImage:nil  forState:UIControlStateHighlighted | UIControlStateSelected];
    [self setBackgroundImage:nil  forState:UIControlStateSelected];
    [self setBackgroundImage:nil  forState:UIControlStateDisabled];
}

- (void)setBackgroundImageWithColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    CALayer *layer = [self createMaskLayerWithColor:backgroundColor];
    UIImage *image = [layer snapshotImage];
    [self setBackgroundImage:image forState:state];
}

- (void)setBackgroundImageWithColor:(UIColor *)backgroundColor boderColor:(UIColor *)boderColor forState:(UIControlState)state {
    CALayer *layer = [self createLayerWithBgColor:backgroundColor borderColor:boderColor];
    UIImage *image = [layer snapshotImage];
    [self setBackgroundImage:image forState:state];
}

- (void)setBackgroundImageWithColors:(NSArray *)backgroundColors forState:(UIControlState)state {
    CAGradientLayer *gradientLayer = [self createGradientLayerWithColors:backgroundColors directionType:BXArtboardDirectionTypeDefault];
    UIImage *image = [gradientLayer snapshotImage];
    [self setBackgroundImage:image forState:state];
}

- (void)setBackgroundImageWithColors:(NSArray<UIColor *> *)backgroundColors boderColor:(UIColor *)boderColor forState:(UIControlState)state {
    CAGradientLayer *gradientLayer = [self createGradientLayerWithColors:backgroundColors directionType:BXArtboardDirectionTypeDefault];
    gradientLayer.borderWidth = 1.0;
    gradientLayer.cornerRadius = self.bounds.size.height/2.0;
    gradientLayer.borderColor = boderColor.CGColor;
    UIImage *image = [gradientLayer snapshotImage];
    [self setBackgroundImage:image forState:state];
}

- (void)setBackgroundImageWithColors:(NSArray<UIColor *> *)backgroundColors forState:(UIControlState)state directionType:(BXArtboardDirectionType)directionType {
    CAGradientLayer *gradientLayer = [self createGradientLayerWithColors:backgroundColors directionType:directionType];
    UIImage *image = [gradientLayer snapshotImage];
    [self setBackgroundImage:image forState:state];
}

- (void)setBackgroundImageWithColors:(NSArray<UIColor *> *)backgroundColors boderColor:(UIColor *)boderColor forState:(UIControlState)state directionType:(BXArtboardDirectionType)directionType {
    CAGradientLayer *gradientLayer = [self createGradientLayerWithColors:backgroundColors directionType:directionType];
    gradientLayer.cornerRadius = self.bounds.size.height/2.0;
    gradientLayer.borderWidth = 1.0;
    gradientLayer.borderColor = boderColor.CGColor;
    UIImage *image = [gradientLayer snapshotImage];
    [self setBackgroundImage:image forState:state];
}

#pragma mark - Private

- (CAGradientLayer *)createGradientLayerWithColors:(NSArray <UIColor *>*)colors directionType:(BXArtboardDirectionType)directionType {
    NSInteger count = colors.count;
    if (colors.count <= 0) {
        return [CAGradientLayer layer];
    }
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointZero;
    switch (directionType) {
        case BXArtboardDirectionTypeDefault: {
            startPoint = CGPointMake(0, 1.0);
            endPoint = CGPointMake(1.0, 0);
        }
            break;
        case BXArtboardDirectionTypeTopToBottom: {
            startPoint = CGPointMake(0.5, 0);
            endPoint = CGPointMake(0.5, 1.0);
        }
            break;
        case BXArtboardDirectionTypeLeftToRight: {
            startPoint = CGPointMake(0, 0.5);
            endPoint = CGPointMake(1.0, 0.5);
        }
            break;
        case BXArtboardDirectionTypeLeftTopToRightBottom: {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1.0, 1.0);
        }
            
        default:
            break;
    }
    NSMutableArray *cgColors = [NSMutableArray array];
    NSMutableArray *locations = [NSMutableArray array];
    CGFloat perLocation = 1.0/count;
    for (NSInteger i = 0; i < count; i ++) {
        [cgColors addObject:(__bridge id)colors[i].CGColor];
        [locations addObject:@(perLocation*i)];
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = [cgColors copy];
    gradientLayer.locations = [locations copy];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = self.bounds;
    return gradientLayer;
}

- (CALayer *)createLayerWithBgColor:(UIColor *)bgColor borderColor:(UIColor *)borderColor {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = bgColor.CGColor;
    layer.borderColor = borderColor.CGColor;
    layer.borderWidth = 1.0;
    layer.cornerRadius = self.bounds.size.height/2.0;
    layer.masksToBounds = YES;
    layer.frame = self.bounds;
    return layer;
}

- (CALayer *)createMaskLayerWithColor:(UIColor *)color {
    CALayer *maskLayer = [CALayer layer];
    maskLayer.backgroundColor = color.CGColor;
    maskLayer.frame = self.bounds;
    return maskLayer;
}

#pragma mark - Getter

- (UIImage *)up_normalImage {
    if (!_up_normalImage) {
        CAGradientLayer *gradientLayer = [self createGradientLayerWithColors:@[[UIColor colorWithHex:kUpNormalFromColor], [UIColor colorWithHex:kUpNormalToColor]] directionType:BXArtboardDirectionTypeDefault];
        _up_normalImage = [gradientLayer snapshotImage];
    }
    return _up_normalImage;
}

- (UIImage *)up_highlightedImage {
    if (!_up_highlightedImage) {
        CAGradientLayer *gradientLayer = [self createGradientLayerWithColors:@[[UIColor colorWithHex:kUpNormalFromColor], [UIColor colorWithHex:kUpNormalToColor]] directionType:BXArtboardDirectionTypeDefault];
        CALayer *maskLayer = [self createMaskLayerWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.1]];
        [gradientLayer addSublayer:maskLayer];
        _up_highlightedImage = [gradientLayer snapshotImage];
    }
    return _up_highlightedImage;
}

- (UIImage *)up_disabledImage {
    if (!_up_disabledImage) {
        CAGradientLayer *gradientLayer = [self createGradientLayerWithColors:@[[[UIColor colorWithHex:kUpNormalFromColor] colorWithAlphaComponent:0.5], [[UIColor colorWithHex:kUpNormalToColor] colorWithAlphaComponent:0.5]] directionType:BXArtboardDirectionTypeDefault];
        _up_disabledImage = [gradientLayer snapshotImage];
    }
    return _up_disabledImage;
}

- (UIImage *)down_normalImage {
    if (!_down_normalImage) {
        CALayer *layer = [self createLayerWithBgColor:[UIColor whiteColor] borderColor:[UIColor colorWithHex:kDownNormalBorderLayerColor]];
        _down_normalImage = [layer snapshotImage];
    }
    return _down_normalImage;
}

- (UIImage *)down_highlightedImage {
    if (!_down_highlightedImage) {
        CALayer *layer = [self createLayerWithBgColor:[UIColor whiteColor] borderColor:[UIColor colorWithHex:kDownNormalBorderLayerColor]];
        CALayer *maskLayer = [self createMaskLayerWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.1]];
        [layer addSublayer:maskLayer];
        _down_highlightedImage = [layer snapshotImage];
    }
    return _down_highlightedImage;
}

- (UIImage *)down_disabledImage {
    if (!_down_disabledImage) {
        CALayer *layer = [self createLayerWithBgColor:[UIColor colorWithHex:kDownDisbaledBackgroundColor] borderColor:[UIColor colorWithHex:kDownDisbaledBorderLayerColor]];
        _down_disabledImage = [layer snapshotImage];
    }
    return _down_disabledImage;
}

@end
