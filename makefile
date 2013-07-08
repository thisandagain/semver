test:
	cd Project && xctool -project semver.xcodeproj -test-sdk iphonesimulator -configuration Release test

.PHONY: test