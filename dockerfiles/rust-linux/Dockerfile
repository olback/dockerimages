FROM olback/rust-base:latest

USER circleci

# Add Linux 64-bit targets
RUN /home/circleci/.cargo/bin/rustup +stable target add x86_64-unknown-linux-musl
RUN /home/circleci/.cargo/bin/rustup +nightly target add x86_64-unknown-linux-musl
RUN /home/circleci/.cargo/bin/rustup +stable target add x86_64-unknown-linux-gnu
RUN /home/circleci/.cargo/bin/rustup +nightly target add x86_64-unknown-linux-gnu

# Install components
RUN /home/circleci/.cargo/bin/rustup component add rustfmt
RUN /home/circleci/.cargo/bin/rustup component add clippy

# Entry point
RUN pwd
CMD [ "/bin/bash" ]
