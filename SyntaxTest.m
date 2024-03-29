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
	[car release];
}

- (void) testInit
{
	Car* car = [[Car alloc] init];
	STAssertTrue(@"NA" == car.brand, @"initializing error: brand");
	STAssertTrue(@"NA" == car.model, @"initializing error: model");
	[car release];
}

-(void) testDealloc
{
	Car* car = [[Car alloc] init];
	STAssertTrue(@"NA" == car.brand, @"initializing error: brand");
	Car* reservedRef = [car retain];
	STAssertTrue([reservedRef retainCount] == 2, @"dealloc should release object from memory");
	[car release]; // don't call dealloc!
	STAssertTrue([reservedRef retainCount] == 1, @"dealloc should release object from memory");
	[reservedRef release];
}

-(void) testMemoryMngmnt
{
	NSString* string_one = [[NSString alloc] initWithString:@"Hello"];
	STAssertTrue(string_one == @"Hello", @"alloc should create brand new object (one reference)");
	[string_one release];
}

-(void) testInspectingObjects
{
	Car* car = [[Car alloc] init];
	NSString* className = NSStringFromClass([car class]);
	STAssertTrue ([className isEqualToString:@"Car"], @"expected 'Car' but received '%@'",  className);
	[car release];
	//lessons learned: don't use ':' symbol in asserting message
}

-(void) testNil
{
	Car* car = nil;
	NSString* brand = car.brand;
	STAssertNil (brand, @"expected nil but received %@",  brand);
}

@end
