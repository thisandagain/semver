//
//  EDSemverValid.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemverValid.h"

@implementation EDSemverValid

- (void)testValidTrue
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"1.0.0"];
    STAssertTrue([ver isValid], VALID_DESC);
}

- (void)testValidFalse
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"alpha"];
    STAssertFalse([ver isValid], VALID_DESC);
}

@end
