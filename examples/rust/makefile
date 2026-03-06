.POSIX:
.SILENT:
.PHONY: \
	crit \
	install \
	package \
	publish

VERSION=0.0.1
BANNER=raygun-$(VERSION)

crit:
	crit -b $(BANNER)

install:
	cargo install --force --path .

package:
	rockhopper

publish:
	cargo publish
