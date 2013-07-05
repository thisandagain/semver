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
@property (readwrite) NSString *prerelease;
@property (readwrite) NSString *build;

@property NSString *original;
@property NSArray *version;
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
        _original = input;
        _version = [self parse:input];
        
        // Check & set properties
        _isValid = [self check];
        if (_isValid) {
            _major = [[_version objectAtIndex:0] intValue];
            _minor = [[_version objectAtIndex:1] intValue];
            _patch = [[_version objectAtIndex:2] intValue];
            _prerelease = [_version objectAtIndex:3];
            _build = [_version objectAtIndex:4];
        }
    }
    return self;
}

#pragma mark - Private methods

- (BOOL)check
{
    // Edge cases
    if (_original == nil) return NO;
    if ([_original isEqualToString:@""]) return NO;

    // Check that major, minor, and patch values are numbers
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    for (int i = 0; i < 3; i++) {
        if ([nf numberFromString:[_version objectAtIndex:i]] == nil) return NO;
    }
    
    return YES;
}

- (NSArray *)parse:(NSString *)input
{
    // Storage objects
    NSString *build         = @"";
    NSString *prerelease    = @"";
    
    // Strip whitespace & prefix
    if (input.length > 0) {
        input = [input stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([[input substringWithRange:NSMakeRange(0, 1)] isEqualToString:(NSString *)IGNORE_PREFIX]) {
            input = [input substringFromIndex:1];
        };
    }
    
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
