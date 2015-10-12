#!/bin/bash
set -e

BACKUP_SET="${1}"
BACKUP_CONFIG_DIR="/etc/backup"

echo "******* Backuping $BACKUP_SET"

/usr/local/bundle/bin/backup perform --config-file="${BACKUP_CONFIG_DIR}/config.rb" --root-path="/srv/backups-docker" --trigger $BACKUP_SET

