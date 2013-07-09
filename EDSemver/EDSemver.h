//
//  EDSemver.h
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSemver : NSObject

@property (readonly) NSInteger major;
@property (readonly) NSInteger minor;
@property (readonly) NSInteger patch;
@property (readonly) NSString *prerelease;
@property (readonly) NSString *build;

+ (NSString *)spec;
+ (instancetype)semverWithString:(NSString *)aString;

- (instancetype)initWithString:(NSString *)input;
- (NSComparisonResult)compare:(EDSemver *)aVersion;
- (BOOL)isEqualTo:(EDSemver *)input;
- (BOOL)isLessThan:(EDSemver *)input;
- (BOOL)isGreaterThan:(EDSemver *)input;
- (BOOL)isValid;

@end