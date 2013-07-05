//
//  EDSemverEqualTo.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemverEqualTo.h"

@implementation EDSemverEqualTo

- (void)testEqualTo
{
    NSArray *eq = @[
        @"1.0.0", @"1.0.0",
        @"1.0.1", @"v1.0.1",
        @"1.2", @"1.2.0"
    ];
    
    for (int i = 0; i < [eq count]; i+=2) {
        EDSemver *left = [[EDSemver alloc] initWithString:[eq objectAtIndex:i]];
        EDSemver *right = [[EDSemver alloc] initWithString:[eq objectAtIndex:i+1]];
        STAssertTrue([left isEqualTo:right], EQUAL_DESC);
    }
}

- (void)testNotEqualTo
{
    NSArray *eq = @[
        @"1.0.0", @"1.0.1",
        @"1.2", @"1.2.1"
    ];
    
    for (int i = 0; i < [eq count]; i+=2) {
        EDSemver *left = [[EDSemver alloc] initWithString:[eq objectAtIndex:i]];
        EDSemver *right = [[EDSemver alloc] initWithString:[eq objectAtIndex:i+1]];
        STAssertFalse([left isEqualTo:right], EQUAL_DESC);
    }
}

@end
