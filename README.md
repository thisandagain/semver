## Semver (Work In Progress)

### Basic Use
```objective-c
#import "EDSemver.h"
```

```objective-c
BOOL lt = [EDSemver version:@"v1.1.3" isLessThan:@"v1.4.1-alpha2"];
return lt;  // YES
```

---

### Versions


### Methods
```objective-c
- (BOOL)isValid:(NSString *)ver;
- (NSString *)sanitize:(NSString *)ver;

- (BOOL)version:(NSString *)ver isEqualTo:(NSString *)input;
- (BOOL)version:(NSString *)ver isGreaterThan:(NSString *)input;
- (BOOL)version:(NSString *)ver isGreaterThanOrEqualTo:(NSString *)input;
- (BOOL)version:(NSString *)ver isLessThan:(NSString *)input;
- (BOOL)version:(NSString *)ver isLessThanOrEqualTo:(NSString *)input;
```

### NSString+Semver
Alternatively, EDSemver can be used as a category of NSString. When used in this way, the interface is slightly more lightweight at the expense of being less explicit:

```objective-c
#import "NSString+Semver.h"
```

```objective-c
BOOL gt = [@"v1.4.8-alpha5" isGreaterThan:@"v4.8"];
return gt;  // NO
```

---

### Testing
The test suite for `EDSemver` is built using OCUnit. To run the test suite, simply open the project in XCode and choose "test" from the Product menu. Please run and augment the tests prior to submitting a pull request.

### iOS Support
EDSemver is tested on iOS 5 and up. Older versions of iOS may work but are not currently supported.

### ARC
EDSemver is built using ARC. If you are including EDSemver in a project that **does not** use [Automatic Reference Counting (ARC)](http://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html), you will need to set the `-fobjc-arc` compiler flag on all of the EDSemver source files. To do this in Xcode, go to your active target and select the "Build Phases" tab. Now select all EDSemver source files, press Enter, insert `-fobjc-arc` and then "Done" to enable ARC for EDSemver.
