//
//  BitcoinforNCView.m
//  Bitcoin for NC
//
//  Created by GokuLabs on 02.01.2014.
//  Copyright (c) 2014 GokuLabs. All rights reserved.
//

#import "BitcoinforNCView.h"

@interface BitcoinforNCView () {
    UIImageView *_backgroundImageView;
}

@end

@implementation BitcoinforNCView

#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
#define kCFCoreFoundationVersionNumber_iOS_7_0 838.00
#endif

#define iOS7 (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_7_0)

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    if (backgroundImage) {
        if (!_backgroundImageView) {
            _backgroundImageView = [[UIImageView alloc] init];
            [self addSubview:_backgroundImageView];
        }
        
        _backgroundImageView.image = backgroundImage;
    }
    else {
        if (_backgroundImageView) {
            [_backgroundImageView removeFromSuperview];
            
            _backgroundImageView = nil;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //layout your additional views
    if (_backgroundImageView) {
        _backgroundImageView.frame = CGRectInset(self.bounds, 2.0f, 0.0f);
    }
}

- (void)loadFullView {
    //load additonal views
}

- (void)dealloc {
    if (_backgroundImageView) {
        [_backgroundImageView removeFromSuperview];
		_backgroundImageView = nil;
    }
    //unload views
}

@end
