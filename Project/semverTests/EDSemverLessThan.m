//
//  EDSemverLessThan.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemverHarness.h"

@interface EDSemverLessThan : XCTestCase
@end

@implementation EDSemverLessThan

- (void)testLessThan
{
    NSArray *eq = @[
        @"0.0.0", @"0.0.0-foo",
        @"0.0.1", @"0.0.0",
        @"1.0.0", @"0.9.9",
        @"0.10.0", @"0.9.0",
        @"0.99.0", @"0.10.0",
        @"2.0.0", @"1.2.3",
        @"v0.0.0", @"0.0.0-foo",
        @"v0.0.1", @"0.0.0",
        @"v1.0.0", @"0.9.9",
        @"v0.10.0", @"0.9.0",
        @"v0.99.0", @"0.10.0",
        @"v2.0.0", @"1.2.3",
        @"0.0.0", @"v0.0.0-foo",
        @"0.0.1", @"v0.0.0",
        @"1.0.0", @"v0.9.9",
        @"0.10.0", @"v0.9.0",
        @"0.99.0", @"v0.10.0",
        @"2.0.0", @"v1.2.3",
        @"1.2.3", @"1.2.3-asdf",
        @"1.2.3", @"1.2.3-4",
        @"1.2.3", @"1.2.3-4-foo",
        @"1.2.3-5-foo", @"1.2.3-5",
        @"1.2.3-5", @"1.2.3-4",
        @"3.0.0", @"2.7.2+asdf"
    ];
    
    for (NSUInteger i = 0; i < [eq count]; i+=2) {
        EDSemver *left = [[EDSemver alloc] initWithString:[eq objectAtIndex:i]];
        EDSemver *right = [[EDSemver alloc] initWithString:[eq objectAtIndex:i+1]];
		XCTAssertEqual([right compare:left], NSOrderedAscending, @"Expected %@ to be less than %@", right, left);
    }
}

@end
