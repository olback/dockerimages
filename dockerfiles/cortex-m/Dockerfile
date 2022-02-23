FROM rust:slim-bullseye

# Install packages
RUN apt update && apt install binutils-arm-none-eabi gcc-arm-none-eabi libnewlib-arm-none-eabi libnewlib-dev libstdc++-arm-none-eabi-newlib -y
RUN apt update && apt install clang clang-tools libc++abi1 libclang1 lld -y
RUN apt update && apt install git sudo libssl-dev pkg-config ninja-build meson build-essential -y

# Add user
RUN groupadd --gid 1000 circleci \
    && useradd --uid 1000 --gid circleci --shell /bin/bash --create-home circleci \
    && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci
USER circleci

# Cortex-M0, Cortex-M0+
RUN rustup target add thumbv6m-none-eabi
RUN rustup +nightly target add thumbv6m-none-eabi

# Cortex-M3, Cortex-M4, Cortex-M4F, Cortex-M7, Cortex-M7F
RUN rustup target add thumbv7em-none-eabihf
RUN rustup target add thumbv7em-none-eabi
RUN rustup target add thumbv7m-none-eabi
RUN rustup +nightly target add thumbv7em-none-eabihf
RUN rustup +nightly target add thumbv7em-none-eabi
RUN rustup +nightly target add thumbv7m-none-eabi

# Cortex-M23, Cortex-M33, Cortex-M35P, Cortex-M55
RUN rustup target add thumbv8m.base-none-eabi
RUN rustup target add thumbv8m.main-none-eabi
RUN rustup target add thumbv8m.main-none-eabihf
RUN rustup +nightly target add thumbv8m.base-none-eabi
RUN rustup +nightly target add thumbv8m.main-none-eabi
RUN rustup +nightly target add thumbv8m.main-none-eabihf

# Components
RUN rustup component add llvm-tools-preview
RUN rustup component add rustfmt
RUN rustup component add clippy
RUN rustup +nightly component add llvm-tools-preview
RUN rustup +nightly component add rustfmt
RUN rustup +nightly component add clippy


# Install Cargo tools
RUN cargo install cargo-expand
RUN cargo install cargo-make
RUN cargo install cargo-binutils

# Make project dir
RUN mkdir -p /home/circleci/project

WORKDIR /home/circleci/project
