#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
GLOB_DIR=$SCRIPT_DIR/..


SERVICES=( recipes gitea joplin )

for service in "${SERVICES[@]}"
do
        cd $GLOB_DIR/$service; ./backup.sh;
done

