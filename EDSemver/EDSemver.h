//
//  EDSemver.h
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSemver : NSObject

+ (BOOL)isValid:(NSString *)input;
+ (int)major:(NSString *)input;
+ (int)minor:(NSString *)input;
+ (int)patch:(NSString *)input;
+ (NSString *)prerelease:(NSString *)input;
+ (NSString *)build:(NSString *)input;

+ (BOOL)version:(NSString *)ver isEqualTo:(NSString *)input;
+ (BOOL)version:(NSString *)ver isGreaterThan:(NSString *)input;
+ (BOOL)version:(NSString *)ver isGreaterThanOrEqualTo:(NSString *)input;
+ (BOOL)version:(NSString *)ver isLessThan:(NSString *)input;
+ (BOOL)version:(NSString *)ver isLessThanOrEqualTo:(NSString *)input;

@end
