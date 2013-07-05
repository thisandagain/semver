//
//  EDSemver.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemver.h"

@implementation EDSemver

static NSString const *BUILD_DELIMITER          = @"+";
static NSString const *PRERELEASE_DELIMITER     = @"-";
static NSString const *VERSION_DELIMITER        = @".";
static NSString const *IGNORE_PREFIX            = @"v";

#pragma mark - Public utilities

+ (BOOL)isValid:(NSString *)input
{
    return YES;
}

+ (int)major:(NSString *)input
{
    return [[[self _split:input] objectAtIndex:0] intValue];
}

+ (int)minor:(NSString *)input
{
    return [[[self _split:input] objectAtIndex:1] intValue];
}

+ (int)patch:(NSString *)input
{
    return [[[self _split:input] objectAtIndex:2] intValue];
}

+ (NSString *)prerelease:(NSString *)input
{
    return [[self _split:input] objectAtIndex:3];
}

+ (NSString *)build:(NSString *)input
{
    return [[self _split:input] objectAtIndex:4];
}

#pragma mark- Public comparators


#pragma mark - Private methods

+ (NSArray *)_split:(NSString *)input
{
    // Storage objects
    NSString *build         = @"";
    NSString *prerelease    = @"";
    
    // Strip prefix
    if ([[input substringWithRange:NSMakeRange(0, 1)] isEqualToString:(NSString *)IGNORE_PREFIX]) {
        input = [input substringFromIndex:1];
    };
    
    // Build
    NSArray *b = [input componentsSeparatedByString:(NSString *)BUILD_DELIMITER];
    if ([b count] > 1) {
        input = [b objectAtIndex:0];
        build = [b lastObject];
    }

    // Pre-release
    NSArray *p = [input componentsSeparatedByString:(NSString *)PRERELEASE_DELIMITER];
    if ([p count] > 1) {
        input = [p objectAtIndex:0];
        build = [p lastObject];
    }

    // Version
    NSMutableArray *v = [[NSMutableArray alloc] initWithArray:[input componentsSeparatedByString:(NSString *)VERSION_DELIMITER]];
    for (int i = [v count]; i < 3; i++) {
        [v addObject:@"0"];
    }
    
    [v addObject:prerelease];
    [v addObject:build];
    return v;
}

@end
