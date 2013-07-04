//
//  EDSemver.h
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSemver : NSObject

- (BOOL)isValid:(NSString *)ver;
- (NSString *)sanitize:(NSString *)ver;

- (BOOL)version:(NSString *)ver isEqualTo:(NSString *)input;
- (BOOL)version:(NSString *)ver isGreaterThan:(NSString *)input;
- (BOOL)version:(NSString *)ver isGreaterThanOrEqualTo:(NSString *)input;
- (BOOL)version:(NSString *)ver isLessThan:(NSString *)input;
- (BOOL)version:(NSString *)ver isLessThanOrEqualTo:(NSString *)input;

@end
