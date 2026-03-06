.POSIX:
.SILENT:
.PHONY: all

all:
	cargo install --force \
		crit@0.0.17
	cargo install --force \
		cross \
			--git https://github.com/cross-rs/cross \
			--rev 4e64366af6095c84fa4f54a0fa5a2ba7d9a271aa
