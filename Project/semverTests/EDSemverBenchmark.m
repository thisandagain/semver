//
//  EDSemverBenchmark.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemverHarness.h"

@interface EDSemverBenchmark : XCTestCase
@end

@interface EDSemverBenchmark ()
@property NSArray *list;
@end

@implementation EDSemverBenchmark

@synthesize list = _list;

- (void)setUp
{
    [super setUp];

    _list = @[@"1.2.3", @"v1.2.3", @"1.2.3-foo", @"1.0.0-alpha", @"1.0-alpha", @"1-alpha", @"   1.2.3", @"1.2.3 ", @"v1.0.0-alpha", @"v1.2-alpha+123"];
}

- (void)testBenchmark
{
    for (NSUInteger i = 0; i < 1000; i++) {
        EDSemver *ver = [[EDSemver alloc] initWithString:[_list objectAtIndex:i % 10]];
        XCTAssertTrue([ver isValid], VALID_DESC);
    }
}

@end
