//
//  EDSemverParse.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemverHarness.h"

@interface EDSemverParse : SenTestCase
@end

NSInteger zero = 0, one = 1, two = 2, three = 3, twentyThree = 23;

@implementation EDSemverParse

- (void)testParseMajor
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"1.0.0"];
    STAssertEquals(one, [ver major], MAJOR_DESC);
    STAssertEquals(zero, [ver minor], MINOR_DESC);
    STAssertEquals(zero, [ver patch], PATCH_DESC);
    STAssertEqualObjects(@"", [ver prerelease], PRERELEASE_DESC);
    STAssertEqualObjects(@"", [ver build], BUILD_DESC);
}

- (void)testParseMinor
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"0.1.0"];
    STAssertEquals(zero, [ver major], MAJOR_DESC);
    STAssertEquals(one, [ver minor], MINOR_DESC);
    STAssertEquals(zero, [ver patch], PATCH_DESC);
    STAssertEqualObjects(@"", [ver prerelease], PRERELEASE_DESC);
    STAssertEqualObjects(@"", [ver build], BUILD_DESC);
}

- (void)testParsePatch
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"0.0.1"];
    STAssertEquals(zero, [ver major], MAJOR_DESC);
    STAssertEquals(zero, [ver minor], MINOR_DESC);
    STAssertEquals(one, [ver patch], PATCH_DESC);
    STAssertEqualObjects(@"", [ver prerelease], PRERELEASE_DESC);
    STAssertEqualObjects(@"", [ver build], BUILD_DESC);
}

- (void)testParsePrerelease
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"1.2.3-alpha"];
    STAssertEquals(one, [ver major], MAJOR_DESC);
    STAssertEquals(two, [ver minor], MINOR_DESC);
    STAssertEquals(three, [ver patch], PATCH_DESC);
    STAssertEqualObjects(@"alpha", [ver prerelease], PRERELEASE_DESC);
    STAssertEqualObjects(@"", [ver build], BUILD_DESC);
}

- (void)testParseBuild
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"1.2.3+1"];
    STAssertEquals(one, [ver major], MAJOR_DESC);
    STAssertEquals(two, [ver minor], MINOR_DESC);
    STAssertEquals(three, [ver patch], PATCH_DESC);
    STAssertEqualObjects(@"", [ver prerelease], PRERELEASE_DESC);
    STAssertEqualObjects(@"1", [ver build], BUILD_DESC);
}

- (void)testParseComplex
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"v1.2.23-alpha+1.833"];
    STAssertEquals(one, [ver major], MAJOR_DESC);
    STAssertEquals(two, [ver minor], MINOR_DESC);
    STAssertEquals(twentyThree, [ver patch], PATCH_DESC);
    STAssertEqualObjects(@"alpha", [ver prerelease], PRERELEASE_DESC);
    STAssertEqualObjects(@"1.833", [ver build], BUILD_DESC);
}

@end
