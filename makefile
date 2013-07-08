test:
	cd Project && xctool -project semver.xcodeproj -scheme 'semver' build -sdk iphonesimulator -configuration Release
	cd Project && xctool -project semver.xcodeproj -scheme 'semver' build-tests -sdk iphonesimulator -configuration Release
	cd Project && xctool -project semver.xcodeproj -scheme 'semver' test -test-sdk iphonesimulator -configuration Release

.PHONY: test