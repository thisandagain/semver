## Semver
`EDSemver` is a helper library for Objective-C based on the 2.0.0 spec of [Semantic Versioning](http://semver.org/).

### Basic Use
```objective-c
#import "EDSemver.h"
```

```objective-c
EDSemver *left  = [[EDSemver alloc] initWithString:@"1.2.3-foo"];
EDSemver *right = [[EDSemver alloc] initWithString:@"1.2.3"];
return [left isGreaterThan:right]; // NO
```

```objective-c
EDSemver *version  = [[EDSemver alloc] initWithString:@"v22.0.4-alpha+1234"];
return [version major]; // 22
```

---

### Properties
```objective-c
@property (readonly) BOOL isValid;
@property (readonly) NSInteger major;
@property (readonly) NSInteger minor;
@property (readonly) NSInteger patch;
@property (readonly) NSString *prerelease;
@property (readonly) NSString *build;
```

### Methods
```objective-c
+ (instancetype)semverWithString:(NSString *)aString;
- (instancetype)initWithString:(NSString *)aString;
- (NSComparisonResult)compare:(EDSemver *)aVersion;
- (BOOL)isEqualTo:(EDSemver *)aVersion;
- (BOOL)isLessThan:(EDSemver *)aVersion;
- (BOOL)isGreaterThan:(EDSemver *)aVersion;
```

---

### Testing
The [test suite](https://github.com/thisandagain/semver/tree/master/Project/semverTests) for `EDSemver` is built using OCUnit. To run the test suite, simply open the project in XCode and choose "test" from the Product menu. Please run and augment the tests prior to submitting a pull request.

### iOS Support
EDSemver is tested on iOS 5 and up. Older versions of iOS may work but are not currently supported.

### ARC
EDSemver is built using ARC. If you are including EDSemver in a project that **does not** use [Automatic Reference Counting (ARC)](http://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html), you will need to set the `-fobjc-arc` compiler flag on all of the EDSemver source files. To do this in Xcode, go to your active target and select the "Build Phases" tab. Now select all EDSemver source files, press Enter, insert `-fobjc-arc` and then "Done" to enable ARC for EDSemver.
