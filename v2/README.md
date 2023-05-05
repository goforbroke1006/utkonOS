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
qemu-system-x86_64 -drive format=raw,file=./target/x86_64-utkon-os/debug/bootimage-utkon_os.bin
```
