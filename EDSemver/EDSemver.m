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
@property (readwrite) NSArray *pr;

@property NSString *original;
@property NSArray *version;
@end

@implementation EDSemver

static NSString const *BUILD_DELIMITER          = @"+";
static NSString const *PRERELEASE_DELIMITER     = @"-";
static NSString const *VERSION_DELIMITER        = @".";
static NSString const *IGNORE_PREFIX            = @"v";
static NSString const *IGNORE_EQ                = @"=";

#pragma mark - Init

+ (instancetype)semverWithString:(NSString *)aString
{
	return [[self alloc] initWithString:aString];
}

- (instancetype)initWithString:(NSString *)input
{
    self = [super init];
    if (self) {
        // Version of the Semver spec that this library is implementing
        // http://semver.org/spec/v2.0.0.html
        _spec       = @"2.0.0";

        // Lex the input string
        _original   = input;
        _version    = [self lex:input];

        // Check & set properties
        _isValid    = [self check];
        if (_isValid) {
            _major      = [[_version objectAtIndex:0] intValue];
            _minor      = [[_version objectAtIndex:1] intValue];
            _patch      = [[_version objectAtIndex:2] intValue];
            _prerelease = [_version objectAtIndex:3];
            _build      = [_version objectAtIndex:4];
            _pr         = [self parse:_prerelease strict:NO];
        }
    }
    return self;
}

#pragma mark - Public methods

- (NSComparisonResult)compare:(EDSemver *)aVersion
{
	if (![self isValid] || ![aVersion isValid]) {
		[[NSException exceptionWithName:NSInvalidArgumentException reason:@"nil argument" userInfo:nil] raise];
	}

	NSComparisonResult result = [@([self major]) compare:@([aVersion major])];
	if (result != NSOrderedSame) {
		return result;
	}

	result = [@([self minor]) compare:@([aVersion minor])];
	if (result != NSOrderedSame) {
		return result;
	}

	result = [@([self patch]) compare:@([aVersion patch])];
	if (result != NSOrderedSame) {
		return result;
	}

	if ([[self prerelease] length] > 0 || [[aVersion prerelease] length] > 0) {
		if ([[self prerelease] length] > 0 && [[aVersion prerelease] length] == 0) return NSOrderedAscending;
		if ([[self prerelease] length] == 0 && [[aVersion prerelease] length] > 0) return NSOrderedDescending;
        return [[self prerelease] compare:[aVersion prerelease]];
    }

	return NSOrderedSame;
}

- (BOOL)isEqualTo:(EDSemver *)input
{
    return [self compare:input] == NSOrderedSame;
}

- (BOOL)isLessThan:(EDSemver *)input
{
    return [self compare:input] == NSOrderedAscending;
}

- (BOOL)isGreaterThan:(EDSemver *)input
{
    return [self compare:input] == NSOrderedDescending;
}

- (NSString *)description
{
	return _original;
}

- (NSString *)debugDescription
{
	return [[super debugDescription] stringByReplacingOccurrencesOfString:@">" withString:[NSString stringWithFormat:@" (%@)>", _original]];
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

- (NSArray *)lex:(NSString *)input
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
        if ([[input substringWithRange:NSMakeRange(0, 1)] isEqualToString:(NSString *)IGNORE_EQ]) {
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

    // Parse remainder and append pre-release & build strings
    NSMutableArray *v = [[NSMutableArray alloc] initWithArray:[self parse:input strict:YES]];
    [v addObject:prerelease];
    [v addObject:build];

    return v;
}

- (NSArray *)parse:(NSString *)input strict:(BOOL)strict
{
    NSMutableArray *v = [[NSMutableArray alloc] initWithArray:[input componentsSeparatedByString:(NSString *)VERSION_DELIMITER]];
    for (int i = [v count]; i < 3; i++) {
        [v addObject:@"0"];
    }

    return v;
}

@end
