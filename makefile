test:
	cd Project && xctool -project semver.xcodeproj -sdk iphonesimulator test

.PHONY: test