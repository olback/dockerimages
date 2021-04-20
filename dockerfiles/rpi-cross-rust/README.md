# Cross compile rust for Linux ARM targets

`.cargo/config.toml`:
```
[build]
target = "armv7-unknown-linux-gnueabihfl"

[target.armv7-unknown-linux-gnueabihf]
linker = "arm-linux-gnueabihf-gcc"

[target.armv7-unknown-linux-musleabihf]
linker = "arm-linux-gnueabihf-gcc"
```

Terminal:
```
docker run -it -v $(pwd):/home/rust/project olback/rpi-cross-rust:latest /bin/bash
```

Inside container:
```
cargo build
```
