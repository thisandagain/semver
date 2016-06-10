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
@property (readonly, nullable) NSString *prerelease;
@property (readonly, nullable) NSString *build;

+ (nonnull NSString *)spec;
+ (nonnull instancetype)semverWithString:(nonnull NSString *)aString;

- (nonnull instancetype)initWithString:(nonnull NSString *)aString;
- (NSComparisonResult)compare:(nonnull EDSemver *)aVersion;
- (BOOL)isValid;

@end