//
//  BitcoinforNCViewController.m
//  Bitcoin for NC
//
//  Created by GokuLabs on 02.01.2014.
//  Copyright (c) 2014 GokuLabs. All rights reserved.
//

#ifndef __LP64__


#import "BitcoinforNCViewController.h"
#import "BitcoinforNCView.h"

#import "TouchFix/TouchFix.h"

@interface BitcoinforNCViewController ()

@property (nonatomic, strong) BitcoinforNCView *view;
@property (nonatomic, strong) NSBundle *bundle;

@end


@implementation BitcoinforNCViewController

- (instancetype)init {
    self = [super init];
    
	if (self) {
		self.bundle = [NSBundle bundleForClass:[self class]];
	}
    
    return self;
}

- (void)loadFullView {
	//Add subviews to self.view here!
    [self.view loadFullView];
}

- (BitcoinforNCView *)view {
    if (!_view) {
        [self loadView];
    }
    
    return _view;
}

- (void)loadView {
    self.view = [[BitcoinforNCView alloc] initWithFrame:(CGRect){CGPointZero, {0.0f, self.viewHeight}}];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (void)loadPlaceholderView {
	UIImage *backgroundImage = [UIImage imageWithContentsOfFile:[self.bundle pathForResource:@"Background" ofType:@"png"]];
    
	UIImage *stretchableBackgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:(NSInteger)backgroundImage.size.width/2.0f topCapHeight:(NSInteger)backgroundImage.size.height/2.0f];
    
    [self.view setBackgroundImage:stretchableBackgroundImage];
}


- (void)unloadView {
    [self.view removeFromSuperview];
	self.view = nil;
	//Destroy any additional subviews you added here!
}

- (float)viewHeight {
	return 110.0f;
}

- (void)viewWillAppear {
    
}

- (void)viewDidAppear {
    
}

- (void)viewWillDisappear {
    
}

- (void)viewDidDisappear {
    
}

#pragma mark - TouchFix

- (NSURL *)launchURLForTapLocation:(CGPoint)point {
    UITouch *touch = [[UITouch alloc] initWithPoint:[self.view convertPoint:point toView:self.view.window] andView:self.view];
    UIEvent *eventDown = [[UIEvent alloc] initWithTouch:touch];
    [touch.view touchesBegan:[eventDown allTouches] withEvent:eventDown];
    [touch setPhase:UITouchPhaseEnded];
    
    UIEvent *eventUp = [[UIEvent alloc] initWithTouch:touch];
    [touch.view touchesEnded:[eventUp allTouches] withEvent:eventUp];
    
    
    
    return nil;
}

@end


#endif
