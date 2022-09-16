FROM fedora:37

USER root

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Update system
RUN dnf -y update
RUN dnf -y upgrade

# Fundamental packages
RUN dnf -y install file make git sudo tar which openssl-devel llvm llvm-devel clang mold systemd-devel; dnf clean all
# Download Rustup installer
RUN curl https://sh.rustup.rs -o /usr/bin/rustup-install
RUN chmod +x /usr/bin/rustup-install

# Add user
RUN groupadd --gid 1000 circleci \
    && useradd --uid 1000 --gid circleci --shell /bin/bash --create-home circleci \
    && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci
USER circleci

# Install Rustup
RUN rustup-install -y

# Env / Add cargo to path
ENV PKG_CONFIG_ALLOW_CROSS=1
ENV PATH /home/circleci/.cargo/bin:${PATH}

# Update Rustup
RUN rustup update

# Install components and cargo tools
RUN rustup component add llvm-tools-preview
RUN rustup component add rustfmt
RUN rustup component add clippy
RUN rustup +nightly component add llvm-tools-preview
RUN rustup +nightly component add rustfmt
RUN rustup +nightly component add clippy
RUN cargo install cargo-expand --locked
RUN cargo install cargo-make --locked
RUN cargo install cargo-binutils --locked
RUN cargo install cargo-outdated --locked
RUN cargo install cargo-audit --locked

# Create work folder
WORKDIR /home/circleci
RUN mkdir -p project

# Set permissions
USER root
RUN chown circleci project -R
RUN chown circleci /tmp/ -R

# Set workdir
USER circleci
WORKDIR /home/circleci/project

# Entry point
RUN pwd
CMD [ "/bin/bash" ]
