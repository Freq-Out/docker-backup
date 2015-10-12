# Freq-Out Backup

This container is using the [backup gem](http://backup.github.io/backup/v4/).

The image is based on [ruby:slim](https://hub.docker.com/_/ruby/).

## Support

This container has support for (and is used with):

* Databases: [MariaDB client](https://mariadb.org).
* Email Notifications: Amazon SES (no sendmail)
* Storage: Local and Amazon S3
* Compression: gzip
* Encryption: OpenSSL

## Requirements

* a valid configuration under `./config`, mapped to /etc/backup
* access to all the volumes
* links to the non-exposed database volumes

## Docker Hub

An automated build is available at [freqout/backup](https://hub.docker.com/r/freqout/backup/):

    $ docker pull freqout/backup

## Run


Example run:

    $ docker run -it -v /srv/www/mywebsite:/srv/www/mywebsite -v /srv/backups-docker:/srv/backups-docker -v `pwd`/config:/etc/backup --rm --link mywebsite_db_1:db freqout/backup mywebsite_com

## Credits

I took initial ideas from [this implementation](https://github.com/tenstartups/backup-service-docker) of the Backup gem, but many choices weren't good for me.
