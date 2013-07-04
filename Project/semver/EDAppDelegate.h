//
//  EDAppDelegate.h
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EDViewController;

@interface EDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) EDViewController *viewController;

@end
