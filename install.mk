.POSIX:
.SILENT:
.PHONY: all

all:
	cargo install --force \
		cargo-audit \
		cargo-cache \
		cargo-edit
	rustup component add \
		clippy \
		rustfmt
	go install golang.org/x/vuln/cmd/govulncheck@latest
	go install tool
	go mod tidy
