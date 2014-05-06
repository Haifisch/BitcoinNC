//
//  BitcoinforNCViewControllerNew.h
//  Bitcoin for NC
//
//  Created by GokuLabs on 02.01.2014.
//  Copyright (c) 2014 GokuLabs. All rights reserved.
//

#import "SpringBoardUIServices/_SBUIWidgetViewController.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BitcoinforNCViewControllerNew : _SBUIWidgetViewController {
    UILabel *highLabel;
    UILabel *buyLabel;
    UILabel *lowLabel;

    id json;
}

@end