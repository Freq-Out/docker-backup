FROM ruby:2.2-slim

ENV VERSION=0.1
ENV MARIADB_MAJOR 10.0
ENV BACKUP_VERSION=4.1.12

# Add MariadB keys
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 199369E5404BD5FC7D2FE43BCBCB082A1BB943DB

# Add MariaDB repo
RUN echo "deb http://ftp.osuosl.org/pub/mariadb/repo/$MARIADB_MAJOR/debian jessie main" > /etc/apt/sources.list.d/mariadb.list

RUN apt-get update && apt-get -y install build-essential mariadb-client

RUN gem install backup -v "$BACKUP_VERSION" --no-ri --no-rdoc

# Clean up APT when done.
RUN apt-get remove -y --purge build-essential && apt-get autoremove -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /entrypoint
COPY backup.sh /usr/local/bin/backup

ENTRYPOINT ["/entrypoint"]
