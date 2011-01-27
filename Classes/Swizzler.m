//
//  Swizzler.m
//  Swizzling
//
//  Created by David Young-Chan Kay on 1/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Swizzler.h"

#import <objc/runtime.h>
#import <objc/objc-class.h>

#define SetNSErrorFor(FUNC, ERROR_VAR, FORMAT,...)	\
	if (ERROR_VAR) {	\
		NSString *errStr = [NSString stringWithFormat:@"%s: " FORMAT,FUNC,##__VA_ARGS__]; \
		*ERROR_VAR = [NSError errorWithDomain:@"NSCocoaErrorDomain" \
										 code:-1	\
									 userInfo:[NSDictionary dictionaryWithObject:errStr forKey:NSLocalizedDescriptionKey]]; \
	}
#define SetNSError(ERROR_VAR, FORMAT,...) SetNSErrorFor(__func__, ERROR_VAR, FORMAT, ##__VA_ARGS__)


@implementation Swizzler

+ (BOOL)swizzleMethodsForClass:(Class)class
				   oldSelector:(SEL)origSel_ 
				   newSelector:(SEL)altSel_ 
						 error:(NSError**)error_ 
{
	// Grab the old method from the original selector
	Method origMethod = class_getInstanceMethod(class, origSel_);
	if (!origMethod) {
		SetNSError(error_, @"original method %@ not found for class %@", NSStringFromSelector(origSel_), [class className]);
		return NO;
	}
	
	// Grab the new method from the original selector
	Method altMethod = class_getInstanceMethod(class, altSel_);
	if (!altMethod) {
		SetNSError(error_, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel_), [class className]);
		return NO;
	}

	// add the original method to the class
	// I believe this is a guard against problems caused by inheritance
	class_addMethod(
		class,
		origSel_,
		class_getMethodImplementation(class, origSel_),
		method_getTypeEncoding(origMethod)
	);
	// add the new method to the class
	// I believe this is a guard against problems caused by inheritance
	class_addMethod(
		class,
		altSel_,
		class_getMethodImplementation(class, altSel_),
		method_getTypeEncoding(altMethod)
	);
	
	// the magic!
	method_exchangeImplementations(
		class_getInstanceMethod(class, origSel_),
		class_getInstanceMethod(class, altSel_)
	);
	return YES;
}

@end
