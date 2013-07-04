## Semver

### Getting Started
The quickest way to get started with `EDSemver` is to add the `EDSemver` directory to your project and...
```objective-c
#import "EDSemver.h"
```

---

### Testing
The test suite for `EDSemver` is built using OCUnit. To run the test suite, simply open the project in XCode and choose "test" from the Product menu. Please run and augment the tests prior to submitting a pull request.

### iOS Support
EDSemver is tested on iOS 5 and up. Older versions of iOS may work but are not currently supported.

### ARC
EDSemver is built using ARC. If you are including EDSemver in a project that **does not** use [Automatic Reference Counting (ARC)](http://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html), you will need to set the `-fobjc-arc` compiler flag on all of the EDSemver source files. To do this in Xcode, go to your active target and select the "Build Phases" tab. Now select all EDSemver source files, press Enter, insert `-fobjc-arc` and then "Done" to enable ARC for EDSemver.
