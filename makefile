test:
	cd Project && xctool -project semver.xcodeproj -scheme 'semver' -test-sdk iphonesimulator -configuration Release test

.PHONY: test