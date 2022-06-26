FROM olback/rust-linux:latest

# Install deps
USER root
RUN dnf -y install librsvg2 librsvg2-devel
RUN dnf -y install freetype freetype-devel
RUN dnf -y install cairo cairo-devel
RUN dnf -y install harfbuzz harfbuzz-devel
RUN dnf -y install pango pango-devel
RUN dnf -y install poppler poppler-devel
RUN dnf -y install gtk3 gtk3-devel
RUN dnf -y install glib2 glib2-devel
RUN dnf -y install atk atk-devel
RUN dnf -y install libappindicator-gtk3-devel
RUN dnf -y install libXScrnSaver-devel

USER circleci

# Entry point
RUN pwd
CMD [ "/bin/sh" ]
