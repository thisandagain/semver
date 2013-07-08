test:
	cd Project && xctool -project semver.xcodeproj -scheme 'Test' build -sdk iphonesimulator -configuration Release
	cd Project && xctool -project semver.xcodeproj -scheme 'Test' build-tests -sdk iphonesimulator -configuration Release
	cd Project && xctool -project semver.xcodeproj -scheme 'Test' test -test-sdk iphonesimulator -configuration Release

.PHONY: test