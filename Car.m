//
//  Car.m
//  PeepNews
//
//  Created by Aleksey Drobnych on 3/22/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Car.h"


@implementation Car

- (id) init 
{
	if (self = [super init]) {
		self.brand = @"NA";
		self.model = @"NA";
	}
	return self;
}

- (void) dealloc
{
	[brand release];
	[model release];
	[super dealloc];
}

- (NSString*) brand
{
	return brand;
}

- (NSString*) model
{
	return model;
}

- (void) setBrand:(NSString *)new_brand
{
	[brand autorelease];
	brand = [new_brand retain];
}

- (void) setModel:(NSString *)new_model
{
	[model autorelease];
	model = [new_model retain];
}
	
@end
