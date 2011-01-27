//
//  Swizzler.h
//  Swizzling
//
//  Created by David Young-Chan Kay on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Swizzler : NSObject {

}

+ (BOOL)swizzleMethodsForClass:(Class)class oldSelector:(SEL)origSel_ newSelector:(SEL)altSel_ error:(NSError**)error_;

@end
