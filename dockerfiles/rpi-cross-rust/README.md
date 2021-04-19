# Cross compile rust for Linux ARM targets

`.cargo/config.toml`:
```
[build]
target = "arm-unknown-linux-gnueabihfl"

[target.arm-unknown-linux-gnueabihf]
linker = "arm-linux-gnueabihf-gcc"
```

`cargo.sh`:
```
#!/bin/sh

docker run --rm -it -v $(pwd):/home/rust/project rpi-cross-rust:latest cargo $@
```

### Running cargo commands
```
./cargo.sh build --release
./cargo.sh run
...
```
