//
//  Car.h
//  PeepNews
//
//  Created by Aleksey Drobnych on 3/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Car : NSObject {
	
	NSString* brand;
	NSString* model;

}

- (NSString*) brand;
- (NSString*) model;
- (void) setBrand: (NSString*) new_brand;
- (void) setModel: (NSString*) new_model;

@end
