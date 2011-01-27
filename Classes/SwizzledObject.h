//
//  SwizzledObject.h
//  Swizzling
//
//  Created by David Young-Chan Kay on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OriginalObject.h"

@interface OriginalObject (Swizzled)

- (NSString *)swizzledHello;

@end
