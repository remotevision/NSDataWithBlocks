//
//  RVAppDelegate.h
//  NSDataWithBlocks
//
//  Created by Ryan Kelly on 10/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RVViewController;

@interface RVAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RVViewController *viewController;

@end
