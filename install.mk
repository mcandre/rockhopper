.POSIX:
.SILENT:
.PHONY: all

all:
	go install golang.org/x/vuln/cmd/govulncheck@latest
	go install tool
	go mod tidy
	cargo install --force \
		cargo-audit \
		cargo-cache \
		cargo-edit
	rustup component add \
		clippy \
		rustfmt
