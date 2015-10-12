# Freq-Out Backup

This is using the [backup gem](http://backup.github.io/backup/v4/).

The image is based on [ruby:slim](https://hub.docker.com/_/ruby/) and has support for [MariaDB client](https://mariadb.org). There's no sendmail support, as we're using Amazon SES for the notifications.

Requirements: 

* a valid configuration under `./config`, mapped to /etc/backup
* access to all the volumes
* links to the non-exposed database volumes 

Example run: 

    $ docker run -it -v /srv/www/mywebsite:/srv/www/mywebsite -v /srv/backups-docker:/srv/backups-docker -v `pwd`/config:/etc/backup --rm --link mywebsite_db_1:db freqout/backup mywebsite_com

Credits: I took initial ideas from [this implementation](https://github.com/tenstartups/backup-service-docker) of the Backup gem, but many choices weren't good for me.
