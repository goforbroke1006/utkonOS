all: build
.PHONY: all

CARGO_TARGET_FILENAME = x86_64-utkon-os.json

build:
	cargo +nightly build --release --target ${CARGO_TARGET_FILENAME}
.PHONY: build

clean:
	cargo clean
.PHONY: clean

image:
	cargo +nightly bootimage --target ${CARGO_TARGET_FILENAME}
.PHONY: image