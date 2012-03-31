//
//  SyntaxTest.m
//  PeepNews
//
//  Created by Aleksey Drobnych on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SyntaxTest.h"
#import "Car.h"


@implementation SyntaxTest

- (NSString *) someString
{
	return @"Hello";
}

- (void) testShouldPass
{
	STAssertTrue(YES, @"failure in  asserttrue");
}

- (void) testShouldPass2 
{
	STAssertFalse(NO, @"failure in  assertfalse");
}

- (void) testMethod
{
	STAssertTrue(@"Hello" == [self someString], @"strings doesn't match");
}

- (void) testSettersGettersSugar
{
	Car* car = [[Car alloc] init];
	car.brand = @"KIA";
	STAssertTrue(@"KIA" == car.brand, @"setter and getter sugar test failed");
	
}

- (void) testInit
{
	Car* car = [[Car alloc] init];
	STAssertTrue(@"NA" == car.brand, @"initializing error: brand");
	STAssertTrue(@"NA" == car.model, @"initializing error: model");
	
}

-(void) testDealloc
{
	Car* car = [[Car alloc] init];
	STAssertTrue(@"NA" == car.brand, @"initializing error: brand");
	[car dealloc];
	STAssertTrue([car description] == @"smth", @"dealloc should release object from memory");
}

-(void) testMemoryMngmnt
{
	NSString* string_one = [[NSString alloc] initWithString:@"Hello"];
	STAssertTrue(string_one == @"Hello", @"alloc should create brand new object (one reference)");
	
}

@end
