//
//  EDSemverParse.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemverHarness.h"

@interface EDSemverParse : XCTestCase
@end

NSInteger zero = 0, one = 1, two = 2, three = 3, twentyThree = 23;

@implementation EDSemverParse

- (void)testParseMajor
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"1.0.0"];
    XCTAssertEqual(one, [ver major], MAJOR_DESC);
    XCTAssertEqual(zero, [ver minor], MINOR_DESC);
    XCTAssertEqual(zero, [ver patch], PATCH_DESC);
    XCTAssertEqualObjects(@"", [ver prerelease], PRERELEASE_DESC);
    XCTAssertEqualObjects(@"", [ver build], BUILD_DESC);
}

- (void)testParseMinor
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"0.1.0"];
    XCTAssertEqual(zero, [ver major], MAJOR_DESC);
    XCTAssertEqual(one, [ver minor], MINOR_DESC);
    XCTAssertEqual(zero, [ver patch], PATCH_DESC);
    XCTAssertEqualObjects(@"", [ver prerelease], PRERELEASE_DESC);
    XCTAssertEqualObjects(@"", [ver build], BUILD_DESC);
}

- (void)testParsePatch
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"0.0.1"];
    XCTAssertEqual(zero, [ver major], MAJOR_DESC);
    XCTAssertEqual(zero, [ver minor], MINOR_DESC);
    XCTAssertEqual(one, [ver patch], PATCH_DESC);
    XCTAssertEqualObjects(@"", [ver prerelease], PRERELEASE_DESC);
    XCTAssertEqualObjects(@"", [ver build], BUILD_DESC);
}

- (void)testParsePrerelease
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"1.2.3-alpha"];
    XCTAssertEqual(one, [ver major], MAJOR_DESC);
    XCTAssertEqual(two, [ver minor], MINOR_DESC);
    XCTAssertEqual(three, [ver patch], PATCH_DESC);
    XCTAssertEqualObjects(@"alpha", [ver prerelease], PRERELEASE_DESC);
    XCTAssertEqualObjects(@"", [ver build], BUILD_DESC);
}

- (void)testParseBuild
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"1.2.3+1"];
    XCTAssertEqual(one, [ver major], MAJOR_DESC);
    XCTAssertEqual(two, [ver minor], MINOR_DESC);
    XCTAssertEqual(three, [ver patch], PATCH_DESC);
    XCTAssertEqualObjects(@"", [ver prerelease], PRERELEASE_DESC);
    XCTAssertEqualObjects(@"1", [ver build], BUILD_DESC);
}

- (void)testParseComplex
{
    EDSemver *ver = [[EDSemver alloc] initWithString:@"v1.2.23-alpha+1.833"];
    XCTAssertEqual(one, [ver major], MAJOR_DESC);
    XCTAssertEqual(two, [ver minor], MINOR_DESC);
    XCTAssertEqual(twentyThree, [ver patch], PATCH_DESC);
    XCTAssertEqualObjects(@"alpha", [ver prerelease], PRERELEASE_DESC);
    XCTAssertEqualObjects(@"1.833", [ver build], BUILD_DESC);
}

@end
