//
//  ZZArtboardButton.m
//  ZZArtboardButton
//
//  Created by Jungle on 2019/3/26.
//  Copyright (c) 2019. All rights reserved.
//

#import "ZZArtboardButton.h"

static NSString * const kUpNormalFromColor = @"#2FCEFF";
static NSString * const kUpNormalToColor = @"#39A7FF";

static NSString * const kDownNormalBorderLayerColor = @"#2399FF";
static NSString * const kDownDisbaledBackgroundColor = @"#C8C8C8";
static NSString * const kDownDisbaledBorderLayerColor = @"#E1E1E1";

@interface UIView (ZZArtboardButton)

- (nullable UIImage *)snapshotImage;

@end

@implementation UIView (ZZArtboardButton)

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

@end

@interface CALayer (ZZArtboardButton)

- (nullable UIImage *)snapshotImage;

@end

@implementation CALayer (ZZArtboardButton)

- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

@interface ZZArtboardButton ()

@property (nonatomic, assign)   BXArtboardType      type;

@property (nonatomic, strong)   UIImage             *up_normalImage;
@property (nonatomic, strong)   UIImage             *up_highlightedImage;
@property (nonatomic, strong)   UIImage             *up_selectedImage;
@property (nonatomic, strong)   UIImage             *up_disabledImage;

@property (nonatomic, strong)   UIImage             *down_normalImage;
@property (nonatomic, strong)   UIImage             *down_highlightedImage;
@property (nonatomic, strong)   UIImage             *down_selectedImage;
@property (nonatomic, strong)   UIImage             *down_disabledImage;

@end

@implementation ZZArtboardButton

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
            [self setBackgroundImage:self.up_normalImage  forState:UIControlStateNormal];
            [self setBackgroundImage:self.up_highlightedImage  forState:UIControlStateHighlighted];
            [self setBackgroundImage:self.up_highlightedImage  forState:UIControlStateHighlighted | UIControlStateSelected];
            [self setBackgroundImage:self.up_selectedImage  forState:UIControlStateSelected];
            [self setBackgroundImage:self.up_disabledImage  forState:UIControlStateDisabled];
        }
            break;
        case BXArtboardTypeDown: {
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
            [self setBackgroundImage:self.down_normalImage  forState:UIControlStateNormal];
            [self setBackgroundImage:self.down_highlightedImage  forState:UIControlStateHighlighted];
            [self setBackgroundImage:self.down_highlightedImage  forState:UIControlStateHighlighted | UIControlStateSelected];
            [self setBackgroundImage:self.down_selectedImage  forState:UIControlStateSelected];
            [self setBackgroundImage:self.down_disabledImage  forState:UIControlStateDisabled];
        }
            
        default:
            break;
    }
}

- (void)setUpTitles {
    [self setTitle:@"类型一 正常状态" forState:UIControlStateNormal];
    [self setTitle:@"类型一 高亮状态" forState:UIControlStateHighlighted];
    [self setTitle:@"类型一 高亮状态" forState:UIControlStateHighlighted | UIControlStateSelected];
    [self setTitle:@"类型一 选中状态" forState:UIControlStateSelected];
    [self setTitle:@"类型一 无效状态" forState:UIControlStateDisabled];
}

- (void)setDownTitles {
    [self setTitle:@"类型二 正常状态" forState:UIControlStateNormal];
    [self setTitle:@"类型二 高亮状态" forState:UIControlStateHighlighted];
    [self setTitle:@"类型二 高亮状态" forState:UIControlStateHighlighted | UIControlStateSelected];
    [self setTitle:@"类型二 选中状态" forState:UIControlStateSelected];
    [self setTitle:@"类型二 无效状态" forState:UIControlStateDisabled];
}

#pragma mark - Private

- (CAGradientLayer *)createGradientLayerWithFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)fromColor.CGColor,
                             (__bridge id)toColor.CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 1.0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
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
        CAGradientLayer *gradientLayer = [self createGradientLayerWithFromColor:[UIColor colorWithHex:kUpNormalFromColor] toColor:[UIColor colorWithHex:kUpNormalToColor]];
        _up_normalImage = [gradientLayer snapshotImage];
    }
    return _up_normalImage;
}

- (UIImage *)up_highlightedImage {
    if (!_up_highlightedImage) {
        CAGradientLayer *gradientLayer = [self createGradientLayerWithFromColor:[UIColor colorWithHex:kUpNormalFromColor] toColor:[UIColor colorWithHex:kUpNormalToColor]];
        CALayer *maskLayer = [self createMaskLayerWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.2]];
        [gradientLayer addSublayer:maskLayer];
        _up_highlightedImage = [gradientLayer snapshotImage];
    }
    return _up_highlightedImage;
}

- (UIImage *)up_selectedImage {
    if (!_up_selectedImage) {
        CAGradientLayer *gradientLayer = [self createGradientLayerWithFromColor:[[UIColor blueColor] colorWithAlphaComponent:0.5] toColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
        _up_selectedImage = [gradientLayer snapshotImage];
    }
    return _up_selectedImage;
}

- (UIImage *)up_disabledImage {
    if (!_up_disabledImage) {
        CAGradientLayer *gradientLayer = [self createGradientLayerWithFromColor:[[UIColor grayColor] colorWithAlphaComponent:0.5] toColor:[[UIColor grayColor] colorWithAlphaComponent:0.5]];
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
        CALayer *maskLayer = [self createMaskLayerWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.2]];
        [layer addSublayer:maskLayer];
        _down_highlightedImage = [layer snapshotImage];
    }
    return _down_highlightedImage;
}

- (UIImage *)down_selectedImage {
    if (!_down_selectedImage) {
        CALayer *layer = [self createLayerWithBgColor:[UIColor whiteColor] borderColor:[UIColor colorWithHex:kDownNormalBorderLayerColor]];
        CALayer *maskLayer = [self createMaskLayerWithColor:[[UIColor blackColor] colorWithAlphaComponent:0.4]];
        [layer addSublayer:maskLayer];
        _down_selectedImage = [layer snapshotImage];
    }
    return _down_selectedImage;
}

- (UIImage *)down_disabledImage {
    if (!_down_disabledImage) {
        CALayer *layer = [self createLayerWithBgColor:[UIColor colorWithHex:kDownDisbaledBackgroundColor] borderColor:[UIColor colorWithHex:kDownDisbaledBorderLayerColor]];
        _down_disabledImage = [layer snapshotImage];
    }
    return _down_disabledImage;
}

@end
