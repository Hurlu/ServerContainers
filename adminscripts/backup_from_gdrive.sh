#!/bin/bash

mkdir ~/gdrivebackup
rclone copy rootGdrive: ~/gdrivebackup/.
EPOCH=$(date +%s)
tar -cpf ~/backups/gdrivebackup_$EPOCH.tar ~/gdrivebackup;
rm -rf ~/gdrivebackup
BACKUP_COUNT=$(ls -tU ~/backups/gdrivebackup_* | wc -l)
SIZE_DISK=$(df / --output=avail | tail -1) #if less than 100G available
if [[ $BACKUP_COUNT -gt 10 ]] || [[ $SIZE_DISK -lt 100000000 ]]
then rm $(ls -tU ~/backups/gdrivebackup_* | head -1) # delete oldest backup
fi
