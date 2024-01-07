#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

source $SCRIPT_DIR/secrets/joplin.secret
source $SCRIPT_DIR/secrets/joplin_db.secret

docker exec \
-e POSTGRES_USER \
-e POSTGRES_DB \
$(docker ps -qf "name=joplin_db") \
bash -c "pg_dump -U $POSTGRES_USER --clean --no-owner --no-privileges -d $POSTGRES_DB" > $SCRIPT_DIR/postgres_joplin.sql

rclone copy postgres_joplin.sql Gdrive:/
rm -f postgres_joplin.sql
