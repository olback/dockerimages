# Based on https://github.com/NoraCodes/rust-mingw64-gtk-docker/blob/master/Dockerfile
# and https://hub.docker.com/r/circleci/rust/dockerfile

FROM fedora:31

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Update system
RUN dnf -y update; dnf clean all

# Fundamental packages
RUN dnf -y install file gcc make man git sudo tar which; dnf clean all

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

# Install rustfmt
RUN /home/circleci/.cargo/bin/rustup component add rustfmt

# Install deps
USER root
RUN dnf -y install freetype freetype-devel
RUN dnf -y install cairo cairo-devel
RUN dnf -y install harfbuzz harfbuzz-devel
RUN dnf -y install pango pango-devel
RUN dnf -y install poppler poppler-devel
RUN dnf -y install gtk3 gtk3-devel
RUN dnf -y install glib2 glib2-devel
RUN dnf -y install atk atk-devel

WORKDIR /home/circleci

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
