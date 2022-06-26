# rust-gtk-linux

Build GTK 3 apps for Linux on CircleCI.

Example:
```yml
version: 2.1
jobs:
  build:
    docker:
      - image: olback/rust-gtk-linux:latest

    steps:
      - checkout

      - restore_cache:
          name: Restore Linux Rust Cache
          key: cargo-cache-linux-{{ checksum "Cargo.lock" }}-{{ checksum "Cargo.toml" }}

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
          command: cargo build --release --target=x86_64-unknown-linux-gnu

      - save_cache:
          name: Save Linux Rust Cache
          key: cargo-cache-linux-{{ checksum "Cargo.lock" }}-{{ checksum "Cargo.toml" }}
          paths:
            - "~/.cargo/"
            - "~/.rustup/"
            - "./target/"

      - run:
          name: "Generate hash file"
          command: "cd target/x86_64-unknown-linux-gnu/release && sha256sum library-loader > library-loader.sha256"

      - run:
          name: "Verify hash"
          command: "cd target/x86_64-unknown-linux-gnu/release && sha256sum -c library-loader.sha256"

      - run:
          name: "Show hash"
          command: "cd target/x86_64-unknown-linux-gnu/release && cat library-loader.sha256"

      - save_cache:
          name: Save Linux Build Cache
          key: ll-linux-dist-{{ .Environment.CIRCLE_SHA1 }}
          paths:
            - "./target/x86_64-unknown-linux-gnu/release/library-loader"
            - "./target/x86_64-unknown-linux-gnu/release/library-loader.sha256"

```
