#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

source $SCRIPT_DIR/secrets/joplin.secret
source $SCRIPT_DIR/secrets/joplin_db.secret

docker exec \
-e POSTGRES_USER \
-e POSTGRES_DB \
$(docker ps -qf "name=joplin_db") \
bash -c "psql -U $POSTGRES_USER $POSTGRES_DB" < postgres_joplin.sql
