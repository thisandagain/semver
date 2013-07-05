//
//  EDSemver.h
//  semver
//
//  Created by Andrew Sliwinski on 7/4/13.
//  Copyright (c) 2013 Andrew Sliwinski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSemver : NSObject

@property (readonly) BOOL isValid;
@property (readonly) int major;
@property (readonly) int minor;
@property (readonly) int patch;
@property (readonly, weak) NSString *prerelease;
@property (readonly, weak) NSString *build;

- (id)initWithString:(NSString *)input;

@end