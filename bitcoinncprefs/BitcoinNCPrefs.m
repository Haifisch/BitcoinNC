//
//  BitcoinNCPrefs.m
//  BitcoinNCPrefs
//
//  Created by Haifisch on 02.01.2014.
//  Copyright (c) 2014 Haifisch. All rights reserved.
//

#import "BitcoinNCPrefs.h"

@implementation BitcoinNCPrefsListController

- (id)specifiers {
	if (_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"BitcoinNCPrefs" target:self];
	}
    
	return _specifiers;
}

@end
