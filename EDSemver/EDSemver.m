//
//  EDSemver.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemver.h"

@implementation EDSemver

static NSString const *IGNORE_V_PREFIX = @"v";
static NSString const *IGNORE_EQ_PREFIX = @"=";

#pragma mark - Public methods

- (BOOL)isValid:(NSString *)ver
{
    [@"something" isGreaterThan:@""];
    [EDSemver version:@"something" isGreaterThan:@""];
}

- (BOOL)version:(NSString *)ver satisfies:(NSString *)input
{
    
}

- (BOOL)version:(NSString *)ver isGreaterThan:(NSString *)input
{
    
}

- (BOOL)version:(NSString *)ver isLessThan:(NSString *)input
{
    
}

#pragma mark - Private methods

- (NSString *)_sanitize:(NSString *)ver
{
    
}

@end
