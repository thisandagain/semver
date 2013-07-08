test:
	cd Project && xctool -project semver.xcodeproj -scheme 'semver' test -test-sdk iphonesimulator -configuration Release

.PHONY: test