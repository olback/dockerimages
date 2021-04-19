FROM rust:1-bullseye

# Update system and install toolchain
RUN apt update
RUN apt upgrade -y
RUN apt install sudo cmake make -y
RUN apt install gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf -y

# Install rust targets
RUN rustup target add arm-unknown-linux-gnueabihf arm-unknown-linux-musleabihf
RUN rustup +nightly target add arm-unknown-linux-gnueabihf arm-unknown-linux-musleabihf

# Add user
RUN groupadd --gid 1000 rust \
  && useradd --uid 1000 --gid rust --shell /bin/bash --create-home rust \
  && echo 'rust ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-rust
USER rust

RUN mkdir -p /home/rust/project

WORKDIR /home/rust/project
