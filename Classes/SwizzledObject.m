//
//  SwizzledObject.m
//  Swizzling
//
//  Created by David Young-Chan Kay on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SwizzledObject.h"
 
@implementation OriginalObject (Swizzled)

- (NSString *)swizzledHello {
	return [[self swizzledHello] stringByAppendingString:@", from the swizzler!"];
}

@end
