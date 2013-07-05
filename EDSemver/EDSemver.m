//
//  EDSemver.m
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import "EDSemver.h"

@interface EDSemver ()
@property (readwrite) BOOL isValid;
@property (readwrite) int major;
@property (readwrite) int minor;
@property (readwrite) int patch;
@property (readwrite, weak) NSString *prerelease;
@property (readwrite, weak) NSString *build;
@end

@implementation EDSemver

static NSString const *BUILD_DELIMITER          = @"+";
static NSString const *PRERELEASE_DELIMITER     = @"-";
static NSString const *VERSION_DELIMITER        = @".";
static NSString const *IGNORE_PREFIX            = @"v";

#pragma mark - Init

- (id)initWithString:(NSString *)input
{
    self = [super init];
    if (self) {
        // Parse
        NSArray *version = [self parse:input];
        
        // Set properites
        _major = [[version objectAtIndex:0] intValue];
        _minor = [[version objectAtIndex:1] intValue];
        _patch = [[version objectAtIndex:2] intValue];
        _prerelease = [version objectAtIndex:3];
        _build = [version objectAtIndex:4];
        
        // Check
        _isValid = [self check:input];
    }
    return self;
}

#pragma mark - Private methods

- (BOOL)check:(NSString *)input
{
    return !(_major == 0 && _minor == 0 && _patch == 0);
}

- (NSArray *)parse:(NSString *)input
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
        prerelease = [p lastObject];
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
