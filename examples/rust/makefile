.POSIX:
.SILENT:
.PHONY: \
	crit \
	package \
	publish

VERSION=0.0.1
BANNER=raygun-$(VERSION)

crit:
	crit -b $(BANNER)

package:
	rockhopper

publish:
	cargo publish
