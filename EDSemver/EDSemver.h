//
//  EDSemver.h
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSemver : NSObject

@property (readonly) NSString *spec;

@property (readonly) BOOL isValid;
@property (readonly) int major;
@property (readonly) int minor;
@property (readonly) int patch;
@property (readonly) NSString *prerelease;
@property (readonly) NSString *build;

+ (instancetype)semverWithString:(NSString *)aString;
- (instancetype)initWithString:(NSString *)input;
- (NSComparisonResult)compare:(EDSemver *)aVersion;
- (BOOL)isEqualTo:(EDSemver *)input;
- (BOOL)isLessThan:(EDSemver *)input;
- (BOOL)isGreaterThan:(EDSemver *)input;

@end