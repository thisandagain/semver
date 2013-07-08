test:
	cd Project && /Users/asliwinski/Documents/xctool/build.sh -project semver.xcodeproj -scheme 'semver' build -sdk iphonesimulator -configuration Release
	cd Project && /Users/asliwinski/Documents/xctool/build.sh -project semver.xcodeproj -scheme 'semver' build-tests -sdk iphonesimulator -configuration Release
	cd Project && /Users/asliwinski/Documents/xctool/build.sh -project semver.xcodeproj -scheme 'semver' test -test-sdk iphonesimulator -configuration Release

.PHONY: test