//
//  semverTests.m
//  semverTests
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "semverTests.h"

@implementation semverTests

#pragma mark - Set up

- (void)setUp
{
    [super setUp];
    
    //
}

- (void)tearDown
{
    [super tearDown];
}

#pragma mark - Major / minor / patch

- (void)testMajor
{
    STAssertEquals(0, [EDSemver major:@"0.2.2"], nil);
    STAssertEquals(1, [EDSemver major:@"1.0"], nil);
    STAssertEquals(2, [EDSemver major:@"2.0-alpha1"], nil);
    STAssertEquals(3, [EDSemver major:@"3.0.0+12345.1"], nil);
}

- (void)testMinor
{
    STAssertEquals(0, [EDSemver minor:@"3.0.2"], nil);
    STAssertEquals(1, [EDSemver minor:@"2.1"], nil);
    STAssertEquals(2, [EDSemver minor:@"1.2-alpha1"], nil);
    STAssertEquals(3, [EDSemver minor:@"0.3.2+12345.1"], nil);
}

- (void)testPatch
{
    STAssertEquals(0, [EDSemver patch:@"3.0"], nil);
    STAssertEquals(1, [EDSemver patch:@"2.5.1"], nil);
    STAssertEquals(2, [EDSemver patch:@"1.6.2-alpha1"], nil);
    STAssertEquals(3, [EDSemver patch:@"0.7.3+12345.1"], nil);
}

#pragma mark - Prerelease / build

#pragma mark - isValid

- (void)testIsValidMethodTrue
{
    STAssertTrue([EDSemver isValid:@"1.0.0"], nil);
}

@end
