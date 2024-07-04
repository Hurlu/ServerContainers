SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
GLOB_DIR=$SCRIPT_DIR/..

SERVICES=( traefik wizz ftp recipes teamspeak joplin gitea )

for service in "${SERVICES[@]}"
do
	cd $GLOB_DIR/$service; docker-compose down; docker-compose up -d --build;
done
