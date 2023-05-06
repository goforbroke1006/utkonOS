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
	cargo +nightly bootimage --release --target ${CARGO_TARGET_FILENAME}
.PHONY: image

TARGET_ISO_DIR = ./target/isodir
TARGET_KERNEL = ${TARGET_ISO_DIR}/boot/kernel.bin

iso: image
	grub-file --is-x86-multiboot ./target/x86_64-utkon-os/release/bootimage-utkon_os.bin
	mkdir -p ${TARGET_ISO_DIR}/boot/grub
	cp .iso/grub.cfg ${TARGET_ISO_DIR}/boot/grub/grub.cfg
	cp target/x86_64-utkon-os/release/bootimage-utkon_os.bin ${TARGET_KERNEL}
	grub-mkrescue -o target/utkon-os-2.iso ${TARGET_ISO_DIR}
.PHONY: iso
