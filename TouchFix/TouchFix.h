#ifndef __LP64__

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

#import "UITouch+Private.h"

@interface UIEvent (BitcoinforNC_TouchFix)

- (instancetype)initWithTouch:(UITouch *)touch;

@end

@interface UITouch (BitcoinforNC_TouchFix)

- (instancetype)initWithPoint:(CGPoint)point andView:(UIView *)view;
- (void)setPhase:(UITouchPhase)phase;

@end

#endif