FROM olback/rust-windows:latest

# Install deps
USER root
RUN dnf -y install librsvg2 librsvg2-devel
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

USER circleci

# Entry point
RUN pwd
CMD [ "/bin/bash" ]
