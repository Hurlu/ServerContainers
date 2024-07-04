#!/bin/bash

mkdir ~GDriveBackup/.
rclone copy rootGdrive: ~/GDriveBackup/.
EPOCH=$(date +%s)
tar -cpf ~/backups/GDriveBackup_$EPOCH.tar ~/GDriveBackup;
rm -rf ~/GDriveBackup
BACKUP_COUNT=$(ls -tU ~/backups/ | wc -l)
SIZE_DISK=$(df -h / --output=avail | tail -1) #if less than 100G available
if [[ $BACKUP_COUNT -gt 10 ]] || [[ $SIZE_DISK -lt 100000000 ]]
then rm $(ls -tU ~/backups | head -1) # delete oldest backup
fi
