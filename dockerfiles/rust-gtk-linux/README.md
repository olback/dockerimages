# rust-gtk-windows

Build GTK 3 apps for Linux on CircleCI.

Example:
```yml
version: 2.1
jobs:
  build:
    docker:
      - image: olback/rust-gtk-windows:latest

    steps:
      - checkout

      - restore_cache:
          name: Restore Windows Rust Cache
          key: cargo-cache-windows-{{ checksum "Cargo.lock" }}-{{ checksum "Cargo.toml" }}

      - run:
          name: Use Stable as Default
          command: rustup default stable

      - run:
          name: Show Version
          command: |
                    rustc --version --verbose
                    rustup --version
                    cargo --version --verbose

      - run:
          name: Build Binary
          command: RUST_BACKTRACE=full PKG_CONFIG_ALLOW_CROSS=1 cargo build --release --target=x86_64-pc-windows-gnu

      - save_cache:
          name: Save Windows Rust Cache
          key: cargo-cache-windows-{{ checksum "Cargo.lock" }}-{{ checksum "Cargo.toml" }}
          paths:
            - "~/.cargo/"
            - "~/.rustup/"
            - "./target/"

      - run:
          name: "Generate hash file"
          command: "cd target/x86_64-pc-windows-gnu/release && sha256sum library-loader.exe > library-loader.exe.sha256"

      - run:
          name: "Verify hash"
          command: "cd target/x86_64-pc-windows-gnu/release && sha256sum -c library-loader.exe.sha256"

      - run:
          name: "Show hash"
          command: "cd target/x86_64-pc-windows-gnu/release && cat library-loader.exe.sha256"

      - save_cache:
          name: Save Windows Build
          key: ll-windows-dist-{{ .Environment.CIRCLE_SHA1 }}
          paths:
            - "./target/x86_64-pc-windows-gnu/release/library-loader.exe"
            - "./target/x86_64-pc-windows-gnu/release/library-loader.exe.sha256"

```
