FROM olback/rust-base

USER root

RUN dnf -y install mingw64-gcc
RUN dnf -y install mingw64-winpthreads mingw64-winpthreads-static

USER circleci

# Add Windows 64-bit target
RUN /home/circleci/.cargo/bin/rustup +stable target add x86_64-pc-windows-gnu
RUN /home/circleci/.cargo/bin/rustup +nightly target add x86_64-pc-windows-gnu

# Install components
RUN /home/circleci/.cargo/bin/rustup component add rustfmt
RUN /home/circleci/.cargo/bin/rustup component add clippy

# Entry point
RUN pwd
CMD [ "/bin/bash" ]
