FROM postgres:12-alpine

# Add edge/testing repo
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install pg_cron
RUN apk add postgresql-pg_cron

# Configure pg_cron database
# RUN echo "cron.database_name = 'app'" >> /var/lib/postgresql/data/postgresql.conf

# Enable pg_cron
# RUN echo "shared_preload_libraries = 'pg_cron'" >> /var/lib/postgresql/data/postgresql.conf

# Link files as they are not in the right place...
COPY link.sh .
RUN ./link.sh

# Link pg_cron.so
RUN ln -s /usr/lib/postgresql/pg_cron.so /usr/local/lib/postgresql/pg_cron.so

CMD [ "-c", "shared_preload_libraries=pg_cron" ]
