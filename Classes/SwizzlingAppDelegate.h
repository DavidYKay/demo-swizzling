//
//  SwizzlingAppDelegate.h
//  Swizzling
//
//  Created by David Young-Chan Kay on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwizzlingViewController;

@interface SwizzlingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SwizzlingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SwizzlingViewController *viewController;

@end

