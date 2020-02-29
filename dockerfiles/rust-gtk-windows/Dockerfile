# Based on https://github.com/NoraCodes/rust-mingw64-gtk-docker/blob/master/Dockerfile
# and https://hub.docker.com/r/circleci/rust/dockerfile

FROM fedora:31

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Update system
RUN dnf -y update; dnf clean all

# Fundamental packages
RUN dnf -y install file gcc make man git sudo tar which systemd-devel openssl-devel llvm llvm-devel clang; dnf clean all
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

# Update Rustup
RUN /home/circleci/.cargo/bin/rustup update

# Add Windows 64-bit target
RUN /home/circleci/.cargo/bin/rustup target add x86_64-pc-windows-gnu

# Install rustfmt
RUN /home/circleci/.cargo/bin/rustup component add rustfmt

# Install deps
USER root
RUN dnf -y install mingw64-gcc
RUN dnf -y install mingw64-freetype freetype freetype-devel
RUN dnf -y install mingw64-cairo mingw64-cairo-static cairo cairo-devel
RUN dnf -y install mingw64-harfbuzz harfbuzz harfbuzz-devel
RUN dnf -y install mingw64-pango pango pango-devel
RUN dnf -y install mingw64-poppler poppler poppler-devel
RUN dnf -y install mingw64-gtk3 gtk3 gtk3-devel
RUN dnf -y install mingw64-glib2-static glib2 glib2-devel
RUN dnf -y install atk atk-devel
RUN dnf -y install mingw64-winpthreads mingw64-winpthreads-static
RUN dnf -y install libappindicator-gtk3-devel

# Env
USER circleci
ENV PKG_CONFIG_ALLOW_CROSS=1
ENV PKG_CONFIG_PATH=/usr/i686-w64-mingw32/lib/pkgconfig
ENV CRT2=.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-pc-windows-gnu/lib/crt2.o
ENV WORKIN_CRT2=/usr/x86_64-w64-mingw32/sys-root/mingw/lib/crt2.o

WORKDIR /home/circleci

# Replace rusts crt2 with mingws version
RUN mv ${CRT2} ${CRT2}.bak
RUN cp ${WORKIN_CRT2} $CRT2

# Create work folder
RUN mkdir -p project

# Set permissions
USER root
RUN chown circleci project -R
RUN chown circleci /tmp/ -R

# Set workdir
USER circleci
WORKDIR /home/circleci/project

# Add cargo to path
ENV PATH /home/circleci/.cargo/bin:${PATH}

# Entry point
RUN pwd
CMD ["/bin/sh"]
