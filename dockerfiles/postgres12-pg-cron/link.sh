#!/bin/sh

for FILE in $(ls /usr/share/postgresql/extension/ | grep pg_cron); do

    echo "/usr/share/postgresql/extension/$FILE -> /usr/local/share/postgresql/extension/$FILE";
    ln -s /usr/share/postgresql/extension/$FILE /usr/local/share/postgresql/extension/$FILE

done
