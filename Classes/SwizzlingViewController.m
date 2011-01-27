//
//  SwizzlingViewController.m
//  Swizzling
//
//  Created by David Young-Chan Kay on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SwizzlingViewController.h"
#import "OriginalObject.h"
#import "Swizzler.h"

@implementation SwizzlingViewController

#pragma mark -
#pragma mark Initialization

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];

	OriginalObject *object = [[OriginalObject alloc] init];

	//_before.text = @"Before";
	_before.text = [object hello];

	NSError *error = nil;
	// Swizzle
	[Swizzler swizzleMethodsForClass: [OriginalObject class]
						 oldSelector: @selector(hello)
						 newSelector: @selector(swizzledHello)
							   error: &error
						 ];


	//_after.text = @"After";
	_after.text = [object hello];

}

#pragma mark -
#pragma mark Cleanup, Etc

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
