# UtkonOS 2.0.0

Philipp Oppermann's sample implementation from article https://os.phil-opp.com/minimal-rust-kernel/

### How to compile

```shell
cd ./v2/ || true

bash ./setup.sh # to prepare local env
make clean # to clean previous build
make # to build binary
make image # to build bootloader image

# to run bootloader image with QEMU
qemu-system-x86_64 -drive format=raw,file=./target/x86_64-utkon-os/release/bootimage-utkon_os.bin


make iso

qemu-system-x86_64 -cdrom ./target/utkon-os-2.iso


# to write on USB device
dd if=./target/x86_64-utkon-os/release/bootimage-utkon_os.bin of=/dev/sdX && sync

```

### useful links

* https://github.com/rust-osdev/bootloader/tree/v0.9.23
